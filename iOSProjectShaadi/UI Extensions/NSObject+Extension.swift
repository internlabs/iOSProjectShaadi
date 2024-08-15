//
//  NSObject+Extension.swift
//  iOSProjectShaadi
//
//  Created by Supriya Gunda on 15/08/24.
//

import UIKit

// MARK: Get NSObject name
extension NSObject {
    var className: String {
        return type(of: self).className
    }

    static var className: String {
        return String(describing: self)
    }
}
