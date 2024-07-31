//
//  LoginViewController.swift
//  iOSProjectShaadi
//
//  Created by Aditya Vyavahare on 19/07/24.
//

import UIKit

class LoginViewController: UIViewController {
    // UI elements
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let numberTextField = UITextField()
    let otpButton = UIButton()
    let passwordButton = UIButton()
    
    // Helper components
    let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUIelements()
    }
}

extension LoginViewController {
    private func setupUIelements() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        numberTextField.translatesAutoresizingMaskIntoConstraints = false
        otpButton.translatesAutoresizingMaskIntoConstraints = false
        passwordButton.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(numberTextField)
        view.addSubview(otpButton)
        view.addSubview(passwordButton)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 148),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 46),
            
            subtitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 202),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 46),
            
            numberTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 280),
            numberTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 46),
            numberTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -46),
            numberTextField.heightAnchor.constraint(equalToConstant: 50),
            
            otpButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 378),
            otpButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 51),
            otpButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -51),
            otpButton.heightAnchor.constraint(equalToConstant: 55),
            
            passwordButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 454),
            passwordButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 51),
            passwordButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -51),
            passwordButton.heightAnchor.constraint(equalToConstant: 55)
            ])
        
        titleLabel.text = "Welcome Back 👻"
        titleLabel.font = UIFont(name: "KumbhSans-SemiBold", size: 24)
        
        subtitleLabel.text = "Login to your Account"
        subtitleLabel.font = UIFont(name: "KumbhSans-Regular", size: 20)
        
        numberTextField.backgroundColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
        numberTextField.font = UIFont(name: "KumbhSans-Medium", size: 14)
        numberTextField.placeholder = "+91 Enter Phone Number"
        numberTextField.layer.cornerRadius = 5.0
        
        otpButton.setTitle("Send One Time Password", for: .normal)
        otpButton.backgroundColor = UIColor(red: 239/255, green: 75/255, blue: 75/255, alpha: 1)
        otpButton.titleLabel?.font = UIFont(name: "KumbhSans-SemiBold", size: 16)
        otpButton.layer.cornerRadius = 20
        otpButton.addTarget(self, action: #selector(otpButtonTapped), for: .touchUpInside)
        
        passwordButton.setTitle("Login using Password", for: .normal)
        passwordButton.backgroundColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
        passwordButton.titleLabel?.font = UIFont(name: "KumbhSans-SemiBold", size: 16)
        passwordButton.layer.cornerRadius = 20
        passwordButton.setTitleColor(UIColor(red: 239/255, green: 75/255, blue: 75/255, alpha: 1), for: .normal)
        passwordButton.addTarget(self, action: #selector(passwordButtonTapped), for: .touchUpInside)
    }
}

// MARK: Button actions
extension LoginViewController {
    @objc private func otpButtonTapped() {
        let otpVC = OTPViewController()
        navigationController?.pushViewController(otpVC, animated: true)
    }
    
    @objc private func passwordButtonTapped() {
        print("Password")
    }
}
