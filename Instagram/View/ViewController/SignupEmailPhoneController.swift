

import UIKit
import Foundation
import Firebase
class SignupEmailPhoneController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var phoneNumberTextField: InstaTextField!
    @IBOutlet weak var emailTextField: InstaTextField!
    
    @IBOutlet weak var emailPassword: PasswordTextField!
    
    @IBOutlet weak var phoneView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var loginButtonLabel: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomView.addTopBorderWithColor(color: .gray, width: 1)
        segmentedControl.addTarget(self, action: #selector(segmentSelected), for: .valueChanged)
        emailView.isHidden = true
        
        self.emailTextField.delegate = self
        self.phoneNumberTextField.delegate = self
        self.emailPassword.delegate = self
        
        loginButtonLabel.addTarget(self, action: #selector(loginButtonTapped), for:.touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for:.touchUpInside)
        
        
        self.nextButton.isEnabled = false
        self.nextButton.backgroundColor = #colorLiteral(red: 0.6980392157, green: 0.8745098039, blue: 0.9882352941, alpha: 1)
        
        nextButton.addTarget(self, action: #selector(signupUser), for: .touchUpInside)
    }
    
    
    
    @objc func segmentSelected(){
        if segmentedControl.selectedSegmentIndex == 0{
            phoneView.isHidden = false
            emailView.isHidden = true
            //didTextFieldTextChanged(textfield: self.phoneNumberTextField)
        }else if segmentedControl.selectedSegmentIndex == 1{
            phoneView.isHidden = true
            emailView.isHidden = false
           // didTextFieldTextChanged(textfield: self.emailTextField)
        }
    }
    @objc func loginButtonTapped(){
        self.dismiss(animated: false, completion: nil)
    }
    
    @objc func signupUser(){
//        guard let email = emailTextField.text else { return }
//        guard let password = emailPassword.text else { return }
//
//        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
//
//        }
        
    }
}

extension SignupEmailPhoneController{
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if phoneView.isHidden {
            if textField.text?.isValidEmail() ?? false {
                if self.emailPassword.text?.count ?? 0 > 6{
                    self.nextButton.isEnabled = true
                    self.nextButton.backgroundColor = .systemBlue
                    self.nextButton.setTitleColor(.white, for: .normal)
                    return
                }
            }

        } else {
            if textField.text?.count ?? 0 == 10 {
                self.nextButton.isEnabled = true
                self.nextButton.backgroundColor = .systemBlue
                self.nextButton.setTitleColor(.white, for: .normal)
                return
            }
        }
        self.nextButton.isEnabled = false
        self.nextButton.backgroundColor = #colorLiteral(red: 0.6980392157, green: 0.8745098039, blue: 0.9882352941, alpha: 1)
    }
    
}






