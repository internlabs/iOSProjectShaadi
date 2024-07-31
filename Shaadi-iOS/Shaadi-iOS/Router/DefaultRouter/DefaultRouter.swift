//
//  DefaultRouter.swift
//  Shaadi-iOS
//
//  Created by Abhishek kapoor on 31/07/24.
//

import UIKit

protocol DefaultRouter: AnyObject{
    func getMessengerViewController() -> UIViewController
    func getPlaceHolderViewController() -> UIViewController
}

final class DefaultRouterImpl: DefaultRouter {}

extension DefaultRouter {
    func getMessengerViewController() -> UIViewController {
//        let viewModel = InfoViewModel()
//        let view = InfoView(viewModel: viewModel)
//        let viewController = InfoViewController(rootView: view)
        return UIViewController()
    }
}

#if DEBUG
extension DefaultRouter {
    func getPlaceHolderViewController() -> UIViewController {
        return UIViewController()
    }
}
#endif

