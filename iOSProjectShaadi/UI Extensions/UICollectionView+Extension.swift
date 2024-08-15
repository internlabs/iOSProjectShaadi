//
//  UICollectionView+Extension.swift
//  iOSProjectShaadi
//
//  Created by Supriya Gunda on 15/08/24.
//

import UIKit

extension UICollectionView {
    func registerClass(_ cellType: UICollectionViewCell.Type) {
        self.register(cellType, forCellWithReuseIdentifier: cellType.className)
    }
}
