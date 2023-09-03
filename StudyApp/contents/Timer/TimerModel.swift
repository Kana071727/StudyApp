//
//  TimerManager.swift
//  StudyApp
//
//  Created by 清水　佳奈音 on 2023/08/23.
//

import Foundation
import SwiftUI

class TimerModel: NSObject,ObservableObject,UNUserNotificationCenterDelegate {
    //MARK: Timer Properties
    @Published var progress: CGFloat = 1
    @Published var timerStringValue: String = "00:00"
    @Published var isStarted: Bool = false
    @Published var addNewTimer: Bool = false
    
    @Published var hours : Int = 0
    @Published var minutes : Int = 0
    @Published var seconds : Int = 0
    
    //MARK: Total Seconds
    @Published var totalSeconds : Int = 0
    @Published var staticTotalSeconds: Int = 0
    
    //MARK: Post Timer Properties
    @Published var isFinished: Bool = false
    
    override init() {
        super.init()
        self.authorizeNotification()
    }
    
    //MARK: Notification Access
    func authorizeNotification(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.sound,.alert,.badge]) { _, _ in
        }
        UNUserNotificationCenter.current().delegate = self
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.sound,.banner])
    }
    
    //MARK: Starting Timer
    func startTimer(){
        withAnimation(.easeInOut(duration: 0.25)){isStarted = true}
        //MARK: String Time Value
        timerStringValue = "\(hours == 0 ? "" : "\(hours):")\(minutes >= 10 ? "\(minutes)" : "0\(minutes)"):\(seconds >= 10 ? "\(seconds)" : "0\(seconds)")"
        //MARK: Calculating
        totalSeconds = (hours * 3600) + (minutes * 60) + seconds
        staticTotalSeconds = totalSeconds
        addNewTimer = false
        addNotification()
    }
    //MARK: StoppingTimer
    func stopTimer(){
        withAnimation{
            isStarted = false
            hours = 0
            minutes = 0
            seconds = 0
            progress = 1
        }
        totalSeconds = 0
        staticTotalSeconds = 0
        timerStringValue = "00:00"
    }
    //MARK: UpdatingTimer
    func updateTimer(){
        totalSeconds -= 1
        progress = CGFloat(totalSeconds) / CGFloat(staticTotalSeconds)
        progress = (progress < 0 ? 0 : progress)
        hours = totalSeconds / 3600
        minutes = (totalSeconds / 60) % 60
        seconds = (totalSeconds % 60)
        timerStringValue = "\(hours == 0 ? "" : "\(hours):")\(minutes >= 10 ? "\(minutes)" : "0\(minutes)"):\(seconds >= 10 ? "\(seconds)" : "0\(seconds)")"
        if hours == 0 && minutes == 0 && seconds == 0{
            isStarted = false
            isFinished = true
        }
    }
    func addNotification(){
        let content = UNMutableNotificationContent()
        content.title = "Smart Path"
        content.subtitle = "タイマーが終了しました"
        content.sound = UNNotificationSound.default
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(staticTotalSeconds), repeats: false))
        
        UNUserNotificationCenter.current().add(request)
    }
}
