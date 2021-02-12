//
//  LoginViewController.swift
//  Instagram
//
//  Created by craterzone on 04/02/21.
//

import UIKit

//protocol for login screen ui
protocol LoginScreen: UIViewController {
    var emailTextFiel: UITextField { get }
    var passwordTextField: UITextField { get }
    var loginBut: UIButton { get }
    var baseViewP: UIView { get }
    var topLangButtonP: UIButton { get }
    var instaLogoP: UIImageView { get }
    var inputStackP: UIStackView { get }
    var forgotPasswordStackViewP: UIStackView { get }
    var forgotpasswordLabelP: UIButton { get }
    var forgotPasswordButtonP: UIButton { get }
    var orViewP: UIView { get }
    var facebookButtonP: UIButton { get }
    var bottomContainerViewP: UIView { get }
    var bottomViewP: UIView { get }
    var signupstackP: UIStackView { get }
    var signupBlueButtonP: UIButton { get }
    var forgotPasswordBlueButtonP: UIButton { get }
    var baseScrollViewP: UIView { get }
    var superViewP: UIView{ get }
}

//login ui controller
class LoginViewController: UIViewController ,LoginScreen {
    
    
    //implementing login screen ui properties
    var emailTextFiel: UITextField{ return emailText }
    var passwordTextField: UITextField { return passwordText }
    var loginBut: UIButton { return loginButton}
    var baseViewP: UIView { return baseview }
    var topLangButtonP: UIButton { return topLangButton }
    var instaLogoP: UIImageView { return instaLogo }
    var inputStackP: UIStackView { return inputStack }
    var forgotPasswordStackViewP: UIStackView { return forgotPasswordStackView }
    var forgotpasswordLabelP: UIButton { return forgotpasswordLabel }
    var forgotPasswordButtonP: UIButton { return forgotPasswordButton }
    var orViewP: UIView { return orView }
    var facebookButtonP: UIButton { return facebookButton }
    var bottomContainerViewP: UIView { return bottomContainerView }
    var bottomViewP: UIView { return bottomView }
    var signupstackP: UIStackView { return signupstack }
    var signupBlueButtonP: UIButton { return signupBlueButton }
    var forgotPasswordBlueButtonP: UIButton { return forgotPasswordBlueButton }
    var baseScrollViewP: UIView { return baseScrollView }
    var superViewP: UIView{ return superView }
    
    //IBOutlet
    @IBOutlet private weak var emailText: UITextField!
    @IBOutlet private weak var passwordText: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var leftView: UIView!
    @IBOutlet private weak var rightView: UIView!
    @IBOutlet weak var baseview: UIView!
    @IBOutlet weak var topLangButton: UIButton!
    @IBOutlet weak var instaLogo: UIImageView!
    @IBOutlet weak var inputStack: UIStackView!
    @IBOutlet weak var forgotPasswordStackView: UIStackView!
    @IBOutlet weak var forgotpasswordLabel: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var orView: UIView!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var bottomContainerView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var signupstack: UIStackView!
    @IBOutlet weak var forgotPasswordBlueButton: UIButton!
    @IBOutlet weak var signupBlueButton: UIButton!
    
    @IBOutlet weak var signupLabelButton: UIButton!
    
    @IBOutlet weak var baseScrollView: UIScrollView!
    @IBOutlet var superView: UIView!
    
    
    
    
    //  login ui controller!
    var uiController: LoginUIController!
    
    //after the load of login ui screen
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiController.view = self
        bottomView.addTopBorderWithColor(color: .gray, width: 1)
        passwordText.setPadding()
        emailText.setPadding()
        leftView.addTopBorderWithColor(color: .gray, width: 1)
        rightView.addTopBorderWithColor(color: .gray, width: 1)
        topLangButton.setImage( UIImage(named: "down_arrow"), for: .normal)
        topLangButton.imageToRight()
        
        //actions
        //login button target
        loginButton.addTarget(self, action: #selector(userLogin), for: .touchUpInside)
        
        //move to signup controller
        signupBlueButton.addTarget(self, action: #selector(signupButtonTapped), for:.touchUpInside)
        signupLabelButton.addTarget(self, action: #selector(signupButtonTapped), for:.touchUpInside)
        
        

    }
    
    /*
    @objc func didTapOnDarkMode(){
        self.uiController = LoginDarkScreen()
        self.uiController.view = self
    }
    @objc func didTapOnLightMode(){
        self.uiController = LoginLightScreen()
        self.uiController.view = self

    }
     */
    
    @objc func userLogin(){
        guard let email = emailText.text else { return }
        guard let password = passwordText.text else {return}
        //checking email and password
        if email == "sk@gmail.com" && password == "password" {
            let homePVC = RootPageViewController()
            homePVC.modalPresentationStyle = .fullScreen
            self.present(homePVC, animated: true, completion:  nil)
        }else{
            //show alert on wrong user email or password
            let alertController = UIAlertController(title: "Forgot password?", message: "You can log in with your linked facebook account.", preferredStyle: UIAlertController.Style.alert)
            //action for default button
            let action1 = UIAlertAction(title: "Use Facebook", style: .default) { (action:UIAlertAction) in
                //print("You've pressed default");
            }
            //action for cancel button
            let action2 = UIAlertAction(title: "Try Again", style: .cancel) { (action:UIAlertAction) in
                //print("You've pressed cancel");
            }
            
            //adding actions to alert pop up
            alertController.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.white
            alertController.view.tintColor = UIColor.black
            alertController.addAction(action1)
            alertController.addAction(action2)
            self.present(alertController, animated: true, completion: nil)
            
        }
    }
    
    @objc func signupButtonTapped(){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated:true, completion:nil)
    }
    
}
