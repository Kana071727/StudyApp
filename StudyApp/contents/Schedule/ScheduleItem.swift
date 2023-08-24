//
//  ScheduleItem.swift
//  StudyApp
//
//  Created by 清水　佳奈音 on 2023/08/22.
//

import SwiftUI

struct ScheduleItem: View {
    var body: some View {
        ZStack(alignment:.leading){
            Capsule()
                .frame(width:UIScreen.main.bounds.size.width * 0.85, height: UIScreen.main.bounds.size.width * 0.2)
                .foregroundStyle(Color.green.gradient.opacity(0.6))
            HStack{
                Image(systemName:"photo")
                    .font(.system(size: 35))
                    .foregroundStyle(Color.white.gradient)
                VStack(alignment:.leading){
                    Text("yotei")
                    Text("10:00~20:00")
                    Text("@00")
                }
                .foregroundColor(Color.black.opacity(0.7))
                
            }
            .padding()
        }
    }
}


struct ScheduleItem_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleItem()
    }
}
