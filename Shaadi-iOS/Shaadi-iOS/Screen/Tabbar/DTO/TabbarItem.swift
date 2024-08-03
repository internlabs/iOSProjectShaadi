//
//  TabbarItem.swift
//  Shaadi-iOS
//
//  Created by Abhishek kapoor on 31/07/24.
//
import UIKit

struct TabbarItem {
    let viewController: UIViewController
    let selectedImage: UIImage?
    let unselectedImage: UIImage?
    let title: LocalizedText
    
    // FIXME: update as tabbar assign
    enum LocalizedText: String {
        case tab1 = "Tabbar.tab1"
        case tab2 = "Tabbar.tab2"
        case tab3 = "Tabbar.tab3"
        case tab4 = "Tabbar.tab4"
    }
}
