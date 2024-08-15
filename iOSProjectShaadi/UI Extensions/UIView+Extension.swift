//
//  UIView+Extension.swift
//  iOSProjectShaadi
//
//  Created by Supriya Gunda on 15/08/24.
//

import UIKit

extension UIView {
    func setBorder(color: UIColor, width: Double = 1.0) {
        self.layer.borderWidth = CGFloat(width)
        self.layer.borderColor = color.cgColor
    }
    
    func setRadius(_ radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
}
