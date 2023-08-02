//
//  CountDownSetting.swift
//  StudyApp
//
//  Created by 清水　佳奈音 on 2023/08/02.
//

import SwiftUI

struct CountDownSetting: View {
    @EnvironmentObject var tabenvironment: TabEnvironment
    @State var countdown = Date()
    @State var countdownname = ""
    @State var countdownColor = Color.red
    @State var today = Date()
    
    var body: some View {
        let span = countdown.timeIntervalSinceNow
        let dayspan = span/60/60/24
        VStack{
            Spacer()
                Button("To Home"){
                    tabenvironment.tabnumber = 0
                    tabenvironment.tabPresent = true
                    tabenvironment.tabname = "Home"
                }
            .padding()
            ZStack{
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: UIScreen.main.bounds.size.width * 0.6,
                           height: UIScreen.main.bounds.size.width * 0.6
                    )
                    .foregroundStyle(countdownColor.gradient)
                VStack(alignment: .leading){
                    HStack{
                        Text(countdownname)
                        Text("まであと")
                    }
                    HStack(alignment: .bottom){
                        Text(String(Int(dayspan)))
                            .font(.system(size:30))
                        Text("日")
                    }
                }
            }
            List{
                TextField("名前",text: $countdownname)
                DatePicker(selection: $countdown, displayedComponents: .date, label: {Text("日付")})
                ColorPicker("Color", selection: $countdownColor)
            }
            
        }
    }
}

var dateFormat: DateFormatter {
    let df = DateFormatter()
    df.locale = Locale(identifier: "ja_JP")
    df.calendar = Calendar(identifier: .japanese)
    df.dateStyle = .short
    
    return df
}
struct CountDownSetting_Previews: PreviewProvider {
    static var previews: some View {
        CountDownSetting()
    }
}
