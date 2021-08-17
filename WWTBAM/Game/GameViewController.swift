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
        Question(
            question: "2 + 2",
            answers: Answers(firstAnswer: "1", secondAnswer: "2", thirdAnswer: "3", fourthAnswer: "4"),
            correctAnswer: "4"
        ),
        Question(
            question: "3 + 3",
            answers: Answers(firstAnswer: "4", secondAnswer: "6", thirdAnswer: "7", fourthAnswer: "11"),
            correctAnswer: "6"
        ),
        Question(
            question: "4 + 4",
            answers: Answers(firstAnswer: "11", secondAnswer: "2", thirdAnswer: "8", fourthAnswer: "1"),
            correctAnswer: "8"
        ),
        Question(
            question: "12 + 4",
            answers: Answers(firstAnswer: "6", secondAnswer: "16", thirdAnswer: "23", fourthAnswer: "98"),
            correctAnswer: "16"
        ),
        Question(
            question: "15 + 15",
            answers: Answers(firstAnswer: "30", secondAnswer: "75", thirdAnswer: "1387", fourthAnswer: "1231"),
            correctAnswer: "30"
        ),
        Question(
            question: "43 + 19",
            answers: Answers(firstAnswer: "19", secondAnswer: "13", thirdAnswer: "62", fourthAnswer: "0"),
            correctAnswer: "62"
        )
    ]
    var correctAnswer: String = ""
    var questionNumber: Int = 0
    var gameSession = GameSession()
    
    func createQuestion(question: Question) {
        questionLabel.text = question.question
        firstAnswerOutlet.setTitle(question.answers.firstAnswer ,for: .normal)
        secondAnswerOutlet.setTitle(question.answers.secondAnswer ,for: .normal)
        thirdAnswerOutlet.setTitle(question.answers.thirdAnswer ,for: .normal)
        fourthAnswerOutlet.setTitle(question.answers.fourthAnswer ,for: .normal)
        correctAnswer = question.correctAnswer
        questionNumber += 1
    }
    
    func isCorrectAnswer(correctAnswer: String, answerLabel: String) {
        if (correctAnswer == answerLabel) && (questionNumber < questions.count) {
            createQuestion(question: questions[questionNumber])
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createQuestion(question: questions[questionNumber])
    }
    
}
