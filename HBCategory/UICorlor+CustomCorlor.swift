//
//  UICorlor+CustomCorlor.swift
//  HaloBear
//
//  Created by 刘继丹 on 17/10/12.
//  Copyright © 2017年 刘～丹. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    @objc class var backGray: UIColor {
        let darkGreen = 0xF8F8FA
        return UIColor.rgb(fromHex: darkGreen)
    }
    
    class var customWhite: UIColor {
        let darkGreen = 0xFFFFFF
        return UIColor.rgb(fromHex: darkGreen)
    }

    @objc class var customBlack: UIColor {
        let darkGreen = 0x323038
        return UIColor.rgb(fromHex: darkGreen)
    }
    
    @objc class var customRed: UIColor {
        let darkGreen = 0xFE246C
        return UIColor.rgb(fromHex: darkGreen)
    }
    
    class var customGray: UIColor {
        let darkGreen = 0x68676C
        return UIColor.rgb(fromHex: darkGreen)
    }
    
    class var customlightGray: UIColor {
        let darkGreen = 0x888888
        return UIColor.rgb(fromHex: darkGreen)
    }
    
    class var lightGray: UIColor {
        let darkGreen = 0x999999
        return UIColor.rgb(fromHex: darkGreen)
    }
    
    
    class var shadowColor: UIColor {
        let darkGreen = 0x696969
        return UIColor.rgb(fromHex: darkGreen)
    }
    
    
    @objc class var textGray: UIColor {
        let darkGreen = 0x95949D
        return UIColor.rgb(fromHex: darkGreen)
    }
    
    ///灰色标签颜色
    @objc class var tagGray: UIColor {
        let darkGreen = 0x9C9CAB
        return UIColor.rgb(fromHex: darkGreen)
    }
    
    ///灰色标签背景颜色
    @objc class var tagBgGray: UIColor {
        let darkGreen = 0xEEF0F5
        return UIColor.rgb(fromHex: darkGreen)
    }
    
    class var lineGray: UIColor {
        let darkGreen = 0xEEEEEE
        return UIColor.rgb(fromHex: darkGreen)
    }
    
    class var spacelineGray: UIColor {
        let darkGreen = 0xCECFD1
        return UIColor.rgb(fromHex: darkGreen)
    }
 
    class var customYellow: UIColor {
        let darkGreen = 0xEACBAD
        return UIColor.rgb(fromHex: darkGreen)
    }
    
    class var customPink: UIColor {
        let darkGreen = 0xFA2091
        return UIColor.rgb(fromHex: darkGreen)
    }
    
    class var customOrange: UIColor {
        let darkGreen = 0xFC703E
        return UIColor.rgb(fromHex: darkGreen)
    }
    
    class var textMediumGray: UIColor {
        let darkGreen = 0x68676C
        return UIColor.rgb(fromHex: darkGreen)
    }
    
    class var textDarkGray: UIColor {
        let darkGreen = 0x323038
        return UIColor.rgb(fromHex: darkGreen)
    }

    class var customLineGray: UIColor {
        let darkGreen = 0xB6B6B6
        return UIColor.rgb(fromHex: darkGreen)
    }
    
    class var customlightwhite: UIColor {
        let darkGreen = 0xC8C8C8
        return UIColor.rgb(fromHex: darkGreen)
    }
    
    class var customDeText: UIColor {
        let darkGreen = 0x9C6E49
        return UIColor.rgb(fromHex: darkGreen)
    }
    
    class var customDebg: UIColor {
        let darkGreen = 0xF9EFE6
        return UIColor.rgb(fromHex: darkGreen)
    }
    
    class var customDeLine: UIColor {
        let darkGreen = 0xDDB38D
        return UIColor.rgb(fromHex: darkGreen)
    }
    
    class var customTagColor: UIColor {
        let darkGreen = 0xECEFF6
        return UIColor.rgb(fromHex: darkGreen)
    }
    
    class var customTagTextColor: UIColor {
        let darkGreen = 0x8B909D
        return UIColor.rgb(fromHex: darkGreen)
    }
    
    class var customPrice: UIColor {
        let darkGreen = 0x764721
        return UIColor.rgb(fromHex: darkGreen)
    }
    
    class var lightWhite: UIColor {
        let darkGreen = 0xEEEEEE
        return UIColor.rgb(fromHex: darkGreen)
    }
    
    class var pink: UIColor {
        let darkGreen = 0xFFEDF0
        return UIColor.rgb(fromHex: darkGreen)
    }
    
    class var selectBg: UIColor {
        let darkGreen = 0x471C23
        return UIColor.rgb(fromHex: darkGreen)
    }
    
    class var customlightPink: UIColor {
        let darkGreen = 0xFFF0F1
        return UIColor.rgb(fromHex: darkGreen)
    }
    
    class var customDFDFDF: UIColor {
        let darkGreen = 0xDFDFDF
        return UIColor.rgb(fromHex: darkGreen)
    }
    
    class func rgb(fromHex: Int) -> UIColor {
        
        let red =   CGFloat((fromHex & 0xFF0000) >> 16) / 0xFF
        let green = CGFloat((fromHex & 0x00FF00) >> 8) / 0xFF
        let blue =  CGFloat(fromHex & 0x0000FF) / 0xFF
        let alpha = CGFloat(1.0)
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}
