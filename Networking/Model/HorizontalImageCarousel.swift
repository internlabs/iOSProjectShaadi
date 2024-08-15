//
//  HorizontalImageCarousel.swift
//  Shaadi-iOS
//
//  Created by Abhishek kapoor on 31/07/24.
//

import Foundation

final class HorizontalImageCarousel: Codable {
    var title: TitleViewInfo
    var subtitle: String
    var leadingCTA: CTA
}

final class TitleViewInfo: Codable {
    // EX: Online Matches
    var text: String
    // Ex: (38)
    var subscriptText: String
    var badgeText: BadgeView
    var imageItemDetails: [ImageItemDetails]
}

final class ImageItemDetails: Codable {
    
}

final class BadgeView: Codable {
    // Ex: Free chat
    var text: String
    // Ex: #EDF7FF
    var backgroundColor: String
    // Ex: 12.0
    var cornerRadius: Double
    
    init() {
        text = String()
        backgroundColor = String()
        cornerRadius = 0.0
    }
}


final class CTA: Codable {
    var text: String
    var icon: String
}
