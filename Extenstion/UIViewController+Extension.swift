//
//  UIViewController+Extension.swift
//  Shaadi-iOS
//
//  Created by Abhishek kapoor on 31/07/24.
//

import Foundation
import UIKit

extension UIViewController {
    func topNavigationController() -> UINavigationController {
        if let navigationController = self.navigationController {
            return navigationController
        } else if let presentedViewController = self.presentedViewController {
            return presentedViewController.topNavigationController()
        } else {
            let newNavController = UINavigationController(rootViewController: self)
            return newNavController
        }
    }
}
