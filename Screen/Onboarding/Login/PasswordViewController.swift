//
//  PasswordViewController.swift
//  iOSProjectShaadi
//
//  Created by Aditya Vyavahare on 07/08/24.
//

import UIKit

final class PasswordViewController: UIViewController {
    // Helper components
    private var containerViewBottomConstraint: NSLayoutConstraint!
    
    // UI elements
    lazy var blurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterialLight)
        let blurView = UIVisualEffectView(effect: blurEffect)
        
        blurView.translatesAutoresizingMaskIntoConstraints = false
        return blurView
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 40
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]     // Top-left & top-right corners respectively
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "closeButton"), for: .normal)
        button.backgroundColor = UIColor(named: "grayColor")
        button.layer.cornerRadius = 20
        
        button.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(button)
        return button
    }()
    
    lazy var titlelabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome Back 👻"
        label.font = UIFont(name: "KumbhSans-SemiBold", size: 24)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(label)
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Login to your account with password"
        label.font = UIFont(name: "KumbhSans-Regular", size: 20)
        label.numberOfLines = 0
        
        label.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(label)
        return label
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor(named: "grayColor")
        textField.font = UIFont(name: "KumbhSans-Medium", size: 14)
        textField.placeholder = "Enter Password"
        textField.layer.cornerRadius = 5.0
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textField)
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login to your account", for: .normal)
        button.backgroundColor = UIColor(named: "flamingoColor")
        button.titleLabel?.font = UIFont(name: "KumbhSans-SemiBold", size: 16)
        button.layer.cornerRadius = 20
        
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        return button
    }()
    
    lazy var otpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login with One Time Password", for: .normal)
        button.backgroundColor = UIColor(named: "grayColor")
        button.titleLabel?.font = UIFont(name: "KumbhSans-SemiBold", size: 16)
        button.layer.cornerRadius = 20
        button.setTitleColor(UIColor(named: "flamingoColor"), for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        view.addSubview(blurEffectView)
        view.addSubview(containerView)
        
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        otpButton.addTarget(self, action: #selector(otpButtonTapped), for: .touchUpInside)
        
        // Keyboard notifications
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupConstraints()
    }
}


// MARK: UI elements
extension PasswordViewController {
    private func setupConstraints() {
        containerViewBottomConstraint = containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        NSLayoutConstraint.activate([
            blurEffectView.topAnchor.constraint(equalTo: view.topAnchor),
            blurEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            blurEffectView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blurEffectView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            containerViewBottomConstraint,
            containerView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.5),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            closeButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 25),
            closeButton.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 40),
            closeButton.widthAnchor.constraint(equalToConstant: 40),
            
            titlelabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 40),
            titlelabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 46),
            titlelabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -46),
            
            subtitleLabel.topAnchor.constraint(equalTo: titlelabel.bottomAnchor, constant: 20),
            subtitleLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 46),
            subtitleLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -(UIScreen.main.bounds.width * 0.25)),
            
            passwordTextField.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 30),
            passwordTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 46),
            passwordTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -46),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            loginButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 51),
            loginButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -51),
            loginButton.heightAnchor.constraint(equalToConstant: 55),
            
            otpButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10),
            otpButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 51),
            otpButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -51),
            otpButton.heightAnchor.constraint(equalToConstant: 55),
        ])
    }
}

// MARK: Button actions
extension PasswordViewController {
    @objc private func closeButtonTapped() {
        self.dismiss(animated: true)
    }
    
    @objc private func loginButtonTapped() {
        print(">>-Login button tapped")
    }
    
    @objc private func otpButtonTapped() {
        let otpVC = UINavigationController(rootViewController: OTPViewController())
        otpVC.modalPresentationStyle = .overFullScreen
        self.present(otpVC, animated: true)
    }
}

// MARK: Helper methods
extension PasswordViewController {
    @objc private func keyboardWillShow(_ notification: Notification) {
        if let userInfo = notification.userInfo,
           let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
           let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double,
           let curve = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt {
            
            let keyboardHeight = keyboardFrame.height
            let bottomInset = keyboardHeight - view.safeAreaInsets.bottom
            
            // Change the bottom constraint
            containerViewBottomConstraint.constant = -bottomInset
            
            UIView.animate(withDuration: duration, delay: 0, options: UIView.AnimationOptions(rawValue: curve), animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        if let userInfo = notification.userInfo,
           let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double,
           let curve = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt {
            
            // Reset the bottom constraint
            containerViewBottomConstraint.constant = 0
            
            UIView.animate(withDuration: duration, delay: 0, options: UIView.AnimationOptions(rawValue: curve), animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
}
