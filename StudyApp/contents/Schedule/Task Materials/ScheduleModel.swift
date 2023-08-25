//
//  ScheduleMode.swift
//  StudyApp
//
//  Created by 清水　佳奈音 on 2023/08/23.
//

import SwiftUI

struct Task: Identifiable {
    var id: UUID = .init()
    var taskTitle: String
    var creationDate: Date = .init()
    var isCompleted: Bool = false
    var tint: Color
}

var sampleTasks: [Task] = [
    .init(taskTitle: "Record Video", creationDate: .updateHour(-5),isCompleted: true, tint: .cyan),
    .init(taskTitle: "Redesign Website",creationDate: .updateHour(-3),isCompleted: false, tint: .pink),
    .init(taskTitle: "Go for a Walk",creationDate: .updateHour(-4),isCompleted: false, tint: .green),
    .init(taskTitle: "Edit Video",creationDate: .updateHour(0),isCompleted: true, tint: .orange),
    .init(taskTitle: "Publish Video",creationDate: .updateHour(2),isCompleted: false, tint: .cyan),
    .init(taskTitle: "Tweet about new Video",creationDate: .updateHour(1),isCompleted: true, tint: .yellow),
]

extension Date {
    static func updateHour(_ value: Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .hour, value: value, to: .init()) ?? .init()
    }
}
