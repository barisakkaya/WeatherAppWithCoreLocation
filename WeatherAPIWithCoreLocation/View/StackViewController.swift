//
//  StackViewController.swift
//  WeatherAPIWithCoreLocation
//
//  Created by Barış Can Akkaya on 16.06.2021.
//

import UIKit

class StackViewController: UIStackView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    

}

extension UIStackView {
func insertCustomizedViewIntoStack(background: UIColor, cornerRadius: CGFloat, shadowColor: CGColor, shadowOpacity: Float, shadowRadius: CGFloat) {
        let subView = UIView(frame: bounds)
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        subView.layer.cornerRadius = cornerRadius
        subView.backgroundColor = background
        subView.layer.shadowColor = shadowColor
        subView.layer.shadowOpacity = shadowOpacity
        subView.layer.shadowOffset = .zero
        subView.layer.shadowRadius = shadowRadius
        insertSubview(subView, at: 0)
    }
}
