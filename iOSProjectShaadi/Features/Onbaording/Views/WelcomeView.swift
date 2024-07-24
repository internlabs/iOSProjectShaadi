//
//  WelcomeView.swift
//  iOSProjectShaadi
//
//  Created by Rathi, Radhika on 24/07/2024.
//

import UIKit

class WelcomeView: UIView {

  private let titleLabel = UILabel()
  private let subtitleLabel = UILabel()
  private let descriptionLabel = UILabel()
  private let getStartedButton = UIButton(type: .system)
  private let googleSignInButton = UIButton(type: .system)
  private let appleSignInButton = UIButton(type: .system)
  private let accountLabel = UILabel()
  private let loginButton = UIButton(type: .system)

  override init(frame: CGRect) {
    super.init(frame: frame)
    setUpViews()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setUpViews()
  }

  private func setUpViews() {
    print("setupViews called")
    backgroundColor = .white

    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    getStartedButton.translatesAutoresizingMaskIntoConstraints = false
    googleSignInButton.translatesAutoresizingMaskIntoConstraints = false
    appleSignInButton.translatesAutoresizingMaskIntoConstraints = false
    accountLabel.translatesAutoresizingMaskIntoConstraints = false
    loginButton.translatesAutoresizingMaskIntoConstraints = false

    // Add subviews
    addSubview(titleLabel)
    addSubview(subtitleLabel)
    addSubview(descriptionLabel)
    addSubview(getStartedButton)
    addSubview(googleSignInButton)
    addSubview(appleSignInButton)
    addSubview(accountLabel)
    addSubview(loginButton)

    // Configuring UI elements

    // Title label
    titleLabel.textAlignment = .center
    titleLabel.textColor = .black
    titleLabel.font = UIFont.systemFont(ofSize: 24)
    let attributedTitle = NSMutableAttributedString(string: "Match.Mingle")
    attributedTitle.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 6, length: 6))
    titleLabel.attributedText = attributedTitle

    // Subtitle label
    subtitleLabel.textAlignment = .center
    subtitleLabel.font = UIFont.systemFont(ofSize: 40)
    subtitleLabel.numberOfLines = 0

    // Description Label
    descriptionLabel.textAlignment = .center
    descriptionLabel.font = UIFont.systemFont(ofSize: 20)
    descriptionLabel.numberOfLines = 0

    // Get Started Button
    getStartedButton.setTitle("Get Started", for: .normal)
    getStartedButton.setTitleColor(.white, for: .normal)
    getStartedButton.backgroundColor = UIColor(red: 239/255, green: 75/255, blue: 75/255, alpha: 1)
    getStartedButton.layer.cornerRadius = 20
    if let arrowImage = UIImage(named: "arrow.right")?.withRenderingMode(.alwaysOriginal) {
      getStartedButton.setImage(arrowImage, for: .normal)
    } else {
      print("Arrow icon not found")
    }
    getStartedButton.semanticContentAttribute = .forceRightToLeft
    getStartedButton.clipsToBounds = true

    // Setting  google and apple buttons with original rendering mode
    if let googleImage = UIImage(named: "google.logo")?.withRenderingMode(.alwaysOriginal) {
      googleSignInButton.setImage(googleImage, for: .normal)
    } else {
      print("Google icon not found")
    }
    googleSignInButton.contentMode = .scaleAspectFit
    googleSignInButton.imageView?.contentMode = .scaleAspectFit
    googleSignInButton.tintColor = .clear
    googleSignInButton.backgroundColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
    googleSignInButton.layer.cornerRadius = 15

    if let appleImage = UIImage(named: "apple.logo")?.withRenderingMode(.alwaysOriginal) {
      appleSignInButton.setImage(appleImage, for: .normal)
    } else {
      print("Apple icon not found")
    }
    appleSignInButton.contentMode = .scaleAspectFit
    appleSignInButton.imageView?.contentMode = .scaleAspectFit
    appleSignInButton.tintColor = .clear
    appleSignInButton.backgroundColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
    appleSignInButton.layer.cornerRadius = 15

    // Already have an account? Log in
    accountLabel.textAlignment = .center
    accountLabel.font = UIFont.systemFont(ofSize: 16)
    accountLabel.isUserInteractionEnabled = true
    accountLabel.text = "Already have an account?"
    //    let attributedAccountLabel = NSMutableAttributedString(string: "Already have an account?")
    //    attributedAccountLabel.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 25, length: 6))
    //    accountLabel.attributedText = attributedAccountLabel

    // Login Button
    loginButton.setTitle("Login", for: .normal)
    loginButton.setTitleColor(.systemBlue, for: .normal)
    loginButton.setTitleColor(UIColor(.red), for: .normal)
    loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)

    // Set up constraints
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
      titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      titleLabel.widthAnchor.constraint(equalToConstant: 154),
      titleLabel.heightAnchor.constraint(equalToConstant: 31),

      subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 250),
      subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

      descriptionLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 100),
      descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

      getStartedButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
      getStartedButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 28),
      getStartedButton.widthAnchor.constraint(equalToConstant: 210),
      getStartedButton.heightAnchor.constraint(equalToConstant: 60),

      googleSignInButton.topAnchor.constraint(equalTo: getStartedButton.topAnchor),
      googleSignInButton.leadingAnchor.constraint(equalTo: getStartedButton.trailingAnchor, constant: 10),
      googleSignInButton.widthAnchor.constraint(equalToConstant: 57),
      googleSignInButton.heightAnchor.constraint(equalToConstant: 60),

      appleSignInButton.topAnchor.constraint(equalTo: getStartedButton.topAnchor),
      appleSignInButton.leadingAnchor.constraint(equalTo: googleSignInButton.trailingAnchor, constant: 10),
      appleSignInButton.widthAnchor.constraint(equalToConstant: 57),
      appleSignInButton.heightAnchor.constraint(equalToConstant: 60),

      accountLabel.topAnchor.constraint(equalTo: getStartedButton.bottomAnchor, constant: 20),
      accountLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      accountLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

      loginButton.leadingAnchor.constraint(equalTo: accountLabel.trailingAnchor, constant: -80),
      loginButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50)
    ])
  }

  func configure(with item: WelcomeItem) {
    subtitleLabel.text = item.title
    descriptionLabel.text = item.description
  }

  var getStartedButtonAction: (() -> Void)? {
    didSet {
      getStartedButton.addTarget(self, action: #selector(getStartedButtonTapped), for: .touchUpInside)
    }
  }

  var googleButtonAction: (() -> Void)? {
    didSet {
      googleSignInButton.addTarget(self, action: #selector(googleButtonTapped), for: .touchUpInside)
    }
  }

  var appleButtonAction: (() -> Void)? {
    didSet {
      appleSignInButton.addTarget(self, action: #selector(appleButtonTapped), for: .touchUpInside)
    }
  }

  var loginButtonAction: (() -> Void)? {
    didSet {
      loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
  }

  @objc private func getStartedButtonTapped() {
    getStartedButtonAction?()
  }

  @objc private func googleButtonTapped() {
    googleButtonAction?()
  }

  @objc private func appleButtonTapped() {
    appleButtonAction?()
  }

  @objc private func loginButtonTapped() {
    loginButtonAction?()
  }
}

