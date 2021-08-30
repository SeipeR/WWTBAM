//
//  GameSession.swift
//  WWTBAM
//
//  Created by Дамир Доронкин on 17.08.2021.
//

import Foundation


class GameSession: Codable {
    
    var correctAnswersCount: Int = 0
    var questionsCount: Int = 0
    var date: Date = Date()
    var percentage = 0
    
}

extension GameSession: GameViewControllerDelegate {
    
    func didEndGame(currentSession: GameSession) {
        GameSingleton.instance.session = currentSession
    }
    
}
