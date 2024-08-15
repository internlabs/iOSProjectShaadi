//
//  BaseCollectionViewCell.swift
//  ProjectShaadi
//
//  Created by Supriya Gunda on 13/08/24.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
        
    override func awakeFromNib() {
        super.awakeFromNib()
        initialize()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func initialize() {

    }
}
