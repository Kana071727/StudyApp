//
//  SideMenuView.swift
//  StudyApp
//
//  Created by 清水　佳奈音 on 2023/07/12.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var isOpen:Bool
    var body: some View {
        ZStack{
            Text("aaaaa")
            }
            .background(Color.gray.opacity(0.3))
            .opacity(self.isOpen ? 1.0 : 0.0)
            .opacity(1.0)
            .onTapGesture {
                self.isOpen = false
            }
        }
    }

