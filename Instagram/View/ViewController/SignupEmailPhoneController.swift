

import UIKit
import Foundation
class SignupEmailPhoneController: UIViewController {

    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var phoneView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var loginButtonLabel: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    
    @IBOutlet weak var uiStackViewPresent: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomView.addTopBorderWithColor(color: .gray, width: 1)
        
        
        segmentedControl.addTarget(self, action: #selector(segmentSelected), for: .valueChanged)
        
        
        loginButtonLabel.addTarget(self, action: #selector(loginButtonTapped), for:.touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for:.touchUpInside)
        
    }
    /*
    @objc func indexChanged(_ sender: UISegmentedControl) {
        if segmentedControl.selectedSegmentIndex == 0 {
            print("Select 0")
        } else if segmentedControl.selectedSegmentIndex == 1 {
            print("Select 1")
        }
    }
    */
    
    @objc func segmentSelected(){
        if segmentedControl.selectedSegmentIndex == 0{
            //let index = uiStackViewPresent.arrangedSubviews.firstIndex(of: view)
            //uiStackViewPresent.insertArrangedSubview(newView, at: index + 1)
           // uiStackViewPresent.
        }else if segmentedControl.selectedSegmentIndex == 1{
            print("select 1")
        }
    }
    @objc func loginButtonTapped(){
        self.dismiss(animated: false, completion: nil)
    }

}
