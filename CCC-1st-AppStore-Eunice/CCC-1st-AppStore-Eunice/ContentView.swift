//
//  ContentView.swift
//  CCC-1st-AppStore-Eunice
//
//  Created by Hyorim Nam on 2022/06/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TodayView()
                .tabItem {
                    Image(systemName: "doc.text.image")
                    Text("투데이")
                }
            GameView()
                .tabItem {
                    // 아이콘 수정 필요
                    Image(systemName: "gamecontroller.fill")
                    Text("게임")
                }
            // how to make this shown first?
            AppsView()
                .tabItem {
                    Image(systemName: "square.stack.3d.up.fill")
                    Text("앱")
                }
            Text("Stub View: Arcade")
                .tabItem {
                    // 아이콘 교체 필요
                    Image(systemName: "gamecontroller")
                    Text("Arcade")
                }
            Text("Stub View: Search")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
