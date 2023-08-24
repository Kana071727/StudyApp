//
//  ScheduleHome.swift
//  StudyApp
//
//  Created by 清水　佳奈音 on 2023/08/23.
//

import SwiftUI

@available(iOS 17.0, *)
struct ScheduleHome: View {
    //MARK: Task Manager Properties
    @State private var currentDate: Date = .init()
    @State private var weekSlider:[[Date.WeekDay]] = []
    @State private var currentWeekIndex: Int = 1
    @State private var creatWeek: Bool = false
    //MARK: Animation Namespace
    @Namespace private var animation
    var body: some View {
        VStack(alignment: .leading, spacing: 0, content: {
            //MARK: Header View
            HeaderView()
        })
        .vSpacing(.top)
        .onAppear(perform: {
            if weekSlider.isEmpty {
                let currentWeek = Date().fetchWeek()
                if let firstDate = currentWeek.first?.date {
                    weekSlider.append(firstDate.creatPreviousWeek())
                }
                
                weekSlider.append(currentWeek)
                
                if let lastDate = currentWeek.last?.date {
                    weekSlider.append(lastDate.creatNextWeek())
                }
            }
                
        })
    }
    //MARK: Header View
    @available(iOS 17.0, *)
    @ViewBuilder
    func HeaderView() -> some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(spacing: 5){
                Text(currentDate.format("MMMM"))
                    .foregroundStyle(.blue)
                
                Text(currentDate.format("YYYY"))
                    .foregroundColor(.gray)
            }
            .font(.title.bold())
            Text(currentDate.formatted(date: .complete, time: .omitted))
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
            //MARK: Week Slider
            TabView(selection: $currentWeekIndex) {
                ForEach(weekSlider.indices, id: \.self) { index in
                    let week = weekSlider[index]
                    WeekView(week)
                        .padding(.horizontal, 15)
                        .tag(index)
                }
                
            }
            .padding(.horizontal, -15)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(height: 90)
        }
        .padding(15)
        .hSpacing(.leading)
        .background(.white)
        .onChange(of: currentWeekIndex, initial: false) { oldValue, newValue in
            if newValue == 0 || newValue == (weekSlider.count - 1) {
                creatWeek = true
            }
        }
    }
    //MARK: Week View
    @ViewBuilder
    func WeekView(_ week: [Date.WeekDay]) -> some View {
        HStack(spacing: 0) {
            ForEach(week) { day in
                VStack(spacing: 8) {
                    Text(day.date.format("E"))
                        .font(.callout)
                        .fontWeight(.medium)
                        .foregroundStyle(.gray)
                    Text(day.date.format("dd"))
                        .font(.callout)
                        .fontWeight(.bold)
                        .foregroundStyle((isSameDate(day.date, currentDate) ? .white : .gray))
                        .frame(width: 35, height: 35)
                        .background(content: {
                            if isSameDate(day.date, currentDate) {
                                Circle()
                                    .fill(.blue)
                                    .matchedGeometryEffect(id: "TABINDICATOR", in: animation)
                            }
                            
                            //MARK: Indicator to Show, Which is Today;s Date
                            if day.date.isToday {
                                Circle()
                                    .fill(.cyan)
                                    .frame(width: 5, height: 5)
                                    .vSpacing(.bottom)
                                    .offset(y: 11)
                            }
                        })
                        .background(.white.shadow(.drop(radius: 1)), in: Circle())
                }
                .hSpacing(.center)
                .contentShape(.rect)
                .onTapGesture {
                    //MARK: Updating Current Date
                    withAnimation(.snappy) {
                        currentDate = day.date
                    }
                }
            }
        }
        .background {
            GeometryReader {
                let minX = $0.frame(in: .global).minX
                
                Color.clear
                    .preference(key: OffsetKey.self, value: minX)
                    .onPreferenceChange(OffsetKey.self) { value in
                        if value.rounded() == 15 && creatWeek {
                            paginateWeek()
                            creatWeek = false
                        }
                    }
            }
        }
    }
    func paginateWeek() {
        if let firstDate = weekSlider[currentWeekIndex].first?.date, currentWeekIndex == 0 {
            weekSlider.insert(firstDate.creatPreviousWeek(), at: 0)
            weekSlider.removeLast()
            currentWeekIndex = 1
            
        }
        if let lastDate = weekSlider[currentWeekIndex].last?.date, currentWeekIndex == (weekSlider.count - 1) {
            weekSlider.append(lastDate.creatNextWeek())
            weekSlider.removeFirst()
            currentWeekIndex = weekSlider.count - 2
        }
    }
}

@available(iOS 17.0, *)
struct ScheduleHome_Previews: PreviewProvider {
    static var previews: some View {
        Scheduleview()
    }
}
