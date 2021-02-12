//
//  String+Validation.swift
//  Instagram
//
//  Created by Himanshu Singh on 10/02/21.
//

import Foundation
extension String{
    func isValidInternalEmail() -> Bool {
        if self.contains("@instagram.com"){
            return isValidEmail()
        }
        return false
    }
    func isValidEmail() -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
}
