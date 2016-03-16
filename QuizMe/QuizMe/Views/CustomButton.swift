//
//  CustomButton.swift
//  QuizMe
//
//  Created by Dulio Denis on 3/15/16.
//  Copyright © 2016 Dulio Denis. All rights reserved.
//

import UIKit

@IBDesignable
class CustomButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 4.0 {
        didSet {
            setupView()
        }
    }
    
    @IBInspectable var fontColor: UIColor = UIColor.whiteColor() {
        didSet {
            tintColor = fontColor
        }
    }
    
    override func awakeFromNib() {
        setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    
    func setupView() {
        layer.cornerRadius = cornerRadius
    }
}
