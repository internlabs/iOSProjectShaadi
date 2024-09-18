//
//  RegistrationSuccessfulViewController.swift
//  iOSProjectShaadi
//
//  Created by Rathi, Radhika on 17/08/2024.
//

import UIKit

class RegistrationSuccessfulViewController: UIViewController {
  lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.text = "Registration Successful"
    label.font = UIFont(name: "KumbhSans-SemiBold", size: 24)

    label.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(label)
    return label
  }()

  lazy var subtitleLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.text = "Your account has been created.\nYou can now login to your account to explore more."
    label.font = UIFont(name: "KumbhSans-Regular", size: 14)
    label.textAlignment = .center

    label.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(label)
    return label
  }()

  lazy var imageCircle: UIImageView = {
    let image = UIImageView()
    image.image = UIImage(named: "Ellipse 15")

    image.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(image)
    return image
  }()

  lazy var imageTick: UIImageView = {
    let image = UIImageView()
    image.image = UIImage(named: "red.tick")

    image.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(image)
    return image
  }()

  lazy var continueToLoginButton: UIButton = {
    let button = UIButton()
    button.setTitle("Continue to Login", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.titleLabel?.font = UIFont(name: "KumbhSans-SemiBold", size: 16)
    button.layer.cornerRadius = 20
    button.backgroundColor = UIColor(named: "flamingoColor")

    button.addTarget(self, action: #selector(didTapLogin(_:)), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(button)
    return button
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    setupConstraints()
  }
}

// MARK: UI elements
extension RegistrationSuccessfulViewController {
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      imageCircle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
      imageCircle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      imageCircle.widthAnchor.constraint(equalToConstant: 220),
      imageCircle.heightAnchor.constraint(equalToConstant: 220),

      imageTick.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      imageTick.centerYAnchor.constraint(equalTo: imageCircle.centerYAnchor),
      imageTick.widthAnchor.constraint(equalToConstant: 100),
      imageTick.heightAnchor.constraint(equalToConstant: 100),

      titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 330),
      titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

      subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
      subtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      subtitleLabel.heightAnchor.constraint(equalToConstant: 60),

      continueToLoginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
      continueToLoginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      continueToLoginButton.heightAnchor.constraint(equalToConstant: 55),
      continueToLoginButton.widthAnchor.constraint(equalToConstant: 328),
    ])
  }
}

// MARK: Button actions
extension RegistrationSuccessfulViewController {
  @objc private func didTapLogin(_ sender: UIButton) {
    let loginVC = LoginViewController()
    self.navigationController?.pushViewController(loginVC, animated: true)
  }
}
