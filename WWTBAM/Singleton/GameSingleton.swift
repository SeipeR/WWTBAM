//
//  GameSingleton.swift
//  WWTBAM
//
//  Created by Дамир Доронкин on 17.08.2021.
//

import Foundation

class GameSingleton {
    
    private let caretaker = ResultsCaretaker()
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
            caretaker.saveResults(results: results)
        }
    }
    
    private init() {
        results = caretaker.loadResults() ?? []
    }
    
    func addResult(result: GameSession) {
        results.append(result)
    }
    
    func clearResults() {
        results.removeAll()
    }
    
}
