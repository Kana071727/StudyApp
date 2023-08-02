//
//  workbookresult.swift
//  StudyApp
//
//  Created by 清水　佳奈音 on 2023/07/05.
//

import SwiftUI

struct workbookresult: View {
    var body: some View {
        VStack{
            HStack{
                Text("前回")
                Spacer()
                Image(systemName: "timer")
                Text("00:00")
            }
            .padding()
            HStack{
                Text("今回")
                Spacer()
                Image(systemName: "timer")
                Text("00:00")
            }
            .padding()
            HStack{
                Button("○") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                Button("△") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                Button("×") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
            }
        }
    }
}

struct workbookresult_Previews: PreviewProvider {
    static var previews: some View {
        workbookresult()
    }
}
