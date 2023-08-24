//
//  workbookItem.swift
//  StudyApp
//
//  Created by 清水　佳奈音 on 2023/08/02.
//

import SwiftUI

struct workbookItem: View {
    var body: some View {
        VStack(alignment:.leading){
            ZStack(alignment:.bottom){
                RoundedRectangle(cornerRadius: 15)
                    .frame(width:UIScreen.main.bounds.size.width * 0.45, height: UIScreen.main.bounds.size.width * 0.3)
                    .foregroundStyle(Color.green.gradient.opacity(0.6))
                RoundedRectangle(cornerRadius: 15)
                    .frame(width:UIScreen.main.bounds.size.width * 0.3, height: UIScreen.main.bounds.size.width * 0.4)
                    .foregroundStyle(Color.cyan.gradient)
                    .padding()
            }
            VStack(alignment:.leading){
                Text("Title")
                Text("問題数")
            }
        }
//        VStack {
//            Text("Title")
//            Spacer()
//        }
//        .padding()
//        .frame(width: UIScreen.main.bounds.size.width * 0.3,
//               height: UIScreen.main.bounds.size.width * 0.4
//           )
//           .background(Rectangle()
//            .foregroundStyle(Color.green.gradient))
//
    }
}

struct workbookItem_Previews: PreviewProvider {
    static var previews: some View {
        workbookItem()
    }
}
