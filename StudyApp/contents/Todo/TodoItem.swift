//
//  TodoItem.swift
//  StudyApp
//
//  Created by 清水　佳奈音 on 2023/07/25.
//

import SwiftUI

struct TodoItem: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("TodoName")
                .font(.headline)
            Divider()
                .foregroundColor(.white)
            Text("Category")
            Text("00/00")
            
        }
        .padding()
        .frame(width: UIScreen.main.bounds.size.width * 0.4,
               height: UIScreen.main.bounds.size.width * 0.4
           )
        .background(RoundedRectangle(cornerRadius: 30)
            .foregroundStyle(Color.cyan.gradient))
    }
}

struct TodoItem_Previews: PreviewProvider {
    static var previews: some View {
        TodoItem()
    }
}
