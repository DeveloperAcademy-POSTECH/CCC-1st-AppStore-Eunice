//
//  TodayView.swift
//  CCC-1st-AppStore-Eunice
//
//  Created by Hyorim Nam on 2022/06/24.
//

import SwiftUI

struct TodayView: View {
    var body: some View {
        // date here
        VStack {
            Text("date here")
            TitleView(appName: "투데이")
        }
    }
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
    }
}
