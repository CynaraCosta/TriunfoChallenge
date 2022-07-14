//
//  UIViewController+Background.swift
//  TriunfoChallenge
//
//  Created by Cynara Costa on 14/07/22.
//

import UIKit

extension UIViewController {
    func setBackground(){
        let gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = [UIColor(named: "purple4")?.cgColor, UIColor(named: "purple3")?.cgColor]
        self.view.layer.insertSublayer(gradient, at: 0)
    }
}
