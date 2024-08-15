//
//  BaseTableViewCell.swift
//  ProjectShaadi
//
//  Created by Supriya Gunda on 12/08/24.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        initialize()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String!) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           initialize()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func initialize() {
        self.selectionStyle = .none
    }
}
