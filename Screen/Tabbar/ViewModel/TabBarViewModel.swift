//
//  TabBarViewModel.swift
//  Shaadi-iOS
//
//  Created by Abhishek kapoor on 31/07/24.
//

import Foundation
import UIKit

protocol TabBarControllerDelegate: AnyObject {
    func tabbarControllerSelectionChange(with item: TabbarItem)
}

protocol TabBarViewModel: AnyObject {
    var tabbarController: UITabBarController? { set get }
    
    func updateSelectedIndex(_ index: Int)
    func loadTabbar()
}

final class TabBarViewModelImpl: TabBarViewModel {
    
    var tabbarController: UITabBarController?
    var selectedIndex: Int = 0
    weak var tabBarControllerDelegate: TabBarControllerDelegate?
    
    let tabbarItems: [TabbarItem]
    
    init(tabbarItems: [TabbarItem]) {
        self.tabbarItems = tabbarItems
    }
    
    func updateSelectedIndex(_ index: Int) {
        self.selectedIndex = index
        tabBarControllerDelegate?.tabbarControllerSelectionChange(with: tabbarItems[index])
    }
    
    func loadTabbar() {
        guard let tabbarController = tabbarController else {
            return
        }
        tabbarController.viewControllers = tabbarItems.map { item in
            let viewController = item.viewController
            
            viewController.tabBarItem = UITabBarItem(title: item.title.rawValue.localized,
                                                     image: item.unselectedImage,
                                                     selectedImage: item.selectedImage)
            
            
            return viewController
        }
        tabbarController.selectedViewController = tabbarController.viewControllers?.first
    }
}
