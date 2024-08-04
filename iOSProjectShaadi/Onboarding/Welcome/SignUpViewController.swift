//
//  SignUpViewController.swift
//  iOSProjectShaadi
//
//  Created by Rathi, Radhika on 17/08/2024.
//

// TODO: -
// Add Checkbox
// Update all fonts
// Update next button

import UIKit

class SignUpViewController: UIViewController {
  private var usernameTextField: UITextField = {
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.placeholder = "Enter full name"
    textField.layer.cornerRadius = 5
    textField.backgroundColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
    return textField
  }()

  private var emailTextField: UITextField = {
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.placeholder = "Enter Email"
    textField.autocapitalizationType = .none
    textField.layer.cornerRadius = 5
    textField.backgroundColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
    return textField
  }()

  private var passwordTextField: UITextField = {
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.placeholder = "Enter Password"
    textField.layer.cornerRadius = 5
    textField.backgroundColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
    textField.isSecureTextEntry = true
    return textField
  }()

  private var phoneNumberTextField: UITextField = {
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.placeholder = "Enter Phone Number"
    textField.layer.cornerRadius = 5
    textField.backgroundColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
    let countryCodeLabel = UILabel()
    countryCodeLabel.text = "+91"
    countryCodeLabel.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5)
    countryCodeLabel.sizeToFit()
    textField.leftView = countryCodeLabel
    textField.leftViewMode = .always
    return textField
  }()

  private var showPasswordLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Show"
    label.font = UIFont.systemFont(ofSize: 12)
    label.textColor = UIColor(red: 239/255, green: 75/255, blue: 75/255, alpha: 1)
    label.isUserInteractionEnabled = true
    return label
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white

    // Title label
    let titleLabel = UILabel()
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.textAlignment = .left
    titleLabel.textColor = .black
    titleLabel.font = UIFont.systemFont(ofSize: 24)
    titleLabel.text = "Complete your profile 👋"
    titleLabel.numberOfLines = 0
    self.view.addSubview(titleLabel)

    // Add subviews
    self.view.addSubview(usernameTextField)
    self.view.addSubview(emailTextField)
    self.view.addSubview(passwordTextField)
    self.view.addSubview(phoneNumberTextField)
    self.view.addSubview(showPasswordLabel)

    // Show my name to all
    let showMyNameLabel = UILabel()
    showMyNameLabel.translatesAutoresizingMaskIntoConstraints = false
    showMyNameLabel.text = "Show my name to all"
    showMyNameLabel.font = UIFont.systemFont(ofSize: 11)
    showMyNameLabel.textColor = UIColor(red: 95/255, green: 99/255, blue: 104/255, alpha: 1)
    self.view.addSubview(showMyNameLabel)

    // If you turn off, you won't be able to see name of other members
    let turnOffLabel = UILabel()
    turnOffLabel.translatesAutoresizingMaskIntoConstraints = false
    turnOffLabel.text = "If you turn off, you wont be able to see name of other members"
    turnOffLabel.font = UIFont.systemFont(ofSize: 10)
    turnOffLabel.textColor = UIColor(red: 95/255, green: 99/255, blue: 104/255, alpha: 1)
    self.view.addSubview(turnOffLabel)

    // UILabel - Contact Privacy Settings
    let contactLabel = UILabel()
    contactLabel.translatesAutoresizingMaskIntoConstraints = false
    contactLabel.text = "Contact Privacy Settings"
    contactLabel.font = UIFont.systemFont(ofSize: 14)
    contactLabel.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5)
    self.view.addSubview(contactLabel)

    // Show to all label
    let showToAllLabel = createSelectableLabel(text: "Show to all")
    self.view.addSubview(showToAllLabel)

    // Hide from all label
    let hideFromAllLabel = createSelectableLabel(text: "Hide from all")
    self.view.addSubview(hideFromAllLabel)

    // Show to members I express interest in label
    let showToMembersLabel = createSelectableLabel(text: "Show to members I express interest in")
    self.view.addSubview(showToMembersLabel)

    // Next Button
    let nextButton = UIButton()
    nextButton.translatesAutoresizingMaskIntoConstraints = false
    nextButton.setTitle("Next", for: .normal)
    nextButton.backgroundColor = UIColor(red: 239/255, green: 75/255, blue: 75/255, alpha: 1)
    nextButton.layer.cornerRadius = 20
    nextButton.addTarget(self, action: #selector(didTapNext(_:)), for: .touchUpInside)
    self.view.addSubview(nextButton)

    // Constraints
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 101),
      titleLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 46),
      titleLabel.widthAnchor.constraint(equalToConstant: 258),
      titleLabel.heightAnchor.constraint(equalToConstant: 62),

      usernameTextField.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 180),
      usernameTextField.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 46),
      usernameTextField.widthAnchor.constraint(equalToConstant: 300),
      usernameTextField.heightAnchor.constraint(equalToConstant: 50),

      showMyNameLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 240),
      showMyNameLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 72),
      showMyNameLabel.widthAnchor.constraint(equalToConstant: 120),
      showMyNameLabel.heightAnchor.constraint(equalToConstant: 14),

      turnOffLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 260),
      turnOffLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 72),
      turnOffLabel.widthAnchor.constraint(equalToConstant: 320),
      turnOffLabel.heightAnchor.constraint(equalToConstant: 13),

      emailTextField.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 290),
      emailTextField.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 46),
      emailTextField.widthAnchor.constraint(equalToConstant: 300),
      emailTextField.heightAnchor.constraint(equalToConstant: 50),

      passwordTextField.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 370),
      passwordTextField.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 46),
      passwordTextField.widthAnchor.constraint(equalToConstant: 300),
      passwordTextField.heightAnchor.constraint(equalToConstant: 50),

      showPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.topAnchor),
      showPasswordLabel.leadingAnchor.constraint(equalTo: passwordTextField.trailingAnchor, constant: 10),

      phoneNumberTextField.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 446),
      phoneNumberTextField.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 46),
      phoneNumberTextField.widthAnchor.constraint(equalToConstant: 300),
      phoneNumberTextField.heightAnchor.constraint(equalToConstant: 50),

      contactLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 538),
      contactLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 46),
      contactLabel.widthAnchor.constraint(equalToConstant: 162),
      contactLabel.heightAnchor.constraint(equalToConstant: 18),

      showToAllLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 572),
      showToAllLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 46),
      showToAllLabel.widthAnchor.constraint(equalToConstant: 111),
      showToAllLabel.heightAnchor.constraint(equalToConstant: 35),

      hideFromAllLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 572),
      hideFromAllLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 171),
      hideFromAllLabel.widthAnchor.constraint(equalToConstant: 111),
      hideFromAllLabel.heightAnchor.constraint(equalToConstant: 35),

      showToMembersLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 623),
      showToMembersLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 46),
      showToMembersLabel.widthAnchor.constraint(equalToConstant: 312),
      showToMembersLabel.heightAnchor.constraint(equalToConstant: 35),

      nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
      nextButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 121),
      nextButton.widthAnchor.constraint(equalToConstant: 161),
      nextButton.heightAnchor.constraint(equalToConstant: 55),
    ])

    // Adding gesture recognizer to showPasswordLabel
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(togglePasswordVisibility))
    showPasswordLabel.addGestureRecognizer(tapGesture)

    // Set as the right view of passwordTextField
    passwordTextField.rightView = showPasswordLabel
    passwordTextField.rightViewMode = .always
  }

  private func createSelectableLabel(text: String) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = text
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 14)
    label.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5)
    label.layer.borderWidth = 2
    label.layer.borderColor = CGColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
    label.layer.cornerRadius = 20
    label.isUserInteractionEnabled = true

    // Add tap gesture recognizer
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleLabelTap(_:)))
    label.addGestureRecognizer(tapGesture)

    return label
  }

  @objc private func didTapNext(_ sender: UIButton) {
    let verifyPhoneNumberVC = VerifyPhoneNumberViewController()
    self.navigationController?.pushViewController(verifyPhoneNumberVC, animated: true)
  }

  @objc private func handleLabelTap(_ sender: UITapGestureRecognizer) {
    if let label = sender.view as? UILabel {
      if label.layer.borderColor == CGColor(red: 239/255, green: 75/255, blue: 75/255, alpha: 1) {
        // If selected, unselect and change to original border color
        label.layer.borderColor = CGColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
      } else {
        // If unselected, select and change to highlight border color
        label.layer.borderColor = CGColor(red: 239/255, green: 75/255, blue: 75/255, alpha: 1)
      }
    }
  }

  @objc private func togglePasswordVisibility() {
    passwordTextField.isSecureTextEntry.toggle()
    showPasswordLabel.text = passwordTextField.isSecureTextEntry ? "Show" : "Hide"
  }

  // MARK: - Alert

  private func showAlert(title: String, message: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    present(alert, animated: true, completion: nil)
  }
}
