//
//  Scheduleview.swift
//  StudyApp
//
//  Created by 清水　佳奈音 on 2023/08/23.
//

import SwiftUI

@available(iOS 17.0, *)
struct Scheduleview: View {
    var body: some View {
        VStack{
            ScheduleHome()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.white)
                .preferredColorScheme(.light)
        }
    }
}


@available(iOS 17.0, *)
struct Scheduleview_Previews: PreviewProvider {
    static var previews: some View {
        Scheduleview()
    }
}
