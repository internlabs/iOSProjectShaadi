//
//  SearchProfileViewController.swift
//  ProjectShaadi
//
//  Created by ROHIT DAS on 17/07/24.
//

import UIKit

final class SearchViewController: UIViewController, UITextFieldDelegate {
    
    var viewModel = SearchViewModel()
    let searchProfileView = SearchProfileView()
    

    override func loadView() {
        self.view = searchProfileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupActions()
        setupGestureRecognizers()
        
        let searchProfileItem = SearchProfileModel(
                   title: "Search By Profile ID 🧐",
                   placeholder: " Search by profile ID",
                   searchByProfileButtonText: "Show me Profiles",
                   searchByCriteriaButtonText: "Search By Criteria"
               )
               
        searchProfileView.configure(with: searchProfileItem)
        searchProfileView.profileIDTextField.delegate = self
    }
    
    // MARK: - Setup Navigation
    private func setupNavigation() {
        if let backImage = UIImage(systemName: "chevron.backward") {
            let tintedImage = backImage.withRenderingMode(.alwaysTemplate)
            
            let backButton = UIButton(type: .custom)
            backButton.setImage(tintedImage, for: .normal)
            backButton.tintColor = .black
            backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
            
            let customView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
            customView.isUserInteractionEnabled = true
            backButton.translatesAutoresizingMaskIntoConstraints = false
            customView.addSubview(backButton)
            
            NSLayoutConstraint.activate([
                backButton.topAnchor.constraint(equalTo: customView.topAnchor, constant: 20),
                backButton.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 8),
                backButton.trailingAnchor.constraint(equalTo: customView.trailingAnchor),
                backButton.bottomAnchor.constraint(equalTo: customView.bottomAnchor)
               
            ])
            
            let customBarButtonItem = UIBarButtonItem(customView: customView)
            navigationItem.leftBarButtonItem = customBarButtonItem
        }
    }
    
    // MARK: - Setup Actions
    private func setupActions() {
        searchProfileView.showProfilesButton.addTarget(self, action: #selector(showProfilesButtonTapped), for: .touchUpInside)
        searchProfileView.searchByCriteriaButton.addTarget(self, action: #selector(searchByCriteriaButtonTapped), for: .touchUpInside)
    }
    
    // MARK: -  Gesture Recognizers
      private func setupGestureRecognizers() {
          let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
          tapGestureRecognizer.cancelsTouchesInView = false
          view.addGestureRecognizer(tapGestureRecognizer)
      }
    
    // MARK: - Actions
    @objc private func backButtonTapped() {
        print("back button tapped")
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func showProfilesButtonTapped() {
        viewModel.profileID = searchProfileView.profileIDTextField.text ?? ""
        viewModel.searchByProfileID()
    }
    
    
    @objc private func searchByCriteriaButtonTapped() {
        viewModel.searchByCriteria()
    }
    
    @objc private func dismissKeyboard() {
            view.endEditing(true)
        }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
    }
    
    
}

