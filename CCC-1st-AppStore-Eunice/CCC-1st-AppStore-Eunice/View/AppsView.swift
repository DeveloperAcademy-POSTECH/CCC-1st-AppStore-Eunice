//
//  AppsView.swift
//  CCC-1st-AppStore-Eunice
//
//  Created by Hyorim Nam on 2022/06/24.
//

import SwiftUI

struct AppsView: View {
    var body: some View {
        VStack {
            TitleView(appName: "앱")
            // section?
            Divider()
//            ForEach(AppsData){_ in
//                Divider()
//            }
        }
    }
}

struct AppsView_Previews: PreviewProvider {
    static var previews: some View {
        AppsView()
    }
}
