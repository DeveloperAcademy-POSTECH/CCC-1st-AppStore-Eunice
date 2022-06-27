//
//  SharedUI.swift
//  CCC-1st-AppStore-Eunice
//
//  Created by Hyorim Nam on 2022/06/24.
//

import SwiftUI

let screenWidth = UIScreen.main.bounds.width

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
    let sectionName: String? = nil
    @Binding var maincards: [Maincard] // json
    var body: some View {
        VStack {
            if sectionName != nil {
                Text(sectionName ?? "err")
                    .font(.title)
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(maincards) { maincard in
                        VStack(alignment: .leading) {
                            Text(maincard.category)
                                .font(.footnote)
                                .foregroundColor(.blue)
                            Text(maincard.appInfo.title)
                                .font(.title2)
                                .multilineTextAlignment(.leading)
                            if maincard.subtitle != nil {
                                Text(maincard.subtitle ?? "err")
                                    .font(.title3)
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.leading)
                            }
                            
//                            Image(systemName: maincard.image)
//                                .resizable()
//                                .scaledToFit()
                            CardView(maincard: maincard)
                        }
//                        .padding()
                        .frame(width: screenWidth*0.8)
                        .padding()
                    }
                }
            }
        }
    }
}

struct HorizontalListSection: View {
    @Binding var appList: AppList
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(appList.section)
                    .font(.title)
                    .bold()
                Spacer()
                Button("모두 보기"){}
                    .font(.title2)
                    //.foregroundColor(.blue)
            }
            if appList.subtitle != nil {
                Text(appList.subtitle!)
                    .font(.title3)
                    .foregroundColor(.gray)
            }

            let rows: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
            ScrollView(.horizontal, showsIndicators: false) {
                // https://seons-dev.tistory.com/58
                LazyHGrid(rows: rows) {
                    ForEach(appList.data){ datum in
                        AppListView(data: datum)
                            //.padding(.vertical)
                    }
                }
            }
        }
    }
}

struct AppListView: View {
    let data: Datum
    let textColor: Color = Color.primary
    let last: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
            // 이미지 교체
                Image(data.appInfo.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: screenWidth*0.15, height: screenWidth*0.15)
                    //.background(RoundedRectangle(cornerRadius: 6))
                    //.clipped()
                    .padding()

                if data.ranking != nil {
                    VStack(alignment: .leading) {
                        Text("\(data.ranking!)")
                        Spacer()
                    }
                }

                VStack(alignment: .leading) {
                    Text(data.appInfo.title)
                    Text(data.appInfo.subtitle)
                }
                Spacer()
                        // 테스트
                DownloadVButton(purchased: data.appInfo.purchased, inAppPurchase: data.appInfo.inAppPurchase, installed: data.appInfo.installed, price: data.appInfo.price)
            }
            .padding()
            if !last {
                Divider()
            }
        }
        .frame(width: screenWidth*0.8)
    }
}

struct CardView: View {
    let maincard: Maincard
    var body: some View {
        ZStack {
            // 이미지 교체 필요
            Image(maincard.image)
                .resizable()
                .scaledToFit()
                .frame(width: screenWidth*0.8, height: screenWidth*0.5)
            VStack {
                Spacer()
                // 이미지 수정 필요
                HStack {
                    Image( maincard.appInfo.icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: screenWidth*0.15, height: screenWidth*0.15)
                    VStack(alignment: .leading) {
                        Text(maincard.appInfo.title)
                            .font(.body)
                            .lineLimit(1)
                        Text(maincard.appInfo.subtitle)
                            .font(.body)
                            .foregroundColor(.gray)
                            .lineLimit(1)
                    }
                    DownloadVButton(purchased: false, inAppPurchase: true, installed: false, price: 0, textColor: .white)
                }
                .background(
                    RoundedRectangle(cornerRadius: 30)
                        .fill(.white.opacity(0.0))
                    .blur(radius: 10, opaque: true)
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
    var textColor: Color = .blue
    @State var pressed = false
    var body: some View {
        if installed {
            Button("열기") {
                // 앱 열기 <- 안함
            }
            .padding(.horizontal)
            .background(Capsule()
                .fill(Color(UIColor.systemGray5))
            )
        } else {
            if purchased {
                Button {
                } label: {
                    Text(Image(systemName: "icloud.and.arrow.down"))
                        .foregroundColor(textColor)
                    // 돌아가는 다운로드 모션으로 교체 <- 안함
                }
            } else {
                VStack {
                    Button(price == 0 ? "받기" : "￦\(price)") {
                        // 돌아가는 모션으로 교체 후 구매 팝업 뜸 <- 안함
                        // deliberately emptied
                    }
                    .foregroundColor(textColor)
                    .padding(.horizontal)
                    .background(Capsule()
                        .fill(Color(UIColor.systemGray5)))
                    if inAppPurchase {
                        Text("앱 내 구입")
                            .font(.caption2)
                            .foregroundColor(Color(UIColor.systemGray5))
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
    var textColor: Color = .blue
    @State var pressed = false
    var body: some View {
        if installed {
            Button("열기") {
                // 앱 열기 <- 안함
            }
        } else {
            if purchased {
                Button{
                    
                } label: {
                    Text(Image(systemName: "icloud.and.arrow.down"))
                        .foregroundColor(textColor)
                    // 돌아가는 다운로드 모션으로 교체 <- 안함
                }
            } else {
                HStack {
                    Button(price == 0 ? "받기" : "￦\(price)") {
                        // 돌아가는 모션으로 교체 후 구매 팝업 뜸 <- 안함
                        // deliberately emptied
                    }
                    .padding()
                    .background(Capsule()
                        .fill(Color(UIColor.systemGray5)))
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
