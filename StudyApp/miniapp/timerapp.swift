//
//  Timer.swift
//  StudyApp
//
//  Created by 清水　佳奈音 on 2023/07/05.
//

import SwiftUI

struct timerapp: View {
    @EnvironmentObject var tabenvironment: TabEnvironment
    var body: some View {
        Button() {
            tabenvironment.tabnumber = 4
            tabenvironment.tabPresent = false
            tabenvironment.tabname = "Timer"
        } label: {
            Image(systemName:"timer")
                .font(.system(size: 35))
                .foregroundStyle(Color.white
                    .shadow(.drop(radius: 1)))
        }
        .frame(width: UIScreen.main.bounds.size.width * 0.15,
               height: UIScreen.main.bounds.size.width * 0.15
        )
        .background(RoundedRectangle(cornerRadius: 15)
            .foregroundStyle(Color.lblue.gradient)
            )
        
    }
    
    
}

struct timerapp_Previews: PreviewProvider{
    static var previews: some View {
        timerapp()
    }
}
