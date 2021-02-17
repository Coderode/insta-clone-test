//
//  LoginScreenInternal.swift
//  Instagram
//
//  Created by Himanshu Singh on 10/02/21.
//

import Foundation
import UIKit

class LoginScreenInternal: NSObject , LoginUIController {
    var view: LoginScreen? = nil {
        didSet{
            guard let loginScreen = view else { return }
            setUIColors(loginScreen: loginScreen)
            didTextFieldTextChanged(textfield: loginScreen.emailTextFiel)
            loginScreen.emailTextFiel.addTarget(self, action: #selector(didTextFieldTextChanged(textfield:)), for: .editingChanged)
            loginScreen.passwordTextField.addTarget(self, action: #selector(didTextFieldTextChanged(textfield:)), for: .editingChanged)
        }
    }
    @objc func didTextFieldTextChanged(textfield: UITextField){
        guard let screen = view else { return }
        if screen.emailTextFiel.text?.isValidInternalEmail() ?? false {
            if screen.passwordTextField.text?.count ?? 0 > 5{
                screen.loginBut.isEnabled = true
                screen.loginBut.backgroundColor = .green
                return
            }
        }
        screen.loginBut.isEnabled = false
        screen.loginBut.backgroundColor = .lightGray

    }
    func setUIColors(loginScreen: LoginScreen){
        loginScreen.loginBut.backgroundColor = .green
        loginScreen.loginBut.titleLabel?.textColor = .blue
    }
}

