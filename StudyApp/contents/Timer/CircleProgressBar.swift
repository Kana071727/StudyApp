//
//  CircularProgressBar.swift
//  StudyApp
//
//  Created by 清水　佳奈音 on 2023/05/31.
//

import SwiftUI

struct CircleProgressBar: View {

    @State var progress = 0.5
    let timer = Timer
        .publish(every: 1, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        ZStack{
            // MARK: Progress Ring
            Circle()
                .stroke(lineWidth: 20)
                .foregroundColor(.gray)
                .opacity(0.1)
            Circle()
                .trim(from: 0.0, to: min(progress, 1.0))
                .stroke(AngularGradient(gradient: Gradient(colors: [Color.cyan,Color.pink,Color.purple,Color.cyan]), center: .center), style: StrokeStyle(lineWidth: 15.0, lineCap: .round, lineJoin: .round))
                .rotationEffect((Angle(degrees: 270)))
                .animation(.easeInOut(duration: 1.0), value: progress)
            VStack(spacing: 30) {
                // MARK: Elapsed Time
                VStack(spacing : 5) {
                    Text("Elapsed time")
                        .opacity(0.7)
                    
                    Text("0:00")
                        .font(.title)
                        .fontWeight(.bold)
                }
                .padding(.top)
                // MARK: Remain Time
                VStack(spacing : 5) {
                    Text("Remainin  time")
                        .opacity(0.7)
                    
                    Text("0:00")
                        .font(.title2)
                        .fontWeight(.bold)
                }
            }
        }
        .frame(width: 250, height: 250)
        .padding()
        .onAppear {
            progress = 1
        }
        
    }
}

struct CircleProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        CircleProgressBar(progress: 0.8)
    }
}
