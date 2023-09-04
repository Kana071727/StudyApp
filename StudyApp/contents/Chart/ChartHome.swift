//
//  ChartHome.swift
//  StudyApp
//
//  Created by 清水　佳奈音 on 2023/09/04.
//

import SwiftUI
import Charts

@available(iOS 17.0, *)
struct ChartHome: View {
    var body: some View {
        Chart {
            ForEach(appDownloads) { download in
                SectorMark(
                    angle: .value("Downloads", download.downloads),
                    innerRadius: 2,
                    angularInset: 4
                )
                .cornerRadius(8)
                .foregroundStyle(by: .value("Month", download.month))
            }
        }
    }
}

@available(iOS 17.0, *)
struct ChartHome_Previews: PreviewProvider {
    static var previews: some View {
        ChartHome()
    }
}
