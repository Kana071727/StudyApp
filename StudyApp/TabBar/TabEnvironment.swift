//
//  TabEnvironment.swift
//  StudyApp
//
//  Created by 清水　佳奈音 on 2023/07/12.
//

import SwiftUI

class TabEnvironment: ObservableObject {
    @Published var tabnumber: Int = 0
    @Published var tabname: String = "Home"
    @Published var tabPresent: Bool = true
}
