//
//  Timer.swift
//  StudyApp
//
//  Created by 清水　佳奈音 on 2023/07/05.
//

import SwiftUI

struct TimerView: View {
    @EnvironmentObject var timerModel: TimerModel
    var body: some View {
        VStack{
            Text("Timer")
                .font(.title2.bold())
                .foregroundColor(.black)
            
            GeometryReader{proxy in
                VStack(spacing: 15) {
                    //MARK: Timer Ring
                    ZStack{
                        Circle()
                            .fill(Color.lblue.opacity(0.03))
                            .padding(-40)
                        Circle()
                            .trim(from: 0, to: timerModel.progress)
                            .stroke(Color.lblue.opacity(0.03), lineWidth: 80)
                        //MARK: Shadow
                        Circle()
                            .stroke(Color.customblue,lineWidth: 5)
                            .blur(radius:15)
                            .padding(-2)
                        Circle()
                            .fill(.white)
                        Circle()
                            .trim(from: 0, to: timerModel.progress)
                            .stroke(Color.customblue.opacity(0.7),lineWidth: 10)
                        
                        //MARK: PointMark
                        GeometryReader{proxy in
                            let size = proxy.size
                            
                            Circle()
                                .fill(Color.customblue)
                                .frame(width: 30, height: 30)
                                .overlay(content: {
                                    Circle()
                                        .fill(.white)
                                        .padding(5)
                                })
                                .frame(width: size.width, height: size.height, alignment: .center)
                                .offset(x: size.height / 2)
                                .rotationEffect(.init(degrees: timerModel.progress * 360))
                        }
                        
                        Text(timerModel.timerStringValue)
                            .font(.system(size: 45, weight: .semibold))
                            .rotationEffect(.init(degrees: 90))
                            .animation(.none, value: timerModel.progress)
                    }
                    .padding(60)
                    .frame(height: proxy.size.width)
                    .rotationEffect(.init(degrees: -90))
                    .animation(.easeInOut, value: timerModel.progress)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    
                    Button {
                        if timerModel.isStarted {
                            timerModel.stopTimer()
                            //MARK: Cancell
                            UNUserNotificationCenter.current().removeAllDeliveredNotifications()
                        } else {
                            timerModel.addNewTimer = true
                        }
                        
                    } label: {
                        Image(systemName: !timerModel.isStarted ? "timer" : "stop.fill")
                            .font(.largeTitle.bold())
                            .foregroundStyle(.white.shadow(.inner(radius: 1)))
                            .frame(width: 80, height: 80)
                            .background{
                                Circle()
                                    .fill(Color.customblue)
                            }
                            .shadow(color: Color.customblue, radius: 8, x: 0, y: 0)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                
            }
        }
        .padding()
        .overlay(content: {
            ZStack{
                Color.black
                    .opacity(timerModel.addNewTimer ? 0.25 : 0)
                    .onTapGesture {
                        timerModel.hours = 0
                        timerModel.minutes = 0
                        timerModel.seconds = 0
                        timerModel.addNewTimer = false
                    }
                NewTimerView()
                    .frame(maxHeight: .infinity,alignment: .bottom)
                    .offset(y: timerModel.addNewTimer ? 0 : 400)
            }
            .animation(.easeOut, value: timerModel.addNewTimer)
        })
        .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) {
            _ in
            if timerModel.isStarted{
                timerModel.updateTimer()
            }
        }
        .alert("タイマー終了", isPresented: $timerModel.isFinished) {
            Button("Start New",role: .cancel) {
                timerModel.stopTimer()
                timerModel.addNewTimer = true
            }
            Button("Close",role: .destructive){
                timerModel.stopTimer()
            }
        }
    }
    
    @ViewBuilder
    func NewTimerView()->some View{
        VStack(spacing: 15){
            Text("Add New Timer")
                .font(.title2.bold())
                .foregroundColor(.black)
                .padding(.top,10)
            HStack(spacing: 15){
                Text("\(timerModel.hours) hr")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black.opacity(0.3))
                    .padding(.horizontal,20)
                    .padding(.vertical,12)
                    .background{
                        Capsule()
                            .fill(.black.opacity(0.07))
                    }
                    .contextMenu{
                        ContextMenuOptions(maxValue: 12, hint: "hr") { value in
                            timerModel.hours = value
                        }
                    }
                Text("\(timerModel.minutes) min")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black.opacity(0.3))
                    .padding(.horizontal,20)
                    .padding(.vertical,12)
                    .background{
                        Capsule()
                            .fill(.black.opacity(0.07))
                    }
                    .contextMenu{
                        ContextMenuOptions(maxValue: 60, hint: "min") { value in
                            timerModel.minutes = value
                        }
                    }
                Text("\(timerModel.seconds) sec")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black.opacity(0.3))
                    .padding(.horizontal,20)
                    .padding(.vertical,12)
                    .background{
                        Capsule()
                            .fill(.black.opacity(0.07))
                    }
                    .contextMenu{
                        ContextMenuOptions(maxValue: 60, hint: "sec") { value in
                            timerModel.seconds = value
                        }
                    }
            }
            .padding(.top,10)
            
            Button {
                timerModel.startTimer()
            } label: {
                Text("Save")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding(.horizontal,100)
                    .padding(.vertical)
                    .background{
                        Capsule()
                            .fill(Color.customblue)
                    }
            }
            .disabled(timerModel.seconds == 0)
            .opacity(timerModel.seconds == 0 ? 0.5 : 1)
            .padding(.top)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background{
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .foregroundColor(.white)
        }
    }
    //MARK: Context Menu
    func ContextMenuOptions(maxValue: Int, hint: String, onClick: @escaping (Int)->())->some View{
        ForEach(0...maxValue,id: \.self) {value in
            Button("\(value) \(hint)"){
                onClick(value)
            }
        }
        
    }
}

struct Timer_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
            .environmentObject(TimerModel())
    }
}
