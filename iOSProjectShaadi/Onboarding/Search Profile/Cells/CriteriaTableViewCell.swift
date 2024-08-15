//
//  CriteriaTableViewCell.swift
//  ProjectShaadi
//
//  Created by Supriya Gunda on 12/08/24.
//

import UIKit

class CriteriaTableViewCell: BaseTableViewCell {
    
    // Helper components
    var cellType: Criteria = .ageGroup {
        didSet {
            collectionView.reloadData()
        }
    }
    
    // UI elements
    private lazy var criteriaTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black.withAlphaComponent(0.5)
        label.font = UIFont(name: "KumbhSans-Medium", size: 14)
        label.text = "Looking for Age Group"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 10
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collection.dataSource = self
        collection.delegate = self
        collection.backgroundColor = .clear
        collection.showsHorizontalScrollIndicator = false
        collection.allowsMultipleSelection = false
        collection.registerClass(CriteriaTagCollectionViewCell.self)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    private lazy var criteriaTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.setPlaceholder(color: UIColor.black.withAlphaComponent(0.5))
        textField.backgroundColor = UIColor(named: "grayColor")
        textField.textColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont(name: "KumbhSans-Regular", size: 14)
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        return textField
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        contentView.subviews.forEach({ $0.removeFromSuperview() })
    }
    
    func setupTextField() {
        NSLayoutConstraint.activate([
            criteriaTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 20),
            criteriaTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16),
            criteriaTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16),
            criteriaTitleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 18),
            
            criteriaTextField.topAnchor.constraint(equalTo: criteriaTitleLabel.bottomAnchor,constant: 20),
            criteriaTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16),
            criteriaTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16),
            criteriaTextField.heightAnchor.constraint(greaterThanOrEqualToConstant: 50),
            criteriaTextField.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
    
    func setupCollectionView() {
        NSLayoutConstraint.activate([
            criteriaTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 30),
            criteriaTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16),
            criteriaTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16),
            criteriaTitleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 18),
            
            collectionView.topAnchor.constraint(equalTo: criteriaTitleLabel.bottomAnchor,constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16),
            collectionView.heightAnchor.constraint(equalToConstant: 35),
            collectionView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
    
    func configureCell(_ index: Int) {
        contentView.addSubview(criteriaTitleLabel)
        cellType = Criteria.allCases[index]
        criteriaTitleLabel.text = cellType.title
        switch cellType {
        case .ageGroup, .height, .motherTongue, .annualIncome, .country:
            criteriaTextField.text = cellType.value
            contentView.addSubview(criteriaTextField)
            setupTextField()
        default:
            contentView.addSubview(collectionView)
            setupCollectionView()
        }
    }
}

extension CriteriaTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CriteriaTagCollectionViewCell.className, for: indexPath) as? CriteriaTagCollectionViewCell else { return UICollectionViewCell() }
        cell.configureCell(title: cellType.tags[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CriteriaTagCollectionViewCell else { return }
        cell.setupSelected(true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CriteriaTagCollectionViewCell else { return }
        cell.setupSelected(false)
    }
}

extension CriteriaTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel()
        label.text = cellType.tags[indexPath.row]
        label.sizeToFit()
        let width = label.frame.size.width + 20
        return CGSize(width: width, height: 35)
    }
}
