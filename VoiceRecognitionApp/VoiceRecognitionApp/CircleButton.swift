//
//  CircleButton.swift
//  VoiceRecognitionApp
//
//  Created by Daniel Salib on 2017-09-09.
//  Copyright © 2017 Daniel Salib. All rights reserved.
//

import UIKit

class CircleButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 30.0 {
        didSet{
            setupView()
        }
    }
    
    override func prepareForInterfaceBuilder() {
        setupView()
    }
    
    func setupView() {
        layer.cornerRadius = cornerRadius
    }
}
