//
//  AppsView.swift
//  CCC-1st-AppStore-Eunice
//
//  Created by Hyorim Nam on 2022/06/24.
//

import SwiftUI

struct AppsView: View {
    @State private var maincards: [Maincard] = []
    @State private var cards: [Card] = []
    @State private var appLists: [AppList] = []

    var body: some View {
        VStack {
            // 추후 #6
            Text("앱")
                .bold()
                .ignoresSafeArea()
                .foregroundColor(.white)
                .background(.white.opacity(0.9))
            //Divider()
            ScrollView {
                LazyVStack(alignment: .leading, pinnedViews: .sectionFooters) {
                        TitleView(appName: "앱")
                            .padding(.horizontal)
                        Divider()
                    HorizontalCardSection(maincards: self.$maincards)
//                        .frame(height: screenWidth*0.5)
                        .padding()

                    Divider()
                    
                    ForEach($appLists) { appList in
                        HorizontalListSection(appList: appList)
                            .padding()
                    }
                }
            }
                .onAppear{
                    self.readFile()
                }
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
