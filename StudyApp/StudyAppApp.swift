//
//  StudyAppApp.swift
//  StudyApp
//
//  Created by 清水　佳奈音 on 2023/05/24.
//

import SwiftUI

@available(iOS 17.0, *)
@main
struct StudyAppApp: App {
    @StateObject var timerModel: TimerModel = .init()
    @Environment(\.scenePhase) var phase
    @State var lastActiveTimeStamp: Date = Date()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(TabEnvironment())
                .environmentObject(timerModel)
        }
        .onChange(of: phase) { newValue in
            if timerModel.isStarted{
                if newValue == .background{
                    lastActiveTimeStamp = Date()
                }
                if newValue == .active{
                    let currentTimeStampDiff = Date().timeIntervalSince(lastActiveTimeStamp)
                    if timerModel.totalSeconds - Int(currentTimeStampDiff) <= 0 {
                        timerModel.isStarted = false
                        timerModel.totalSeconds = 0
                        timerModel.isFinished = true
                    }else{
                        timerModel.totalSeconds -= Int(currentTimeStampDiff)
                    }
                }
            }
        }
        .modelContainer(for: Task.self)
       // .modelContainer(for: Questions.self)
    }
}
