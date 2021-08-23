//
//  Question.swift
//  WWTBAM
//
//  Created by Дамир Доронкин on 16.08.2021.
//

import Foundation

struct Question: Codable {
    let question: String
    let answers: Answers
    let correctAnswer: String
}
