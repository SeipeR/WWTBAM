//
//  QuestionStrategy.swift
//  WWTBAM
//
//  Created by Дамир Доронкин on 23.08.2021.
//

import Foundation

protocol QuestionStrategy {
    func setQuestionOrder(questions: [Question]) -> [Question]
}
