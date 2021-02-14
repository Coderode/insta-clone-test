

import UIKit
import Foundation
class SignupEmailPhoneController: UIViewController {

    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var phoneView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var bottomView: UIView!
    
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var loginButtonLabel: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    
    private var phoneNumber = PhoneViewController()
    private var email = EmailViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomView.addTopBorderWithColor(color: .gray, width: 1)
        
        
        segmentedControl.addTarget(self, action: #selector(segmentSelected), for: .valueChanged)
        emailView.isHidden = true
        
        loginButtonLabel.addTarget(self, action: #selector(loginButtonTapped), for:.touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for:.touchUpInside)
        
        
        
        //phone and email text change
        
    }
    
    /*
    @objc func didTextFieldTextChanged(textfield: UITextField){
        if phoneView.isHidden {
            if textfield.text?.isValidEmail() ?? false {
                self.nextButton.isEnabled = true
                self.nextButton.backgroundColor = .systemBlue
                self.nextButton.setTitleColor(.white, for: .normal)
                return
            }
            
        } else {
            if textfield.text?.count ?? 0 == 10 {
                self.nextButton.isEnabled = true
                self.nextButton.backgroundColor = .systemBlue
                self.nextButton.setTitleColor(.white, for: .normal)
                return
            }
        }
        self.nextButton.isEnabled = false
        self.nextButton.backgroundColor = #colorLiteral(red: 0.6980392157, green: 0.8745098039, blue: 0.9882352941, alpha: 1)

    }
    */
    
    @objc func segmentSelected(){
        if segmentedControl.selectedSegmentIndex == 0{
            phoneView.isHidden = false
            emailView.isHidden = true
           // didTextFieldTextChanged(textfield: self.phoneNumber.phoneNumber)
        }else if segmentedControl.selectedSegmentIndex == 1{
            phoneView.isHidden = true
            emailView.isHidden = false
            //didTextFieldTextChanged(textfield: self.email.email)
        }
    }
    @objc func loginButtonTapped(){
        self.dismiss(animated: false, completion: nil)
    }

}


class EmailViewController : UIViewController {
    @IBOutlet weak var email: InstaTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

class PhoneViewController : UIViewController {
    @IBOutlet weak var phoneNumber: InstaTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
