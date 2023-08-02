//
//  workbookSmall.swift
//  StudyApp
//
//  Created by 清水　佳奈音 on 2023/06/21.
//

import SwiftUI

struct workbookSmall: View {
    var body: some View {
        VStack(){
            Text("a")
            
        }
        .frame(
            width: UIScreen.main.bounds.size.width * 0.45,
            height: UIScreen.main.bounds.size.width * 0.45
        )
        .background(RoundedRectangle(cornerRadius: 30)
            .fill(Color.white)
            .shadow(color: .gray.opacity(0.7), radius: 5))
            
        
    }
}

struct workbookSmall_Previews: PreviewProvider {
    static var previews: some View {
        workbookSmall()
    }
}
