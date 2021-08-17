//
//  GameSingleton.swift
//  WWTBAM
//
//  Created by Дамир Доронкин on 17.08.2021.
//

import Foundation

class GameSingleton {
    
    static let instance = GameSingleton()
    
    var session: GameSession?
    
    private init() {}
}
