//
//  Timer.swift
//  StudyApp
//
//  Created by 清水　佳奈音 on 2023/07/05.
//

import SwiftUI

struct TimerView: View {
    @EnvironmentObject var tabenvironment: TabEnvironment
    @StateObject var timerManager = TimerManager()
    
    var body: some View {
        VStack {
            //MARK: Background
            
            //MARK: Progress Ring
            
            CircleProgressBar()
            HStack(spacing: 60) {
                Button{
                    timerManager.toggleTimerState()
                } label: {
                    Text(timerManager.timerState == .notStarted ? "Start" : "Stop")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 8)
                        .background(.thinMaterial)
                        .cornerRadius(20)
                }
            }
            .padding()
        }
    }
}

struct Timer_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
