// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let appStub = try? newJSONDecoder().decode(AppStub.self, from: jsonData)

import Foundation

// MARK: - AppStub
struct AppStub: Codable {
    let maincards: [Maincard]
    let cards: [Card]
    var appLists: [AppList]

    enum CodingKeys: String, CodingKey {
        case maincards, cards
        case appLists = "app-lists"
    }
}

// MARK: - AppList
struct AppList: Codable, Identifiable {
    let id = UUID()
    let section: String
    let data: [Datum]
    let subtitle: String?

    enum CodingKeys: String, CodingKey {
        case section, data, subtitle
    }
}

// MARK: - Datum
struct Datum: Codable, Identifiable {
    let id = UUID()
    let ranking: Int?
    let appInfo: AppInfo

    enum CodingKeys: String, CodingKey {
        case ranking
        case appInfo = "app-info"
    }
}

// MARK: - AppInfo
struct AppInfo: Codable {
//    let id = UUID()
    let title: String
    let icon: String
    let subtitle: String
    let price: Int
    let purchased, inAppPurchase, installed: Bool

    enum CodingKeys: String, CodingKey {
        case title, icon, subtitle, price, purchased
        case inAppPurchase = "in-app-purchase"
        case installed
    }
}

// MARK: - Card
struct Card: Codable {
    let section: String
    let data: [Maincard]
}

// MARK: - Maincard
struct Maincard: Codable, Identifiable {
    let id = UUID()
    let category, image: String
    let maincardDescription: Description?
    let appInfo: AppInfo
    let subtitle: String?

    enum CodingKeys: String, CodingKey {
        case category, image
        case maincardDescription = "description"
        case appInfo = "app-info"
        case subtitle
    }
}

// MARK: - Description
struct Description: Codable {
    let category, title, subtitle: String
}
