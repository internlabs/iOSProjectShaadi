//
//  CriteriaTagCollectionViewCell.swift
//  ProjectShaadi
//
//  Created by Supriya Gunda on 13/08/24.
//

import UIKit

final class CriteriaTagCollectionViewCell : BaseCollectionViewCell {
    
    // UI elements
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "KumbhSans-Regular", size: 14)
        label.textColor = .black.withAlphaComponent(0.5)
        label.text = "Bride"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func initialize() {
        super.initialize()
        setupUI()
    }
    
    private func setupUI() {
        contentView.addSubview(titleLabel)
        contentView.setRadius(18)
        contentView.setBorder(color: UIColor(named: "grayColor") ?? .clear, width: 2.0)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 0),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: 0),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)        ])
    }
    
    func configureCell(title: String) {
        titleLabel.text = title
    }
    
    func setupSelected(_ isSelected: Bool) {
        if isSelected {
            contentView.setBorder(color: UIColor(named: "flamingoColor") ?? .clear, width: 2.0)
        } else {
            contentView.setBorder(color: UIColor(named: "grayColor") ?? .clear, width: 2.0)
        }
    }
}

