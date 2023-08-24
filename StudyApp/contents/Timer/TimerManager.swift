//
//  TimerManager.swift
//  StudyApp
//
//  Created by 清水　佳奈音 on 2023/08/23.
//

import Foundation
enum TimerState {
    case notStarted
    case Started
    case countUp
    case countDown
}
class TimerManager: ObservableObject {
    @Published private(set) var timerState: TimerState = .notStarted
    
    func toggleTimerState() {
        timerState = timerState == .notStarted ? .Started : .notStarted
    }
    
}
