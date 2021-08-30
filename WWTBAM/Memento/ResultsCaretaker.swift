//
//  ResultsCaretaker.swift
//  WWTBAM
//
//  Created by Дамир Доронкин on 18.08.2021.
//

import Foundation

class ResultsCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "key"
    
    func saveResults(results: [GameSession]) {
        do {
            let data = try encoder.encode(results)
            UserDefaults.standard.setValue(data, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadResults() -> [GameSession]? {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return nil
        }
        
        do {
            return try decoder.decode([GameSession].self, from: data)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
}
