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
                    .padding(.horizontal)
                // section?
                Divider()
                // HorizontalCardSection()
                ForEach(self.maincards) {maincard in
                    VStack {
                        Text(maincard.category)
                            .font(.headline)
                            .foregroundColor(.blue)
                        Text(maincard.appInfo.title)
                            .font(.title)
                        if maincard.subtitle != nil {
                            Text(maincard.subtitle ?? "err")
                                .foregroundColor(.gray)
                        }
                        Image(systemName: maincard.image)
                            .resizable()
                            .scaledToFit()
                        Divider()
                    }
                    
                }
            }
//            .onAppear{
//                self.readFile()
//            }
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
