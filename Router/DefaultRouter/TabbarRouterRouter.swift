//
//  TabbarRouterRouter.swift
//  Shaadi-iOS
//
//  Created by Abhishek kapoor on 31/07/24.
//

import Foundation
import UIKit

protocol TabbarRouterRouter: DefaultRouter {
    var getTabbarItems: [TabbarItem] { get }
    func loadTabbarController() -> UITabBarController
}

final class TabbarRouterImpl: TabbarRouterRouter {

    let defaultRouter: DefaultRouter
    
    var getTabbarItems: [TabbarItem] {
        [tab1,tab2,messages,tab4]
    }
    
    private var tab1: TabbarItem {
        
        let viewController = defaultRouter.getPlaceHolderViewController()
        #if DEBUG
        viewController.view.backgroundColor = .yellow
        #endif
        let selectedBackgroundColor = UIColor.black
        let unselectedBackgroundColor = UIColor.gray

        let selectedImage = UIImage(systemName: "square.and.arrow.up")?
            .withTintColor(selectedBackgroundColor)
            .withRenderingMode(.alwaysOriginal)
        
        let unselectedImage = UIImage(systemName: "square.and.arrow.up.fill")?
            .withTintColor(unselectedBackgroundColor)
            .withRenderingMode(.alwaysOriginal)
        
        return TabbarItem(viewController: viewController,
                  selectedImage: selectedImage,
                  unselectedImage: unselectedImage,
                  title: .tab1)
    }
 
    private var tab2: TabbarItem {
        
        let viewController = defaultRouter.getPlaceHolderViewController()
        
        let selectedBackgroundColor = UIColor.black
        let unselectedBackgroundColor = UIColor.gray
#if DEBUG
        viewController.view.backgroundColor = .green
#endif

        let selectedImage = UIImage(systemName: "info.circle")?
            .withTintColor(selectedBackgroundColor)
            .withRenderingMode(.alwaysOriginal)
        
        let unselectedImage = UIImage(systemName: "info.circle.fill")?
            .withTintColor(unselectedBackgroundColor)
            .withRenderingMode(.alwaysOriginal)
        
        return TabbarItem(viewController: viewController,
                  selectedImage: selectedImage,
                  unselectedImage: unselectedImage,
                  title: .tab2)
    }
 
    private  var messages: TabbarItem {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .white
        let selectedBackgroundColor = UIColor.black
        let unselectedBackgroundColor = UIColor.gray

        let selectedImage = UIImage(systemName: "message.fill")?
            .withTintColor(selectedBackgroundColor)
            .withRenderingMode(.alwaysOriginal)
        
        let unselectedImage = UIImage(systemName: "message")?
            .withTintColor(unselectedBackgroundColor)
            .withRenderingMode(.alwaysOriginal)
        
        return TabbarItem(viewController: viewController,
                  selectedImage: selectedImage,
                  unselectedImage: unselectedImage,
                  title: .messages)
    }
    
    private var tab4: TabbarItem {
        
        let viewController = defaultRouter.getPlaceHolderViewController()
#if DEBUG
        viewController.view.backgroundColor = .orange
#endif
        let selectedBackgroundColor = UIColor.black
        let unselectedBackgroundColor = UIColor.gray

        let selectedImage = UIImage(systemName: "house.fill")?
            .withTintColor(selectedBackgroundColor)
            .withRenderingMode(.alwaysOriginal)
        
        let unselectedImage = UIImage(systemName: "house")?
            .withTintColor(unselectedBackgroundColor)
            .withRenderingMode(.alwaysOriginal)
        
        return TabbarItem(viewController: viewController,
                  selectedImage: selectedImage,
                  unselectedImage: unselectedImage,
                  title: .tab4)
    }
    
    
    init(defaultRouter: DefaultRouter = DefaultRouterImpl()){
        self.defaultRouter = defaultRouter
    }
    
    func loadTabbarController() -> UITabBarController {
        let tabbarItem = getTabbarItems
        let viewModel = TabBarViewModelImpl(tabbarItems: tabbarItem)
        let tabbarController = TabBarController(viewModel: viewModel)
        viewModel.tabbarController = tabbarController
        return tabbarController
    }
}
