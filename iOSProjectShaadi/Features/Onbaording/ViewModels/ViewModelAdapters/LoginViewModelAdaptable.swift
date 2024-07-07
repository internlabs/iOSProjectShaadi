//
//  LoginViewModelAdaptable.swift
//  iOSProjectShaadi
//
//  Created by Khushal on 7/6/24.
//

import Foundation

typealias VoidClosure = () -> Void

typealias LoginViewModelAdaptable = LoginViewModelDisplayable & LoginViewModelActionable

protocol LoginViewModelDisplayable {
    var welcomeBackCaption: String { get }
    var loginAccountCaption: String { get }
    var phoneNumberPlaceholder: String { get }
    var oneTimePasswordCaption: String { get }
    var loginPasswordCaption: String { get }
}

protocol LoginViewModelActionable {
    // MARK: Handlers
    var setupInitialUIHandler: VoidClosure? { get set }
    
    // MARK: Functions
    func loadUI()
    func launchOneTimePasswordFlow()
    func launchLoginPasswordFlow()
}
