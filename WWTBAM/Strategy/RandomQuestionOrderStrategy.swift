//
//  RandomQuestionOrderStrategy.swift
//  WWTBAM
//
//  Created by Дамир Доронкин on 23.08.2021.
//

import Foundation

class RandomQuestionOrderStrategy: QuestionStrategy {
    
    func setQuestionOrder(questions: [Question]) -> [Question] {
        return questions.shuffled()
    }
    
}
