//
//  chartapp.swift
//  StudyApp
//
//  Created by 清水　佳奈音 on 2023/07/05.
//

import SwiftUI

struct chartapp: View {
    var body: some View {
        Button() {
            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
        } label: {
            Image(systemName:"chart.bar.xaxis")
                .font(.system(size:30))
                .foregroundStyle(Color.white
                .shadow(.drop(radius: 1)))
        }
            .frame(width: UIScreen.main.bounds.size.width * 0.15,
                   height: UIScreen.main.bounds.size.width * 0.15
               )
               .background(RoundedRectangle(cornerRadius: 15))
               .foregroundStyle(Color.red.gradient)
        }
    }


@available(iOS 17.0, *)
struct chartapp_Previews: PreviewProvider{
    static var previews: some View {
        ContentView()
    }
}
