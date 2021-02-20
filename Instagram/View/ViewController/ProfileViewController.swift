import UIKit

class ProfileViewController: TabBarPagesVC {
    
    @IBOutlet weak var usernameButton: UIButton!
    
    @IBOutlet weak var addPostButton: UIButton!
    
    @IBOutlet weak var menuButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.page = .profile
        usernameButton.imageToRight()
        // Do any additional setup after loading the view.
    }

}
