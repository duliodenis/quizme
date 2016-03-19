//
//  Card.swift
//  QuizMe
//
//  Created by Dulio Denis on 3/18/16.
//  Copyright © 2016 Dulio Denis. All rights reserved.
//

import UIKit

class Card: UIView {
    
    let shapes = ["shape1", "shape2", "shape3", "shape4",
                  "shape5", "shape6", "shape7", "shape8",
                  "shape9", "shape10", "shape11", "shape12",
                  "shape13", "shape14", "shape15", "shape16"]

    var currentShape: String!
    
    @IBOutlet weak var shapeImage: UIImageView!
    
    @IBInspectable var cornerRadius: CGFloat = 4.0 {
        didSet {
            setupView()
        }
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    
    override func awakeFromNib() {
        setupView()
        selectShape()
    }
    
    func setupView() {
        layer.shadowOpacity = 0.8
        layer.shadowRadius  = 5.0
        layer.shadowOffset  = CGSizeMake(0.0, 2.0)
        layer.shadowColor   = UIColor(red: 157.0/255.0, green: 157.0/255.0, blue: 157.0/255.0, alpha: 1.0).CGColor
        setNeedsLayout()
    }
    
    func selectShape() {
        currentShape = shapes[Int(arc4random_uniform(UInt32(shapes.count)))]
        shapeImage.image = UIImage(named: currentShape)
    }
}
