//
//  SearchProfileView.swift
//  ProjectShaadi
//
//  Created by ROHIT DAS on 17/07/24.
//

import UIKit

final class SearchProfileView: UIView {
     let titleLabel = UILabel()
     let profileIDTextField = UITextField()
     let showProfilesButton = UIButton(type: .system)
     let orLabel = UILabel()
     let searchByCriteriaButton = UIButton(type: .system)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .white
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        profileIDTextField.translatesAutoresizingMaskIntoConstraints = false
        showProfilesButton.translatesAutoresizingMaskIntoConstraints = false
        orLabel.translatesAutoresizingMaskIntoConstraints = false
        searchByCriteriaButton.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textColor = .black
        
        setupTextField(profileIDTextField, placeholder: "")
        
        showProfilesButton.backgroundColor = UIColor(hex: "#EF4B4B")
        showProfilesButton.setTitleColor(.white, for: .normal)
        showProfilesButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        showProfilesButton.layer.cornerRadius = 20
        showProfilesButton.clipsToBounds = true
       
        orLabel.font = UIFont.systemFont(ofSize: 14)
        orLabel.text = "OR"
        orLabel.textColor = .gray
        
        searchByCriteriaButton.backgroundColor = UIColor(hex:"#F4F4F4")
        searchByCriteriaButton.setTitleColor(UIColor(hex: "#EF4B4B"), for: .normal)
        searchByCriteriaButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        searchByCriteriaButton.layer.cornerRadius = 20
        searchByCriteriaButton.clipsToBounds = true
        
        
        addSubview(titleLabel)
        addSubview(profileIDTextField)
        addSubview(showProfilesButton)
        addSubview(orLabel)
        addSubview(searchByCriteriaButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 46),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            
            profileIDTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            profileIDTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 46),
            profileIDTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -46),
            profileIDTextField.heightAnchor.constraint(equalToConstant: 50),
            
            showProfilesButton.topAnchor.constraint(equalTo: profileIDTextField.bottomAnchor, constant: 200),
            showProfilesButton.heightAnchor.constraint(equalToConstant: 55),
            showProfilesButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 50),
            showProfilesButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -50),
            
            orLabel.topAnchor.constraint(equalTo: showProfilesButton.bottomAnchor, constant: 20),
            orLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            searchByCriteriaButton.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 20),
            searchByCriteriaButton.heightAnchor.constraint(equalToConstant: 55),
            searchByCriteriaButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 50),
            searchByCriteriaButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -50),
        ])
    }
    
    func configure(with item: SearchProfileModel){
        titleLabel.text = item.title
        setupTextField(profileIDTextField, placeholder: item.placeholder)
        showProfilesButton.setTitle(item.searchByProfileButtonText, for: .normal)
        searchByCriteriaButton.setTitle(item.searchByCriteriaButtonText, for: .normal)
    }

    private func setupTextField(_ textField: UITextField, placeholder: String){
        textField.placeholder = placeholder
        textField.borderStyle = .roundedRect
        textField.setPlaceholder(color: UIColor(hex:"#000000"))
        textField.backgroundColor = UIColor(hex: "#F4F4F4")
        textField.textColor = .black
    }
    
}
