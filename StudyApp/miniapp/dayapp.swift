//
//  dayapp.swift
//  StudyApp
//
//  Created by 清水　佳奈音 on 2023/07/12.
//

import SwiftUI

struct dayapp: View {
    @EnvironmentObject var tabenvironment: TabEnvironment
    var body: some View {
        Button() {
            tabenvironment.tabname = "Count Down"
            tabenvironment.tabnumber = 5
            tabenvironment.tabPresent = false
        } label: {
            Image(systemName:"01.square.fill")
                .font(.system(size: 35))
                .foregroundStyle(Color.white
                    .shadow(.drop(radius: 1)))
        }
            .frame(width: UIScreen.main.bounds.size.width * 0.15,
                   height: UIScreen.main.bounds.size.width * 0.15
               )
               .background(RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(Color.yellow.gradient)
                   )
    }
}

struct dayapp_Previews: PreviewProvider{
    static var previews: some View {
        dayapp()
    }
}
