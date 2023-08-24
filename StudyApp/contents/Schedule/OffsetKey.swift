//
//  OffsetKey.swift
//  StudyApp
//
//  Created by 清水　佳奈音 on 2023/08/24.
//

import SwiftUI

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
