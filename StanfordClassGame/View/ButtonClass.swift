//
//  ButtonClass.swift
//  StanfordClassGame
//
//  Created by Lucas Moraes on 05/12/2017.
//  Copyright © 2017 LSolutions. All rights reserved.
//

import UIKit

@IBDesignable class CustomButton: UIButton {
    @IBInspectable var cornerR: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerR
        }
    }
}
