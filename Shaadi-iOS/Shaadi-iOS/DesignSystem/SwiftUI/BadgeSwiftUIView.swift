//
//  BadgeSwiftUIView.swift
//  Shaadi-iOS
//
//  Created by Abhishek kapoor on 31/07/24.
//

import SwiftUI

protocol BadgeSwiftUIViewProtocol {
    func didTapOnBadgeView()
}

struct BadgeSwiftUIView: View {
    
    let model: BadgeView
    var delegate: BadgeSwiftUIViewProtocol?
    
    
    var body: some View {
        // TODO: Complete it 
        Text("Free Chat")
        
    }
}

#Preview {
    BadgeSwiftUIView(model: .testMock)
}


#if DEBUG
extension BadgeView {
    static var testMock: BadgeView = {
        var test = BadgeView()
        test.backgroundColor = ""
        test.text = "Free Chat"
        test.cornerRadius = 20
        return test
    }()
}
#endif
