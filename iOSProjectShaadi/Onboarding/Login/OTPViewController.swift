//
//  OTPViewController.swift
//  iOSProjectShaadi
//
//  Created by Aditya Vyavahare on 29/07/24.
//

import UIKit

final class OTPViewController: UIViewController {
    // UI elements
    lazy var titleLabel: UILabel = {
        lazy var label = UILabel()
        label.numberOfLines = 0
        label.text = "Enter the code sent on your number 📱"
        label.font = UIFont(name: "KumbhSans-SemiBold", size: 24)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        let subtitleText = "Enter 4-digit code we have sent to the phone number +91 7977828994"
        let subtitleAttributedText = NSMutableAttributedString(string: subtitleText)
        let phoneRange = (subtitleText as NSString).range(of: "+91 7977828994")
        let subtitleTextFont = UIFont(name: "KumbhSans-Regular", size: 16)
        let subtitleNumberFont = UIFont(name: "KumbhSans-SemiBold", size: 16)
        subtitleAttributedText.addAttribute(.font, value: subtitleTextFont as Any, range: NSMakeRange(0, subtitleText.count))
        subtitleAttributedText.addAttribute(.font, value: subtitleNumberFont as Any, range: phoneRange)
        label.attributedText = subtitleAttributedText
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        return label
    }()
        
    lazy var resendButton: UIButton = {
        let button = UIButton()
        let resendButtonText = "Didn’t get the OTP? Resend Again"
        let resendButtonAttributedText = NSMutableAttributedString(string: resendButtonText)
        let resendTextRange = (resendButtonText as NSString).range(of: "Resend Again")
        let resendButtonTextFont = UIFont(name: "KumbhSans-Regular", size: 16)
        let resendAgainTextFont = UIFont(name: "KumbhSans-SemiBold", size: 16)
        resendButtonAttributedText.addAttribute(.font, value: resendButtonTextFont as Any, range: NSMakeRange(0, resendButtonText.count))
        resendButtonAttributedText.addAttribute(.font, value: resendAgainTextFont as Any, range: resendTextRange)
        resendButtonAttributedText.addAttribute(.foregroundColor, value: UIColor(named: "flamingoColor") as Any, range: resendTextRange)
        resendButtonAttributedText.addAttribute(.underlineStyle, value: NSUnderlineStyle.thick.rawValue, range: resendTextRange)
        resendButtonAttributedText.addAttribute(.underlineColor, value: UIColor(named: "flamingoColor") as Any, range: resendTextRange)
        button.setAttributedTitle(resendButtonAttributedText, for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        return button
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "KumbhSans-SemiBold", size: 16)
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor(named: "flamingoColor")
        
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        return button
    }()
    
    let otpStackView = OTPStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
            
        otpStackView.delegate = self
        otpStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(otpStackView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupConstraints()
    }
}

// MARK: UI elements
extension OTPViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 63),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -63),
            titleLabel.heightAnchor.constraint(equalToConstant: 62),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 60),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 55),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -55),
            subtitleLabel.heightAnchor.constraint(equalToConstant: 60),
            
            otpStackView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 40),
            otpStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 68),
            otpStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -68),
            otpStackView.heightAnchor.constraint(equalToConstant: 60),
            
            resendButton.topAnchor.constraint(equalTo: otpStackView.bottomAnchor, constant: 40),
            resendButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.heightAnchor.constraint(equalToConstant: 55),
            nextButton.widthAnchor.constraint(equalToConstant: 161)
        ])
    }
}

extension OTPViewController: OTPDelegate {
    func didChangeValidity(isValid: Bool) {}
}
