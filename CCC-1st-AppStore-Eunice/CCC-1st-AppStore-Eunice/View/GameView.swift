//
//  GameView.swift
//  CCC-1st-AppStore-Eunice
//
//  Created by Hyorim Nam on 2022/06/24.
//

import SwiftUI

struct GameView: View {
    @State private var maincards: [Maincard] = []
    @State private var cards: [Card] = []
    @State private var appLists: [AppList] = []

    var body: some View {
        VStack {
            // 추후 #6
            Text("게임")
                .bold()
                .ignoresSafeArea()
                .foregroundColor(.white)
                .background(.white.opacity(0.9))

            ScrollView {
                LazyVStack(alignment: .leading) {
                    TitleView(appName: "게임")
                        .padding(.horizontal)
                    Divider()
                    HorizontalCardSection(maincards: self.$maincards)
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

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
