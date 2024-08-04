//
//  WelcomeViewModel.swift
//  iOSProjectShaadi
//
//  Created by Rathi, Radhika on 31/07/2024.
//

import Foundation
import GoogleSignIn

class WelcomeViewModel {
  private var items: [WelcomeItem]
  private var currentIndex: Int = 0

  var navigateToSignUp: (() -> Void)?
  var navigateToFirstLogin: (() -> Void)?


  var currentItem: WelcomeItem {
    return items[currentIndex]
  }

  init(items: [WelcomeItem]) {
    self.items = items
  }

  func handleGetStarted() {

    navigateToSignUp?()
    print("Get Started button action triggered in ViewModel")
  }

  func handleGoogleSignIn(presenter: UIViewController) {
    print("Google sign-in action triggered in ViewModel")
    GIDSignIn.sharedInstance.signIn(withPresenting: presenter) { signInResult, error in

      guard error == nil else { return }
      print("no error")

      // If sign in succeeded, display the app's main content View.
      guard let signInResult = signInResult else { return }
      print("sign in  result success")

      let user = signInResult.user
      let emailAddress = user.profile?.email
      let fullName = user.profile?.name
      let familyName = user.profile?.familyName
      let profilePicUrl = user.profile?.imageURL(withDimension: 320)
      print("Email \(emailAddress)")
    }

  }

  func handleAppleSignIn() {
    print("Apple sign-in action triggered in ViewModel")
  }

  func handleLogin() {
    print("Login button action triggered in ViewModel")

    navigateToFirstLogin?()

  }
}
