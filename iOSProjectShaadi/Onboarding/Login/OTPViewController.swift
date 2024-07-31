//
//  OTPViewController.swift
//  iOSProjectShaadi
//
//  Created by Aditya Vyavahare on 29/07/24.
//

import UIKit

class OTPViewController: UIViewController {
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    var otpTextFields = [UITextField]()
    let resendButton = UIButton()
    let submitButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUIelements()
    }
}

// MARK: UI elements
extension OTPViewController {
    private func setupUIelements() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        resendButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(resendButton)
        view.addSubview(submitButton)
        
        let otpStackView = UIStackView()
        otpStackView.axis = .horizontal
        otpStackView.alignment = .fill
        otpStackView.distribution = .fillEqually
        otpStackView.spacing = 10
        
        for textFieldNumber in 0..<4 {
            let textField = UITextField()
            textField.tag = textFieldNumber
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.black.cgColor
            textField.layer.cornerRadius = 27
            textField.clipsToBounds = true
            textField.textAlignment = .center
            textField.keyboardType = .numberPad
            textField.delegate = self
            textField.font = UIFont.systemFont(ofSize: 24)
            textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
            otpTextFields.append(textField)
            otpStackView.addArrangedSubview(textField)
            
            textField.heightAnchor.constraint(equalToConstant: 60).isActive = true
            textField.widthAnchor.constraint(equalToConstant: 60).isActive = true
        }
        
        otpStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(otpStackView)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 124),
            titleLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 63),
            titleLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -63),
            titleLabel.heightAnchor.constraint(equalToConstant: 62),
            
            subtitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 247),
            subtitleLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 55),
            subtitleLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -55),
            subtitleLabel.heightAnchor.constraint(equalToConstant: 60),
            
            otpStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 348),
            otpStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 68),
            otpStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -68),
            otpStackView.heightAnchor.constraint(equalToConstant: 60),
            
            resendButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 455),
            resendButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            submitButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            submitButton.heightAnchor.constraint(equalToConstant: 55),
            submitButton.widthAnchor.constraint(equalToConstant: 161)
        ])
        
        titleLabel.numberOfLines = 0
        subtitleLabel.numberOfLines = 0
        
        titleLabel.text = "Enter the code sent on your number 📱"
        titleLabel.font = UIFont(name: "KumbhSans-SemiBold", size: 24)
        
        let subtitleText = "Enter 4-digit code we have sent to the phone number +91 7977828994"
        let subtitleAttributedText = NSMutableAttributedString(string: subtitleText)
        let phoneRange = (subtitleText as NSString).range(of: "+91 7977828994")
        let subtitleTextFont = UIFont(name: "KumbhSans-Regular", size: 16)
        let subtitleNumberFont = UIFont(name: "KumbhSans-SemiBold", size: 16)
        subtitleAttributedText.addAttribute(.font, value: subtitleTextFont, range: NSMakeRange(0, subtitleText.count))
        subtitleAttributedText.addAttribute(.font, value: subtitleNumberFont, range: phoneRange)
        subtitleLabel.attributedText = subtitleAttributedText
        subtitleLabel.textAlignment = .center
        
        let resendButtonText = "Didn’t get the OTP? Resend Again"
        let resendButtonAttributedText = NSMutableAttributedString(string: resendButtonText)
        let resendTextRange = (resendButtonText as NSString).range(of: "Resend Again")
        let resendButtonTextFont = UIFont(name: "KumbhSans-Regular", size: 16)
        let resendAgainTextFont = UIFont(name: "KumbhSans-SemiBold", size: 16)
        resendButtonAttributedText.addAttribute(.font, value: resendButtonTextFont, range: NSMakeRange(0, resendButtonText.count))
        resendButtonAttributedText.addAttribute(.font, value: resendAgainTextFont, range: resendTextRange)
        resendButtonAttributedText.addAttribute(.foregroundColor, value: UIColor(red: 221/255, green: 87/255, blue: 82/255, alpha: 1), range: resendTextRange)
        resendButtonAttributedText.addAttribute(.underlineStyle, value: NSUnderlineStyle.thick.rawValue, range: resendTextRange)
        resendButtonAttributedText.addAttribute(.underlineColor, value: UIColor(red: 221/255, green: 87/255, blue: 82/255, alpha: 1), range: resendTextRange)

        resendButton.setAttributedTitle(resendButtonAttributedText, for: .normal)
        
        submitButton.setTitle("Next", for: .normal)
        submitButton.setTitleColor(.white, for: .normal)
        submitButton.titleLabel?.font = UIFont(name: "KumbhSans-SemiBold", size: 16)
        submitButton.layer.cornerRadius = 20
        submitButton.backgroundColor = UIColor(red: 221/255, green: 87/255, blue: 82/255, alpha: 1)
    }
}

// MARK: Delegate conformance
extension OTPViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(red: 221/255, green: 87/255, blue: 82/255, alpha: 1).cgColor
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.label.cgColor
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if let text = textField.text, text.count >= 1 {
            if let nextField = view.viewWithTag(textField.tag + 1) as? UITextField {
                nextField.becomeFirstResponder()
            } else {
                textField.resignFirstResponder()
            }
        }
    }
}
