//
//  UIViewShadowExtension.swift
//  LiChengBusiness
//
//  Created by FuYe on 2019/11/19.
//  Copyright © 2019 liujidan. All rights reserved.
//

import UIKit

extension UIView {
    func inAddShadow(with color: UIColor) {
        layer.shadowColor = color.cgColor
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 0, height: 3)
    }
    
    func inAddShadow(with color: UIColor,shadowRadius: CGFloat,shadowOpacity: CGFloat,shadowOffset: CGSize) {
        layer.shadowColor = color.cgColor
        layer.shadowRadius = shadowRadius
        layer.shadowOpacity = float_t(shadowOpacity)
        layer.shadowOffset = shadowOffset
    }

    func inRemoveShadow() {
        layer.shadowOpacity = 0
    }
}
