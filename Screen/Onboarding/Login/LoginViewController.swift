//
//  LoginViewController.swift
//  iOSProjectShaadi
//
//  Created by Aditya Vyavahare on 19/07/24.
//

import UIKit

final class LoginViewController: UIViewController {
    // UI elements
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome Back 👻"
        label.font = UIFont(name: "KumbhSans-SemiBold", size: 24)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Login to your Account"
        label.font = UIFont(name: "KumbhSans-Regular", size: 20)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        return label
    }()
    
    lazy var numberTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor(named: "grayColor")
        textField.font = UIFont(name: "KumbhSans-Medium", size: 14)
        textField.placeholder = "+91 Enter Phone Number"
        textField.layer.cornerRadius = 5.0
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textField)
        return textField
    }()
    
    lazy var otpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Send One Time Password", for: .normal)
        button.backgroundColor = UIColor(named: "flamingoColor")
        button.titleLabel?.font = UIFont(name: "KumbhSans-SemiBold", size: 16)
        button.layer.cornerRadius = 20
        
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        return button
    }()
    
    lazy var passwordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login using Password", for: .normal)
        button.backgroundColor = UIColor(named: "grayColor")
        button.titleLabel?.font = UIFont(name: "KumbhSans-SemiBold", size: 16)
        button.layer.cornerRadius = 20
        button.setTitleColor(UIColor(named: "flamingoColor"), for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        return button
    }()
    
    // Helper components
    let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
                
        otpButton.addTarget(self, action: #selector(otpButtonTapped), for: .touchUpInside)
        passwordButton.addTarget(self, action: #selector(passwordButtonTapped), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupConstraints()
    }
}

// MARK: UI elements
extension LoginViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 46),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -46),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 46),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -46),
            
            numberTextField.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 30),
            numberTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 46),
            numberTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -46),
            numberTextField.heightAnchor.constraint(equalToConstant: 50),
            
            otpButton.topAnchor.constraint(equalTo: numberTextField.bottomAnchor, constant: 48),
            otpButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 51),
            otpButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -51),
            otpButton.heightAnchor.constraint(equalToConstant: 55),
            
            passwordButton.topAnchor.constraint(equalTo: otpButton.bottomAnchor, constant: 26),
            passwordButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 51),
            passwordButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -51),
            passwordButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}

// MARK: Button actions
extension LoginViewController {
    @objc private func otpButtonTapped() {
        let otpVC = OTPViewController()
        navigationController?.pushViewController(otpVC, animated: true)
    }
    
    @objc private func passwordButtonTapped() {
        let passwordVC = PasswordViewController()
        passwordVC.modalPresentationStyle = .overCurrentContext
        present(passwordVC, animated: true)
    }
}
