//
//  Dayplannner.swift
//  StudyApp
//
//  Created by 清水　佳奈音 on 2023/08/23.
//

import Foundation
class DayPlanner: ObservableObject {
    @Published private var calendarModel = Mycalendar()
    
    var currentDate: Date {
        return calendarModel.currentDate
    }
    func setCurrentDate(to dateStr: String){
        calendarModel.setCurrentDate(to: dateStr)
    }
    
    func dates() -> [Date] {
        calendarModel.dateInYear()
    }
}
