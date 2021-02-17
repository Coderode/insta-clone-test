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
    @IBOutlet weak var TabBarCotroller: UIView!
    @IBOutlet weak var messageView: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var viewContainingScrollView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.delegate = self
        guard let view = self.scrollView else {return}
//        view.contentOffset.x = CGFloat(view.frame.size.width * CGFloat(1))
//        self.view.frame.size = view.frame.size
        view.setContentOffset(CGPoint(x: 1, y: 0), animated: true)
        print(view.contentOffset.x)
//        self.scrollView.scrollRectToVisible(frame, animated: false)
    }

}
extension RootViewController: UIScrollViewDelegate {
    
}
