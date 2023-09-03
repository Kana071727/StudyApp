//
//  ContentView.swift
//  StudyApp
//
//  Created by 清水　佳奈音 on 2023/05/24.
//

import SwiftUI

@available(iOS 17.0, *)
struct ContentView: View {
    @EnvironmentObject var tabenvironment: TabEnvironment
    var body: some View {
        NavigationView{
            ZStack{
                if tabenvironment.tabnumber == 0{
                    Scroll()
                } else if tabenvironment.tabnumber == 1 {
                    Scheduleview()
                } else if tabenvironment.tabnumber == 2 {
                    WorkbookHome()
                } else if tabenvironment.tabnumber == 3 {
                    
                } else if tabenvironment.tabnumber == 4 {
                    TimerView()
                } else if tabenvironment.tabnumber == 5{
                    CountDownSetting()
                } else if tabenvironment.tabnumber == 6{
                    TodoList()
                }
                
                VStack(){
                    Spacer()
                    if tabenvironment.tabPresent == true {
                        TabButton1()
                    }
                }
            }
            .navigationTitle(tabenvironment.tabname)
            
        }
        
    }
}

@available(iOS 17.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TabEnvironment())
    }
}
enum Tab: Int, Identifiable, CaseIterable, Comparable {
    static func < (lhs: Tab, rhs: Tab) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
    
    case home, calendar, book, chart
    
    internal var id: Int { rawValue }
    
    var icon: String {
        switch self {
        case .home:
            return "house.fill"
        case .calendar:
            return "calendar"
        case .book:
            return "books.vertical.fill"
        case .chart:
            return "chart.xyaxis.line"
        }
    }
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .calendar:
            return "Planner"
        case .book:
            return "Books"
        case .chart:
            return "Chart"
        }
    }
    
    var color: Color {
        switch self {
        case .home:
            return Color.dpurple
        case .calendar:
            return Color.coral
        case .book:
            return Color.customorange
        case .chart:
            return Color.lblue
        }
    }
    var view: Int{
        switch self {
        case .home:
            return 0
        case .calendar:
            return 1
        case .book:
            return 2
        case .chart:
            return 3
        }
    }
}


