//
//  LoginScreenExternal.swift
//  Instagram
//
//  Created by Himanshu Singh on 10/02/21.
//

import Foundation
class LoginScreenExternal: LoginScreenInternal {
    override func setUIColors(loginScreen: LoginScreen) {
        loginScreen.loginBut.backgroundColor = .blue
        loginScreen.loginBut.titleLabel?.textColor = .white
    }
}
