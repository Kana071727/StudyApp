//
//  CountdownS.swift
//  StudyApp
//
//  Created by 清水　佳奈音 on 2023/06/21.
//

import SwiftUI

struct CountdownS: View {
    var body: some View {
        HStack(alignment: .top){
            ZStack{
                ///仮円形プログレス
                Circle()
                    .fill(Color.green)
                    .frame(width:UIScreen.main.bounds.size.width * 0.35,
                           height: UIScreen.main.bounds.size.width * 0.35)
                Circle()
                    .fill(Color.white)
                    .frame(width:UIScreen.main.bounds.size.width * 0.3,
                           height: UIScreen.main.bounds.size.width * 0.3)
                VStack{
                    Text("◯◯まで")
                    Text("日")
                }
            }
            Spacer()
            VStack(alignment: .trailing){
                Text("2023 July")
                    .font(.title)
                Spacer()
                Text("M T W T F S S")
                Divider()
                Text("01 02 03 04 05 06 07")
                Spacer()
                
            }
            
        }
        .padding()
        .frame(width: UIScreen.main.bounds.size.width * 0.90,height: UIScreen.main.bounds.size.width * 0.45)
        .background(RoundedRectangle(cornerRadius: 30)
            .fill(Color.white)
            .shadow(color: .gray.opacity(0.7), radius: 5))
    }
}

struct CountdownS_Previews: PreviewProvider {
    static var previews: some View {
        CountdownS()
    }
}
