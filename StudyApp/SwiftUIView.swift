//
//  SwiftUIView.swift
//  StudyApp
//
//  Created by 清水　佳奈音 on 2023/08/27.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        ZStack{
            LinearGradient(colors: [Color.cyan.opacity(0.7), Color.purple.opacity(0.7), Color.pink.opacity(0.7)], startPoint: .topLeading, endPoint: .bottomTrailing)
            
        }
    }
}

#Preview {
    SwiftUIView()
}
