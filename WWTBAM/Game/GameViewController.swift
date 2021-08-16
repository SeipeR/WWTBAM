//
//  GameViewController.swift
//  WWTBAM
//
//  Created by Дамир Доронкин on 16.08.2021.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var firstAnswerOutlet: UIButton!
    @IBOutlet weak var secondAnswerOutlet: UIButton!
    @IBOutlet weak var thirdAnswerOutlet: UIButton!
    @IBOutlet weak var fourthAnswerOutlet: UIButton!
    
    @IBAction func firstAnswerAction(_ sender: Any) {
        isCorrectAnswer(correctAnswer: correctAnswer, answerLabel: firstAnswerOutlet.titleLabel?.text ?? "")
    }
    @IBAction func secondAnswerAction(_ sender: Any) {
        isCorrectAnswer(correctAnswer: correctAnswer, answerLabel: secondAnswerOutlet.titleLabel?.text ?? "")
    }
    @IBAction func thirdAnswerAction(_ sender: Any) {
        isCorrectAnswer(correctAnswer: correctAnswer, answerLabel: thirdAnswerOutlet.titleLabel?.text ?? "")
    }
    @IBAction func fourthAnswerAction(_ sender: Any) {
        isCorrectAnswer(correctAnswer: correctAnswer, answerLabel: fourthAnswerOutlet.titleLabel?.text ?? "")
    }
    
    var questions = [
        Question(question: "2 + 2", answers: ["1", "2", "3", "4"], correctAnswer: "4"),
        Question(question: "3 + 3", answers: ["6", "21", "13", "4"], correctAnswer: "6"),
        Question(question: "4 + 4", answers: ["11", "2", "8", "1"], correctAnswer: "8")
    ]
    var correctAnswer: String = ""
    var questionNumber: Int = 0
    
    func createQuestion(question: Question) {
        questionLabel.text = question.question
        firstAnswerOutlet.setTitle(question.answers[0] ,for: .normal)
        secondAnswerOutlet.setTitle(question.answers[1] ,for: .normal)
        thirdAnswerOutlet.setTitle(question.answers[2] ,for: .normal)
        fourthAnswerOutlet.setTitle(question.answers[3] ,for: .normal)
        correctAnswer = question.correctAnswer
        questionNumber += 1
    }
    
    func isCorrectAnswer(correctAnswer: String, answerLabel: String) {
        if (correctAnswer == answerLabel) && (questionNumber < questions.count) {
            createQuestion(question: questions[questionNumber])
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createQuestion(question: questions[questionNumber])
    }
    
}
