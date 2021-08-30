//
//  NewQuestionViewController.swift
//  WWTBAM
//
//  Created by Дамир Доронкин on 23.08.2021.
//

import UIKit

class NewQuestionViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var questionTF: UITextField!
    @IBOutlet weak var firstAnswerTF: UITextField!
    @IBOutlet weak var secondAnswerTF: UITextField!
    @IBOutlet weak var thirdAnswerTF: UITextField!
    @IBOutlet weak var fourthAnswerTF: UITextField!
    @IBOutlet weak var correctAnswerTF: UITextField!
    @IBAction func addQuestionAction(_ sender: Any) {
        let question = addQuestion(question: questionTF.text ?? "", answers: createAnswers(firstAnswer: firstAnswerTF.text ?? "", secondAnswer: secondAnswerTF.text ?? "", thirdAnswer: thirdAnswerTF.text ?? "", fourthAnswer: fourthAnswerTF.text ?? ""), correctAnswer: correctAnswerTF.text ?? "")
        
        GameSingleton.instance.addQuestion(question: question)
    }
    
    func createAnswers(
        firstAnswer: String,
        secondAnswer: String,
        thirdAnswer: String,
        fourthAnswer: String
    ) -> Answers {
        
        let answers = Answers(firstAnswer: firstAnswer, secondAnswer: secondAnswer, thirdAnswer: thirdAnswer, fourthAnswer: fourthAnswer)
        
        return answers
        
    }
    
    func addQuestion(
        question: String,
        answers: Answers,
        correctAnswer: String
    ) -> Question {
        
        let question = Question(question: question, answers: answers, correctAnswer: correctAnswer)
        
        return question
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                          action: #selector(hideKeyboard))
        scrollView?.addGestureRecognizer(tapGestureRecognizer)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        // Уведомление при появлении клавиатуры
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWasShown),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        // Уведомление при скрытии клавиатуры
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillBeHidden(notification:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillShowNotification,
                                                  object: nil)
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillHideNotification,
                                                  object: nil)
    }
    
    @objc func hideKeyboard() {
        scrollView?.endEditing(true)
    }

    @objc func keyboardWasShown(notification: Notification) {
        // Размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        // Добавляется отступ ниже UIScrollView, равный размеру клавиатуры
        scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    // При исчезновении клавиатуры, отступ ниже UIScrollView становится равен 0
    @objc func keyboardWillBeHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
    }
}
