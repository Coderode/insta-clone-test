

import UIKit
import Foundation
class SignupEmailPhoneController: UIViewController {

    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var phoneView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var loginButtonLabel: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomView.addTopBorderWithColor(color: .gray, width: 1)
        
        
        segmentedControl.addTarget(self, action: #selector(segmentSelected), for: .valueChanged)
        emailView.isHidden = true
        
        loginButtonLabel.addTarget(self, action: #selector(loginButtonTapped), for:.touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for:.touchUpInside)
        
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
        self.dismiss(animated: false, completion: nil)
    }

}


class EmailViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

class PhoneViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
