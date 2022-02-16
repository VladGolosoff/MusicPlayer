//
//  GradientLayer.swift
//  MusicPlayer
//
//  Created by Владислав Голосов on 15.02.2022.
//

import UIKit
@IBDesignable

class GradientLayer: UIView {
    @IBInspectable var topColor: UIColor = .green
    @IBInspectable var bottomColor: UIColor = .blue
    
    var startPointX: CGFloat = 0
    var startPointY: CGFloat = 0
    var endPointX: CGFloat = 1
    var endPointY: CGFloat = 1
    
    override func layoutSubviews() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: startPointX, y: startPointY)
        gradientLayer.endPoint = CGPoint(x: endPointX, y: endPointY)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
        
    }
}
