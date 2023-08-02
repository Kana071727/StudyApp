//
//  SwiftUIView.swift
//  StudyApp
//
//  Created by 清水　佳奈音 on 2023/05/24.
//

import SwiftUI

struct workbookWidgetView: View {
    @State private var active = false
    var body: some View {
        NavigationStack{
            HStack(alignment:.top){
                Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                
                .padding(.horizontal, 30)
                Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                .padding(.horizontal, 30)
                Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                .padding(.horizontal, 30)
            }
        }
        .frame(
            width: UIScreen.main.bounds.size.width * 0.9,
            height: UIScreen.main.bounds.size.width * 0.45
        )
        .background(RoundedRectangle(cornerRadius: 30)
            .fill(Color.white)
            .shadow(color: .gray.opacity(0.7), radius: 5))
            
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        workbookWidgetView()
    }
}
