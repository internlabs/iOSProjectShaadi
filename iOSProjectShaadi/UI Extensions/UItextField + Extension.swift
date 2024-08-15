//
//  UItextField + Extension.swift
//  iOSProjectShaadi
//
//  Created by Supriya Gunda on 15/08/24.
//

import UIKit

extension UITextField {
    func setPlaceholder(color: UIColor) {
        if let placeholder = self.placeholder {
            self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: color])
        }
    }
}
