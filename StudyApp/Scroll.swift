//
//  Scroll demo.swift
//  StudyApp
//
//  Created by 清水　佳奈音 on 2023/06/28.
//

import SwiftUI

struct Scroll: View {
    var body: some View {
        ScrollView(){
            ScrollView(.horizontal){
                HStack{
                    timerapp()
                    chartapp()
                    wordapp()
                    todoapp()
                    dayapp()
                    timerapp()
                    chartapp()
                    wordapp()
                    todoapp()
                    dayapp()
                }
                .padding()
            }
            clockWidget()
            CountdownS()
            clockWidget()
            CountdownS()
            clockWidget()
            CountdownS()
            
        }
    }
}

struct Scroll_Previews: PreviewProvider {
    static var previews: some View {
        Scroll()
    }
}
