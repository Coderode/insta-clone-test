//
//  RootViewController.swift
//  Instagram
//
//  Created by craterzone on 13/02/21.
//

import UIKit



class RootViewController: UIViewController {
    
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var messageView: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var viewContainingScrollView: UIView!
    
    var cameraScreen: CameraViewController {
        for child in self.children{
            if let cameraVC = child as? CameraViewController{
                return cameraVC
            }
        }
        assert(false, "Camera VC not found!")
        return CameraViewController()
    }
    
    var tabBarScreen : TabBarController {
        for child in self.children{
            if let tabBarVC = child as? TabBarController{
                return tabBarVC
            }
        }
        assert(false, "TAB BAR VC not found!")
        return TabBarController()
    }
    
    var messageScreen : MessageViewController {
        for child in self.children{
            if let messageVC = child as? MessageViewController{
                return messageVC
            }
        }
        assert(false, "message vc not found!")
        return MessageViewController()
    }
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let newOffset = CGPoint(x : self.scrollView.contentOffset.x+scrollView.frame.size.width, y : self.scrollView.contentOffset.y)
        self.scrollView.setContentOffset(newOffset, animated: false)
    }
    
    
    

    

    


}
extension RootViewController : UIScrollViewDelegate {
    
}
