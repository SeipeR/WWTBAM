//
//  GameSingleton.swift
//  WWTBAM
//
//  Created by Дамир Доронкин on 17.08.2021.
//

import Foundation

class GameSingleton {
    
    private let resultsCaretaker = ResultsCaretaker()
    private let userQuestionsCaretaker = UserQuestionsCaretaker()
    static let instance = GameSingleton()
    
    var percentage: Int = 0
    var session: GameSession? {
        didSet {
            percentage = Int(round((Double(session!.correctAnswersCount) / Double(session!.questionsCount)) * 100))
            session?.percentage = percentage
        }
    }
    private(set) var results: [GameSession] {
        didSet {
            resultsCaretaker.saveResults(results: results)
        }
    }
    var isDirectQuestionsOrder = true
    
    private(set) var userQuestions: [Question] {
        didSet {
            userQuestionsCaretaker.saveQuestions(questions: userQuestions)
        }
    }
    
    private init() {
        results = resultsCaretaker.loadResults() ?? []
        userQuestions = userQuestionsCaretaker.loadQuestions() ?? []
    }
    
    func addResult(result: GameSession) {
        results.append(result)
    }
    
    func clearResults() {
        results.removeAll()
    }
    
    func addQuestion(question: Question) {
        userQuestions.append(question)
    }
}
