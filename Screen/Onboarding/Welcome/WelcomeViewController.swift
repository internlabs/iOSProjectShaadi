//
//  WelcomeViewController.swift
//  iOSProjectShaadi
//
//  Created by Rathi Radhika on 24/07/2024.
//

import UIKit

final class WelcomeViewController: UIViewController, WelcomeViewModelDelegate {
  private let welcomeView = WelcomeView()
  private let viewModel: WelcomeViewModel

  init(viewModel: WelcomeViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func loadView() {
    print("loadView called")
    view = welcomeView
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    print("viewDidLoad called")

    welcomeView.getStartedButtonAction = { [weak self] in
      self?.viewModel.handleGetStarted()
    }

    // TODO: Integrate with backend
    welcomeView.googleButtonAction = {
    }

    welcomeView.appleButtonAction = { [weak self] in
      self?.viewModel.handleAppleSignIn()
    }

    welcomeView.loginButtonAction = { [weak self] in
      self?.viewModel.handleLogin()
    }

    bindViewModel()
    updateView()
  }

  private func bindViewModel() {
    viewModel.navigateToSignUp = { [weak self] in
      let signUpViewController = SignUpViewController()
      self?.navigationController?.pushViewController(signUpViewController, animated: true)
    }
  }

  private func updateView() {
    print("updateView called")
  }

  // MARK: - WelcomeViewModelDelegate Methods

  func navigateToSignUp() {
    let signUpViewController = SignUpViewController()
    navigationController?.pushViewController(signUpViewController, animated: true)
  }
}


