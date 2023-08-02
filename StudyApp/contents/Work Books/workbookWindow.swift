//
//  workbookwindow.swift
//  StudyApp
//
//  Created by 清水　佳奈音 on 2023/06/07.
//

import SwiftUI

struct workbookWindow: View {
    var body: some View {
        VStack{
            Text("textbook 1")
            VStack(alignment:.leading){
                Text("akk")
                Text("aaaa")
            }
            Spacer()
            Button("やる") {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            }
            .frame(width: UIScreen.main.bounds.size.width * 0.6,
                   height: 60)
            .background(RoundedRectangle(cornerRadius: 30)
                .fill(Color.yellow))
            
            Button("キャンセル") {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            }
            .frame(width: UIScreen.main.bounds.size.width * 0.6,
                   height: 60)
            .background(RoundedRectangle(cornerRadius: 30)
                .fill(Color.yellow))
        }
        .padding(.top,20)
        .padding(.all, 40)
        .frame(
            minWidth: UIScreen.main.bounds.size.width * 0.9,
            maxWidth: UIScreen.main.bounds.size.width * 0.9,
            minHeight: UIScreen.main.bounds.size.height * 0.55,
            maxHeight: UIScreen.main.bounds.size.height * 0.55
        )
        .background(RoundedRectangle(cornerRadius: 30)
            .fill(Color.white)
            .shadow(color: .gray.opacity(0.7), radius: 5))
    }
    
}

struct workbookwindow_Previews: PreviewProvider {
    static var previews: some View {
        workbookWindow()
    }
}
