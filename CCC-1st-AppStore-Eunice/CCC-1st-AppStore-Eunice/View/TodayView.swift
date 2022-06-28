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
        ScrollView {
            Text("date here")
                .multilineTextAlignment(.leading)
            TitleView(appName: "투데이")
            ForEach(0...2, id: \.self){_ in
                TodayCardView()
            }
        }
    }
}

struct TodayCardView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .frame(width: screenWidth-32, height: screenWidth+32)
    }
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
    }
}
