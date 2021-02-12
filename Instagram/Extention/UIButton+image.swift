//
//  UIButton+image.swift
//  Instagram
//
//  Created by craterzone on 11/02/21.
//

import Foundation
import UIKit

extension UIButton {
  func imageToRight() {
      transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
      titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
      imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
  }
}
