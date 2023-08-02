//
//  ClockSmall.swift
//  StudyApp
//
//  Created by 清水　佳奈音 on 2023/06/21.
//

import SwiftUI

struct ClockSmall: View {
    var body: some View {
        HStack(){
            ///仮の円形プログレス（後でView作る）
            ZStack{
                Circle()
                    .fill(Color.green)
                    .frame(width:UIScreen.main.bounds.size.width * 0.35,
                           height: UIScreen.main.bounds.size.width * 0.35)
                Circle()
                    .fill(Color.white)
                    .frame(width:UIScreen.main.bounds.size.width * 0.3,
                           height: UIScreen.main.bounds.size.width * 0.3)
                Text("00:00")
            }
            ///ここまで
        }
        .frame(
            width: UIScreen.main.bounds.size.width * 0.45,
            height: UIScreen.main.bounds.size.width * 0.45
        )
        .background(RoundedRectangle(cornerRadius: 30)
            .fill(Color.white)
            .shadow(color: .gray.opacity(0.7), radius: 5))
    }
}

struct ClockSmall_Previews: PreviewProvider {
    static var previews: some View {
        ClockSmall()
    }
}
