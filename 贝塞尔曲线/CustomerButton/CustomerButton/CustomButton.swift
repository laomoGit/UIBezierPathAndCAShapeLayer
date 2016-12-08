//
//  CustomButton.swift
//  CustomerButton
//
//  Created by 莫清霆 on 2016/11/7.
//  Copyright © 2016年 莫清霆. All rights reserved.
//

import UIKit

class CustomButton: UIControl {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var shape:CAShapeLayer
    var target:id_t = 0
    var action:Selector?
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension CustomButton{
    
}
