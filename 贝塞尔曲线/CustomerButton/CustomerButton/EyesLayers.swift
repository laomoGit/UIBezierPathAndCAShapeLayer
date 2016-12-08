//
//  EyesLayers.swift
//  CustomerButton
//
//  Created by 莫清霆 on 2016/11/7.
//  Copyright © 2016年 莫清霆. All rights reserved.
//

import Foundation
import  UIKit
class EyesLayers:NSObject{
    
    var eyeFirstLightLayer:CAShapeLayer
    var eyeSecondLightLayer:CAShapeLayer
    var eyeballLayer:CAShapeLayer
    var topEyessocketLayer:CAShapeLayer
    var bottomEyesocketLayer:CAShapeLayer
    
     override init() {
        self.bottomEyesocketLayer = CAShapeLayer()
        self.eyeballLayer = CAShapeLayer()
        self.eyeFirstLightLayer = CAShapeLayer()
        self.eyeSecondLightLayer = CAShapeLayer()
        self.topEyessocketLayer = CAShapeLayer()
    }
    
    
}
