//
//  SignupViewController.swift
//  Instagram
//
//  Created by craterzone on 04/02/21.
//

import UIKit

class SignupViewController: UIViewController {
    
    
    @IBOutlet weak var right: UIView!
    @IBOutlet weak var left: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var goToLoginLabel: UIButton!
    @IBOutlet weak var goToLoginButton: UIButton!
    @IBOutlet weak var topLangButton: UIButton!
    
    
    @IBOutlet weak var signupPhoneEmail: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        topLangButton.setImage( UIImage(named: "down_arrow"), for: .normal)
        topLangButton.imageToRight()
        
        bottomView.addTopBorderWithColor(color: .gray, width: 1)
        left.addTopBorderWithColor(color: .gray, width: 1)
        right.addTopBorderWithColor(color: .gray, width: 1)
        
        goToLoginButton.addTarget(self, action: #selector(loginButtonTapped), for:.touchUpInside)
        goToLoginLabel.addTarget(self, action: #selector(loginButtonTapped), for:.touchUpInside)
        signupPhoneEmail.addTarget(self, action: #selector(signupWithPhoneEmailTapped), for: .touchUpInside)
    }
    
    
    /*
    func signup(){
        //Sign the user
        let email : String? = emailText.text!
        let pass : String? = passwordText.text!
        
        if email! == "" || pass! == "" {
            print("Error in signup")
        }else{
            users[email!] = pass
            let homePVC = RootPageViewController()
            homePVC.modalPresentationStyle = .fullScreen
            self.present(homePVC, animated: true, completion:  nil)
        }
        
        
    }
    
    func setupProfile(){
        //TODO : crate user profile
    }
    @IBAction func signupButtonAction(_ sender: Any) {
        signup()
    }
    */
    
    
    //taking out from the stack
    @objc func loginButtonTapped(){
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @objc func signupWithPhoneEmailTapped(){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SignupEmailPhoneController") as! SignupEmailPhoneController
        nextViewController.modalPresentationStyle = .fullScreen
        //self.present(nextViewController, animated:true, completion:nil)
        
        weak var pvc = self.presentingViewController

        self.dismiss(animated: false, completion: {
            pvc?.present(nextViewController, animated: false, completion: nil)
        })
    }
    

}
