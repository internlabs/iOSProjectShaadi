//
//  LoginViewController.swift
//  iOSProjectShaadi
//
//  Created by Khushal on 7/6/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var oneTimePasswordButton: UIButton!
    @IBOutlet weak var loginPasswordButton: UIButton!
    
    var viewModel: LoginViewModelAdaptable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = LoginViewModel()
        setupViewModel()
        viewModel?.loadUI()
    }

    @IBAction func oneTimePasswordTapped(_ sender: Any) {
        viewModel?.launchOneTimePasswordFlow()
    }
    
    @IBAction func loginPasswordTapped(_ sender: Any) {
        viewModel?.launchLoginPasswordFlow()
    }
    
    private func setInitialUI() {
        welcomeLabel.text = viewModel?.welcomeBackCaption
        loginLabel.text = viewModel?.loginAccountCaption
        phoneNumberTextField.placeholder = viewModel?.phoneNumberPlaceholder
        oneTimePasswordButton.setTitle(viewModel?.oneTimePasswordCaption, for: .normal)
        loginPasswordButton.setTitle(viewModel?.loginPasswordCaption, for: .normal)
    }
    
    private func setupViewModel() {
        viewModel?.setupInitialUIHandler = { [weak self] in
            self?.setInitialUI()
        }
    }
}
