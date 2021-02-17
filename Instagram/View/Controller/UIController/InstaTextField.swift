//
//  PasswordTextField.swift
//  Instagram
//
//  Created by craterzone on 11/02/21.
//

import Foundation
import UIKit
class InstaTextField: UITextField {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5
        layer.borderWidth = 1
        layer.borderColor = UIColor.gray.cgColor
        frame.size.height = 45
        backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        super.setPadding()
    }
    
   
    override var placeholder: String?{
        get {
            self.attributedPlaceholder?.string
            
        }
        set{
            guard let value = newValue else {
                self.attributedPlaceholder = nil
                return
            }
            self.attributedPlaceholder = NSAttributedString(string: value, attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        }
    }
}

