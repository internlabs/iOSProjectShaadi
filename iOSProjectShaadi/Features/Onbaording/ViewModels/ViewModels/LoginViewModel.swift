//
//  LoginViewModel.swift
//  iOSProjectShaadi
//
//  Created by Khushal on 7/6/24.
//

import Foundation

enum JourneyFlow {
    case login
    case registration
}

class LoginViewModel {
    var setupInitialUIHandler: VoidClosure?
    var currentFlow: JourneyFlow? = .login
}

extension LoginViewModel: LoginViewModelDisplayable {
    var welcomeBackCaption: String { return "Welcome Back to Project Shaadi" }
    var phoneNumberPlaceholder: String { return "Enter your phone number" }
    var oneTimePasswordCaption: String { return "Send one time password" }
    var loginPasswordCaption: String { return "Login using password" }
    var loginAccountCaption: String {
        currentFlow == .login ? "Login bla bla bla" : "Registration bla bla bla"
    }
}

extension LoginViewModel: LoginViewModelActionable {
    func loadUI() {
        setupInitialUIHandler?()
    }
    
    func launchOneTimePasswordFlow() {
        print("Launch One Time Password flow")
    }
    
    func launchLoginPasswordFlow() {
        print("Launch Login Password flow")
    }
}
