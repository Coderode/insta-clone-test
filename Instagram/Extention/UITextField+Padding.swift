//
//  UITextField+Padding.swift
//  Instagram
//
//  Created by Himanshu Singh on 10/02/21.
//

import Foundation
import UIKit
extension UITextField {
    func setPadding(){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
