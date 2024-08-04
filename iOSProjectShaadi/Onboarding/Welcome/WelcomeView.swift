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
  private let imageOne = UIImageView()
  private let imageTwo = UIImageView()
  private let imageThree = UIImageView()
  private let imageFour = UIImageView()
  private let imageFive = UIImageView()
  private let imageSix = UIImageView()
  private let imageSeven = UIImageView()
  private let imageEight = UIImageView()

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
    imageOne.translatesAutoresizingMaskIntoConstraints = false
    imageTwo.translatesAutoresizingMaskIntoConstraints = false
    imageThree.translatesAutoresizingMaskIntoConstraints = false
    imageFour.translatesAutoresizingMaskIntoConstraints = false
    imageFive.translatesAutoresizingMaskIntoConstraints = false
    imageSix.translatesAutoresizingMaskIntoConstraints = false
    imageSeven.translatesAutoresizingMaskIntoConstraints = false
    imageEight.translatesAutoresizingMaskIntoConstraints = false

    // Add subviews
    addSubview(titleLabel)
    addSubview(subtitleLabel)
    addSubview(descriptionLabel)
    addSubview(getStartedButton)
    addSubview(googleSignInButton)
    addSubview(appleSignInButton)
    addSubview(accountLabel)
    addSubview(loginButton)
    addSubview(imageOne)
    addSubview(imageTwo)
    addSubview(imageThree)
    addSubview(imageFour)
    addSubview(imageFive)
    addSubview(imageSix)
    addSubview(imageSeven)
    addSubview(imageEight)

    // Configuring UI elements

    // Image One
    imageOne.image = UIImage(named: "Ellipse 49")
    imageOne.layer.cornerRadius = imageOne.frame.size.width / 2

    imageTwo.image = UIImage(named: "Ellipse 53")
    imageTwo.layer.cornerRadius = imageOne.frame.size.width / 2

    imageThree.image = UIImage(named: "Ellipse 48")
    imageThree.layer.cornerRadius = imageOne.frame.size.width / 2

    imageFour.image = UIImage(named: "Ellipse 47")
    imageFour.layer.cornerRadius = imageOne.frame.size.width / 2 

    imageFive.image = UIImage(named: "Ellipse 39")
    imageFive.layer.cornerRadius = imageOne.frame.size.width / 2    

    imageSix.image = UIImage(named: "Ellipse 63")
    imageSix.layer.cornerRadius = imageOne.frame.size.width / 2    

    imageSeven.image = UIImage(named: "Ellipse 58")
    imageSeven.layer.cornerRadius = imageOne.frame.size.width / 2   

    imageEight.image = UIImage(named: "Ellipse 46")
    imageEight.layer.cornerRadius = imageOne.frame.size.width / 2

    // Title label
    titleLabel.textAlignment = .center
    titleLabel.textColor = .black
    titleLabel.font = UIFont(name: "KumbhSans-Medium", size: 24)
    titleLabel.text = "Shadifyy"

    // Subtitle label
    subtitleLabel.textAlignment = .center
    subtitleLabel.font = UIFont(name: "KumbhSans-SemiBold", size: 30)
    subtitleLabel.numberOfLines = 0
    subtitleLabel.text = "Connecting hearts, crafting lifelong bonds."
    let attributedSubtitle = NSMutableAttributedString(string: "Connecting hearts, crafting lifelong bonds.")
    attributedSubtitle.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 11, length: 6)) // "hearts"
    attributedSubtitle.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 19, length: 8)) // "crafting"
    subtitleLabel.attributedText = attributedSubtitle

    // Description Label
    descriptionLabel.textAlignment = .center
    descriptionLabel.font = UIFont(name: "KumbhSans-Regular", size: 20)
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
      imageOne.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
      imageOne.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 221),
      imageOne.widthAnchor.constraint(equalToConstant: 150),
      imageOne.heightAnchor.constraint(equalToConstant: 150),

      imageTwo.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 180),
      imageTwo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 240),
      imageTwo.widthAnchor.constraint(equalToConstant: 130),
      imageTwo.heightAnchor.constraint(equalToConstant: 130),

      imageThree.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 300),
      imageThree.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 300),
      imageThree.widthAnchor.constraint(equalToConstant: 110),
      imageThree.heightAnchor.constraint(equalToConstant: 110), 

      imageFour.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100),
      imageFour.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 150),
      imageFour.widthAnchor.constraint(equalToConstant: 70),
      imageFour.heightAnchor.constraint(equalToConstant: 70),  

      imageFive.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 200),
      imageFive.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
      imageFive.widthAnchor.constraint(equalToConstant: 90),
      imageFive.heightAnchor.constraint(equalToConstant: 90),   

      imageSix.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 280),
      imageSix.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 130),
      imageSix.widthAnchor.constraint(equalToConstant: 150),
      imageSix.heightAnchor.constraint(equalToConstant: 150),  

      imageSeven.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 120),
      imageSeven.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      imageSeven.widthAnchor.constraint(equalToConstant: 100),
      imageSeven.heightAnchor.constraint(equalToConstant: 100),  

      imageEight.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 320),
      imageEight.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -10),
      imageEight.widthAnchor.constraint(equalToConstant: 120),
      imageEight.heightAnchor.constraint(equalToConstant: 120),

      titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
      titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      titleLabel.widthAnchor.constraint(equalToConstant: 154),
      titleLabel.heightAnchor.constraint(equalToConstant: 31),

      subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 390),
      subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

      descriptionLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 20),
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

      loginButton.topAnchor.constraint(equalTo: getStartedButton.bottomAnchor, constant: 20),
      loginButton.leadingAnchor.constraint(equalTo: accountLabel.trailingAnchor, constant: -80),
      loginButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20)
    ])
  }

  func configure(with item: WelcomeItem) {
//    subtitleLabel.text = item.subTitle
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

