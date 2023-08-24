//
//  StudyAppApp.swift
//  StudyApp
//
//  Created by 清水　佳奈音 on 2023/05/24.
//

import SwiftUI

@available(iOS 17.0, *)
@main
struct StudyAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(TabEnvironment())
        }
    }
}
