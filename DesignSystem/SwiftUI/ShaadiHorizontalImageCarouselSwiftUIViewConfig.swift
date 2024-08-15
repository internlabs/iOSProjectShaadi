//
//  ShaadiHorizontalImageCarouselSwiftUIView.swift
//  Shaadi-iOS
//
//  Created by Abhishek kapoor on 31/07/24.
//

import SwiftUI
 
struct ShaadiHorizontalImageCarouselSwiftUIViewConfig {
    let dataSource: HorizontalImageCarousel
}

protocol ShaadiHorizontalImageCarouselSwiftUIProtocol {
    
}

struct ShaadiHorizontalImageCarouselSwiftUIView: View {
    static let id = "ImageCarouselView"
    var delegate: ShaadiHorizontalImageCarouselSwiftUIProtocol?

    
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    ShaadiHorizontalImageCarouselSwiftUIView()
}
