//
//  Timer.swift
//  StudyApp
//
//  Created by 清水　佳奈音 on 2023/07/05.
//

import SwiftUI

struct TimerView: View {
    @EnvironmentObject var tabenvironment: TabEnvironment
    
    var body: some View {
        VStack{
            Text("05:20")
                .font(.largeTitle)
                .fontWeight(.heavy)
                
            ZStack{
                Circle()
                    .fill(Color.green)
                    .frame(width:UIScreen.main.bounds.size.width * 0.6,
                           height: UIScreen.main.bounds.size.width * 0.6)
                Circle()
                    .fill(Color.black)
                    .frame(width:UIScreen.main.bounds.size.width * 0.1,
                           height: UIScreen.main.bounds.size.width * 0.1)
            }
           
            Slider(value: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(10)/*@END_MENU_TOKEN@*/)
                .padding([.top, .leading, .trailing], 20.0)
            Button("To Home") {
                tabenvironment.tabnumber = 0
                tabenvironment.tabname = "Home"
                tabenvironment.tabPresent = true
            }
            Spacer()
        }
        .padding()
       
        
        
    }
}

struct Timer_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
