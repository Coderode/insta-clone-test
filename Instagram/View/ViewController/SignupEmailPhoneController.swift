

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
        }else if segmentedControl.selectedSegmentIndex == 1{
            phoneView.isHidden = true
            emailView.isHidden = false
        }
    }
    @objc func loginButtonTapped(){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        nextViewController.uiController = LoginLightScreen()
        nextViewController.modalPresentationStyle = .fullScreen
        weak var pvc = self.presentingViewController
        self.dismiss(animated: false, completion: {
            pvc?.present(nextViewController, animated: false, completion: nil)
        })
    }
    
    @objc func signupUser(){
        guard let email = emailTextField.text else { return }
        guard let password = emailPassword.text else { return }

        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            guard let user = authResult?.user, error == nil else {
                //show alert on wrong user email or password
                let alertController = UIAlertController(title: "Error!", message: error!.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                
                //action for cancel button
                let action = UIAlertAction(title: "Try Again", style: .cancel) { (action:UIAlertAction) in
                }
                
                //adding actions to alert pop up
                alertController.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.white
                alertController.view.tintColor = UIColor.black
                alertController.addAction(action)
                self.present(alertController, animated: true, completion: nil)
                return
            }
            let alertController = UIAlertController(title: "Successful!", message: "Account has been created for \(user.email!).", preferredStyle: UIAlertController.Style.alert)
            
            let firebaseAuth = Auth.auth()
            do {
              try firebaseAuth.signOut()
            } catch let signOutError as NSError {
              //print ("Error signing out: %@", signOutError)
            }
            
            let action = UIAlertAction(title: "Login", style: .default) { (action:UIAlertAction) in
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                nextViewController.uiController = LoginLightScreen()
                nextViewController.modalPresentationStyle = .fullScreen
                weak var pvc = self.presentingViewController
                self.dismiss(animated: false, completion: {
                    pvc?.present(nextViewController, animated: false, completion: nil)
                })
            }
            //adding actions to alert pop up
            alertController.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.white
            alertController.view.tintColor = UIColor.black
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
}

extension SignupEmailPhoneController{
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if phoneView.isHidden {
            if self.emailTextField.text?.isValidEmail() ?? false {
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






