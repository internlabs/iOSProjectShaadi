//
//  UITableView+Extension.swift
//  iOSProjectShaadi
//
//  Created by Supriya Gunda on 15/08/24.
//

import UIKit

extension UITableView {
    
    func registerClass(_ cellType: UITableViewCell.Type) {
        self.register(cellType, forCellReuseIdentifier: cellType.className)
    }
    
    func registerHeaderFooterClass(_ cellType: UITableViewHeaderFooterView.Type) {
        self.register(cellType, forHeaderFooterViewReuseIdentifier: cellType.className)
    }
    
}
