//
//  AppsView.swift
//  CCC-1st-AppStore-Eunice
//
//  Created by Hyorim Nam on 2022/06/24.
//

import SwiftUI

struct AppsView: View {
    @State private var maincards: [Maincard] = []
    @State private var cards:[Card] = []
    @State private var appLists: [AppList] = []

    var body: some View {
        ScrollView {
            LazyVStack {
                TitleView(appName: "앱")
                // section?
                Divider()
                ForEach(maincards){maincard in
                    VStack {
                        Text(maincard.category)
                        Image(maincard.image).resizable().scaledToFit()
                        if maincard.maincardDescription != nil {
                            Text(maincard.maincardDescription?.category ?? "")
                            Text(maincard.maincardDescription?.title ?? "")
                            Text(maincard.maincardDescription!.subtitle ?? "")
                        }
                        Text(maincard.appInfo.title)
                        Image(maincard.appInfo.icon).resizable().scaledToFit()
    //                    Text(maincard.appInfo.subtitle)
    //                    VStack {
    //                        Text("\(maincard.appInfo.price)")
    //                        Text("\(maincard.appInfo.purchased)")
    //                        Text("\(maincard.appInfo.inAppPurchase)")
    //                        Text("\(maincard.appInfo.installed)")
    //                        if maincard.subtitle != nil {
    //                            Text(maincard.subtitle ?? "")
    //                        }
    //                    }
                        Divider()
                    }
                    
                }
            }
        }
        .onAppear{
            self.readFile()
        }
    }
    
    private func readFile() {
        if let url = Bundle.main.url(forResource: "AppsData", withExtension: "json"),
        let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            if let appStub = try? decoder.decode(AppStub.self, from: data) {
                self.maincards = appStub.maincards
                self.cards = appStub.cards
                self.appLists = appStub.appLists
            }
        }
    }

}

struct AppsView_Previews: PreviewProvider {
    static var previews: some View {
        AppsView()
    }
}
