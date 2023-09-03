//
//  ScheduleMode.swift
//  StudyApp
//
//  Created by 清水　佳奈音 on 2023/08/23.
//

import SwiftUI
import SwiftData

@available(iOS 17.0, *)
@Model
class Task: Identifiable {
    var id: UUID
    var taskTitle: String
    var creationDate: Date
    var isCompleted: Bool
    var tint: String
    
    init(id: UUID = .init(), taskTitle: String, creationDate: Date = .init(), isCompleted: Bool = false, tint: String) {
        self.id = id
        self.taskTitle = taskTitle
        self.creationDate = creationDate
        self.isCompleted = isCompleted
        self.tint = tint
    }
    var tintColor: Color {
        switch tint {
        case "TaskColor1":
            return Color("TaskColor1")
        case "TaskColor2":
            return Color("TaskColor2")
        case "TaskColor3":
            return Color("TaskColor3")
        case "TaskColor4":
            return Color("TaskColor4")
        case "TaskColor5":
            return Color("TaskColor5")
        default: return .black
        }
    }
}


extension Date {
    static func updateHour(_ value: Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .hour, value: value, to: .init()) ?? .init()
    }
}
