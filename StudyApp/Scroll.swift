//
//  Scroll demo.swift
//  StudyApp
//
//  Created by 清水　佳奈音 on 2023/06/28.
//

import SwiftUI

struct Scroll: View {
    var body: some View {
        VStack(alignment:.leading){
            Text("My Study")
                .font(.title)
                .fontWeight(.semibold)
                .padding()
            ScrollView(){
                HStack(alignment:.center){
                        timerapp()
                        chartapp()
                        wordapp()
                        recordapp()
                        dayapp()
                        timerapp()
                        chartapp()
                        wordapp()
                        recordapp()
                        dayapp()
                    }
                    .padding()
                clockWidget()
                CountdownS()
                clockWidget()
                CountdownS()
                clockWidget()
                CountdownS()
                
            }
        }
    }
}

struct Scroll_Previews: PreviewProvider {
    static var previews: some View {
        Scroll()
    }
}
