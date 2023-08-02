//
//  CircularProgressBar.swift
//  StudyApp
//
//  Created by 清水　佳奈音 on 2023/05/31.
//

import SwiftUI

struct CircleProgressBar: View {
    @State var progress: CGFloat
    @State var percentage: Int = 0
    @State var isProgress: Bool = false
    var body: some View {
        ZStack{
            Circle()
                .stroke(lineWidth: 12)
                .foregroundColor(.pink.opacity(0.15))
            Circle()
                .trim(from: 0.0, to: min(isProgress ? progress : 0,1.0))
                .stroke(style: StrokeStyle(lineWidth: 16, lineCap: .round, lineJoin: .round))
                   
                                     
        }
    }
}

struct CircleProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        CircleProgressBar(progress: 0.8)
    }
}
