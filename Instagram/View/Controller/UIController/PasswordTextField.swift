//
//  PasswordTextField.swift
//  Instagram
//
//  Created by craterzone on 11/02/21.
//

import Foundation
import UIKit

class PasswordTextField: InstaTextField{
    override var isSecureTextEntry: Bool{
        get{
            super.isSecureTextEntry
        }
        set{
            super.isSecureTextEntry = newValue
            let image = newValue ? UIImage(named: "password_non_secure") : UIImage(named: "password_secure")
            guard let rightToggleButton = self.rightView as? UIButton else { return }
            rightToggleButton.setImage(image, for: .normal)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        let rightButton = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        rightButton.addTarget(self, action: #selector(toggleSecureEntry), for: .touchUpInside)
    }
    @objc private func toggleSecureEntry(){
        self.isSecureTextEntry.toggle()
    }
}
