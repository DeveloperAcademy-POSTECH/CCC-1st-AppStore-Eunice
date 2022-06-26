//
//  SharedUI.swift
//  CCC-1st-AppStore-Eunice
//
//  Created by Hyorim Nam on 2022/06/24.
//

import SwiftUI

struct TitleView: View {
    let appName: String
    var body: some View {
        HStack {
            Text(appName)
                .font(.largeTitle)
                .bold()
            Spacer()
            Text(Image(systemName: "person.crop.circle"))
                .font(.largeTitle)
//                .bold()
                .foregroundColor(.blue)
        }
    }
}

struct HorizontalCardSection: View {
    let sectionName: String
    let data: [String] // json
    var body: some View {
        ScrollView(.horizontal) {
            ForEach(data, id: \.self) { _ in
                VStack {
                    Text("category")
                    Text("title")
                    Text("subtitle")
                    CardView()
                }
            }
        }
    }
}

struct HorizontalListSection: View {
    let sectionName: String
    let subtitle: String?
    let data: [Datum] // 임시, 이름 바꿀 것
    var body: some View {
        VStack {
            HStack {
                Text("title")
                Spacer()
                // 이게 버튼이 맞나..
                Button("모두 보기") {
                    // 없음 - 시간 남으면 연결
                }
            }
            if subtitle != nil {
                Text(subtitle!)
            }

            let rows: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
            ScrollView(.horizontal) {
                // section header, pinnedview 사용해보자
                // https://seons-dev.tistory.com/58
                LazyHGrid(rows: rows) {
                    ForEach(self.data){ datum in
                        appListView(data: datum)
                    }
                }
            }
        }
    }
}

@ViewBuilder
func appListView(data: Datum, textColor: Color = Color.primary, last: Bool = false) -> some View {
    HStack {
        // 이미지 교체
        Image(systemName: data.appInfo.icon).resizable().scaledToFit()
        VStack {
            HStack {
                if data.ranking != nil {
                    Text("\(data.ranking!)")
                }
                VStack {
                    Text(data.appInfo.title)
                }
                // 테스트
                DownloadVButton(purchased: data.appInfo.purchased, inAppPurchase: data.appInfo.inAppPurchase, installed: data.appInfo.installed, price: data.appInfo.price)
            }
            Spacer()
            if !last {
                Divider()
            }
        }
    }
}

struct CardView: View {
    var body: some View {
        ZStack {
            // 이미지 교체 필요
            Image(systemName: "camera.metering.none")
                .resizable()
                .scaledToFit()
            VStack {
                Spacer()
                HStack {
                    // 이미지 수정 필요
                    VStack {
                        HStack {
                            Image(systemName: "app.dashed")
                            VStack(alignment: .leading) {
                                Text("AppName...")
                                Text("subtitle...")
                            }
                        }
                        Spacer()
                    }
                    DownloadVButton(purchased: false, inAppPurchase: true, installed: false, price: 0)
                }
                .background(
                    .white
                        .opacity(0.3)
                )
            }
        }
    }
}

struct DownloadVButton: View {
    var purchased: Bool
    var inAppPurchase: Bool
    var installed: Bool
    var price: Int
    @State var pressed = false
    var body: some View {
        if installed {
            Button("열기") {
                // 앱 열기 <- 안함
            }
        } else {
            if purchased {
                Button("icloud.and.arrow.down") {
                    // 돌아가는 다운로드 모션으로 교체 <- 안함
                }
            } else {
                VStack {
                    Button(price == 0 ? "받기" : "￦\(price)") {
                        // 돌아가는 모션으로 교체 후 구매 팝업 뜸 <- 안함
                        // deliberately emptied
                    }
                    if inAppPurchase {
                        Text("앱 내 구입")
                    } else {
                        // 아니면 텍스트 opacity 조정한다거나 흠
                        Spacer()
                    }
                }
            }
        }
    }
}

struct DownloadHButton: View {
    var purchased: Bool
    var inAppPurchase: Bool
    var installed: Bool
    var price: Int
    @State var pressed = false
    var body: some View {
        if installed {
            Button("열기") {
                // 앱 열기 <- 안함
            }
        } else {
            if purchased {
                Button("icloud.and.arrow.down") {
                    // 돌아가는 다운로드 모션으로 교체 <- 안함
                }
            } else {
                HStack {
                    Button(price == 0 ? "받기" : "￦\(price)") {
                        // 돌아가는 모션으로 교체 후 구매 팝업 뜸 <- 안함
                        // deliberately emptied
                    }
                    if inAppPurchase {
                        Text("앱 내 구입")
                    } else {
                        // 아니면 텍스트 opacity 조정한다거나 흠
                        Spacer()
                    }
                }
            }
        }
    }
}

// struct SharedUI_Previews: PreviewProvider {
//    static var previews: some View {
//        SharedUI()
//    }
// }
