//
//  Workbookmodel.swift
//  StudyApp
//
//  Created by 清水　佳奈音 on 2023/08/30.
//

import SwiftUI
import SwiftData


@available(iOS 17.0, *)
@Model
class Questions: Identifiable {
    var id: UUID
    var QuestionTitle: String
    var question: String
    var detail: String
    var tag: String
    var answer: String
    var result: Int
    
    init(id: UUID = .init(), QuestionTitle: String, question: String, detail: String, tag: String, answer: String, result: Int = 0) {
        self.id = id
        self.QuestionTitle = QuestionTitle
        self.question = question
        self.detail = detail
        self.tag = tag
        self.answer = answer
        self.result = result
    }
    
}

