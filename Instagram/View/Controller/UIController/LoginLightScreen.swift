//
//  Instagram
//  Login Light mode view controller
//

import Foundation
import UIKit
class LoginLightScreen: NSObject , LoginUIController {
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
        if screen.emailTextFiel.text?.isValidEmail() ?? false {
            if screen.passwordTextField.text?.count ?? 0 > 5{
                screen.loginBut.isEnabled = true
                screen.loginBut.backgroundColor = .systemBlue
                screen.loginBut.setTitleColor(.white, for: .normal)
                return
            }
        }
        screen.loginBut.isEnabled = false
        screen.loginBut.backgroundColor = #colorLiteral(red: 0.6980392157, green: 0.8745098039, blue: 0.9882352941, alpha: 1)

    }
    func setUIColors(loginScreen: LoginScreen){
        loginScreen.loginBut.backgroundColor = .systemBlue
        loginScreen.loginBut.setTitleColor(.white, for: .normal)
        loginScreen.baseViewP.backgroundColor = .white
        loginScreen.topLangButtonP.backgroundColor = .white
        loginScreen.instaLogoP.backgroundColor = .white
        loginScreen.instaLogoP.tintColor = .black
        loginScreen.inputStackP.backgroundColor = .white
        loginScreen.forgotPasswordStackViewP.backgroundColor = .white
        loginScreen.forgotpasswordLabelP.backgroundColor = .white
        loginScreen.forgotPasswordButtonP.backgroundColor = .white
        loginScreen.orViewP.backgroundColor = .white
        loginScreen.facebookButtonP.backgroundColor = .white
        loginScreen.bottomContainerViewP.backgroundColor = .white
        loginScreen.baseViewP.backgroundColor = .white
        loginScreen.signupstackP.backgroundColor = .white
        loginScreen.bottomViewP.backgroundColor = .white
        loginScreen.signupBlueButtonP.setTitleColor( #colorLiteral(red: 0, green: 0.1944569061, blue: 0.4141411746, alpha: 1) , for: .normal)
        loginScreen.forgotPasswordBlueButtonP.setTitleColor(#colorLiteral(red: 0, green: 0.1944569061, blue: 0.4141411746, alpha: 1), for: .normal)
        loginScreen.baseScrollViewP.backgroundColor = .white
        loginScreen.superViewP.backgroundColor = .white
        loginScreen.emailTextFiel.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        loginScreen.emailTextFiel.tintColor = .black
        loginScreen.emailTextFiel.textColor = .black
        loginScreen.passwordTextField.textColor = .black
        loginScreen.passwordTextField.tintColor = .black
        loginScreen.passwordTextField.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        loginScreen.emailTextFiel.attributedPlaceholder = NSAttributedString(string: loginScreen.emailTextFiel.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        loginScreen.passwordTextField.attributedPlaceholder = NSAttributedString(string: loginScreen.passwordTextField.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
    }
    
    
}


