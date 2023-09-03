//
//  todoapp.swift
//  StudyApp
//
//  Created by 清水　佳奈音 on 2023/07/12.
//

import SwiftUI

struct todoapp: View {
    @EnvironmentObject var tabenvironment: TabEnvironment
    var body: some View {
        Button() {
            tabenvironment.tabname = "Todo"
            tabenvironment.tabnumber = 6
            tabenvironment.tabPresent = false
        } label: {
            Image(systemName:"list.bullet.clipboard.fill")
                .font(.system(size:30))
                .foregroundStyle(Color.white
                .shadow(.drop(radius: 1)))
        }
            .frame(width: UIScreen.main.bounds.size.width * 0.15,
                   height: UIScreen.main.bounds.size.width * 0.15
               )
               .background(RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(Color(#colorLiteral(red: 0.4962990284, green: 0.609885931, blue: 0.8117103577, alpha: 1)).gradient)
                   )
    }
}

struct todoapp_Previews: PreviewProvider{
    static var previews: some View {
        todoapp()
    }
}
