//
//  AppsViewModel.swift
//  CCC-1st-AppStore-Eunice
//
//  Created by Hyorim Nam on 2022/06/26.
//

//import Foundation
import SwiftUI

// ref: https://alep.medium.com/swiftui-tutorial-how-to-read-a-json-file-73fd960ec954
struct JSONReadTest: View {
    
    @State var maincards: [Maincard] = []
    @State var cards:[Card] = []
    @State var appLists: [AppList] = []
    
    func readFile() {
        if let url = Bundle.main.url(forResource: "AppsData", withExtension: "json"),
        let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            guard let appStub = try? decoder.decode(AppStub.self, from: data) else {
                print("appStub decoder fail")
                return
            }
            if let appStub = try? decoder.decode(AppStub.self, from: data) {
                print("decoder in")
                self.maincards = appStub.maincards
                self.cards = appStub.cards
                self.appLists = appStub.appLists
                print("mainCards.count: \(maincards.count)")
            }
        }
    }
    
//    init(){
//        self.readFile()
//    }
    
    var body: some View {
        
        VStack {
            Text("\(self.maincards.count)")
            Text(self.maincards.first?.category ?? "updating")
        }
        .onAppear {
            self.readFile()
        }
    }
}

// swiftlint: disable type_name
struct JSONReadTest_Preview: PreviewProvider {
    static var previews: some View {
        JSONReadTest()
    }
}
// swiftlint: enable type_name
