//
//  ViewController.swift
//  CustomerButton
//
//  Created by 莫清霆 on 2016/11/7.
//  Copyright © 2016年 莫清霆. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    var eyesLayers:EyesLayers = EyesLayers()
    let center = CGPoint(x: 200, y: 300)
    var tempLayer:CAShapeLayer? = nil

    var currentLayerCount = 0//当前layer层数
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //获取当前layer数
        self.currentLayerCount = (self.view.layer.sublayers?.count)!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //MARK:矩形
    @IBAction func rectangle(_ sender: Any) {
        //删除当前layer
        self.removeCurrentLayers()
       
        //一个黑色的矩形
        let layer = CAShapeLayer()
        layer.frame = CGRect(x: 80, y: 200, width: 250, height: 200)
        layer.backgroundColor = UIColor.orange.cgColor
        self.tempLayer = layer
        self.view.layer.addSublayer(layer)
        
        
    }
    
    
    //MARK:红边矩形
    @IBAction func rectangleRedDidTouch(_ sender: Any) {
        //删除当前layer
        self.removeCurrentLayers()
        
        self.view.layer.removeAllAnimations()
        //一个只有红色边框的矩形
         let path = UIBezierPath(rect: CGRect(x: 110, y: 200, width: 150, height: 100))
         let layer = CAShapeLayer()
         layer.path = path.cgPath
         //        layer.fillColor = UIColor.black.cgColor
         
         layer.strokeColor = UIColor.red.cgColor
         layer.fillColor = UIColor.clear.cgColor
         
         self.view.layer.addSublayer(layer)
        

    }
    //MARK:圆角
    @IBAction func circularDidTouch(_ sender: Any) {
        //删除当前layer
        self.removeCurrentLayers()
        
       
        //画一个带圆角的图形
         
         let rect = CGRect(x: 110, y: 200, width: 150, height: 100)
         
         let path = UIBezierPath(roundedRect: rect, cornerRadius: 40)
         
         let layer = CAShapeLayer()
         
         layer.path = path.cgPath
         
         layer.fillColor = UIColor.clear.cgColor
         layer.strokeColor = UIColor.purple.cgColor
         
         self.view.layer.addSublayer(layer)
        layer.setNeedsDisplay()

    }
    //MARK:定制圆角
    @IBAction func customCircularDidTouch(_ sender: Any) {
        //删除当前layer
       self.removeCurrentLayers()
       
        //可以指定起始角和半径画圆
         let radius:CGFloat = 60.0
         
         let startAngle:CGFloat = 0.0
         
         let endAngle:CGFloat = CGFloat(M_PI * 2)
         
         let path = UIBezierPath(arcCenter: self.view.center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
         
         let layer = CAShapeLayer()
         layer.path = path.cgPath
         
         layer.fillColor = UIColor.clear.cgColor
         layer.strokeColor = UIColor.white.cgColor
         
         
         self.view.layer.addSublayer(layer)
        layer.setNeedsDisplay()

    }
    //MARK:贝塞尔
    @IBAction func bezierCurveDidTouch(_ sender: Any) {
        //删除当前layer
        self.removeCurrentLayers()
        
         //贝塞尔曲线的画法是由起点、终点、控制点三个参数来画的
         let startPoint = CGPoint(x: 50, y: 300)
         
         let endPoint = CGPoint(x: 300, y: 300)
         
         let controlPoint1 = CGPoint(x: 180, y: 250)
         
         let controlPoint2 = CGPoint(x: 200, y: 400)
         
         let layer1 = CAShapeLayer()
         layer1.frame = CGRect(x: startPoint.x, y: startPoint.y, width: 5, height: 5)
         layer1.backgroundColor = UIColor.red.cgColor
         
         let layer2 = CAShapeLayer()
         layer2.frame = CGRect(x: controlPoint1.x, y: controlPoint1.y, width: 5, height: 5)
         layer2.backgroundColor = UIColor.red.cgColor
         
         let layer3 = CAShapeLayer()
         layer3.frame = CGRect(x: endPoint.x, y: endPoint.y, width: 5, height: 5)
         layer3.backgroundColor = UIColor.red.cgColor
         
         let path = UIBezierPath()
         let layer = CAShapeLayer()
         
         path.move(to: startPoint)
         //        path.addQuadCurve(to: endPoint, controlPoint: controlPoint1)
         path.addCurve(to: endPoint, controlPoint1: controlPoint1,controlPoint2: controlPoint2)
         layer.path = path.cgPath
         layer.fillColor = UIColor.clear.cgColor
         layer.strokeColor = UIColor.orange.cgColor
         
         self.view.layer.addSublayer(layer)
         self.view.layer.addSublayer(layer1)
         self.view.layer.addSublayer(layer2)
         self.view.layer.addSublayer(layer3)
        
        
        
        
    }
    //MARK:眼睛
    @IBAction func eyeDidTouch(_ sender: Any) {
        //删除当前layer
        self.removeCurrentLayers()
        
//        self.tempLayer?.removeFromSuperlayer()
        self.setupTopEyessocketLayer()
        self.setupEyeFirstLightLayer()
        self.setupEyeSecondLightLayer()
        self.setupEyeballLayer()
        self.setupBottomEyesocketLayer()
        
        
        
        
        
    
    }
    

    //MARK:轮子
    @IBAction func wheelDidTouch(_ sender: Any) {
        //删除当前layer
        self.removeCurrentLayers()
        self.drawWhiteCircle()
        self.drawFirstRedCircle()
        self.drawSecondtRedCircle()
        self.drawThreeLeaf()
    }
    //MARK:三个动画
    @IBAction func threeAnnimationDidTouch(_ sender: Any) {
        //删除当前layer
        self.removeCurrentLayers()
        self.animation1()
        self.animation2()
        self.animation3()
        self.aniomation4()
        
    }
    
    
    
    ///删除当前的layer
    func removeCurrentLayers(){
        let layers = self.view.layer.sublayers
        for (index,layer) in (layers?.enumerated())! {
            if index > self.currentLayerCount - 1{
                layer.removeFromSuperlayer()
            }
        }
    }
    
}

//MARK: 画写轮眼
extension ViewController{
    
    func drawWhiteCircle(){
        let layer = CAShapeLayer()
        let radius = 120.0
        let startAngle = 0.0
        let endAngle = M_PI * 2
        
        let path = UIBezierPath()
        path.addArc(withCenter: self.center, radius: CGFloat(radius), startAngle: CGFloat(startAngle), endAngle: CGFloat(endAngle), clockwise: true)
        
        layer.lineWidth = 0.5
        layer.path = path.cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = UIColor.white.cgColor
        layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        self.view.layer.addSublayer(layer)
        
        
        
    }
    
    func drawFirstRedCircle(){
        
        let layer = CAShapeLayer()
        let radius = 105.0
        let startAngle = 0.0
        let endAngle = M_PI * 2
        
        let path = UIBezierPath()
        path.addArc(withCenter: self.center, radius: CGFloat(radius), startAngle: CGFloat(startAngle), endAngle: CGFloat(endAngle), clockwise: true)
        
        layer.lineWidth = 30
        layer.path = path.cgPath
        layer.fillColor = UIColor.red.cgColor
        layer.strokeColor = UIColor.clear.cgColor
        
        self.view.layer.addSublayer(layer)
    }
    
    func drawSecondtRedCircle(){
        
        let layer = CAShapeLayer()
        let radius = 70.0
        let startAngle = 0.0
        let endAngle = M_PI * 2
        
        let path = UIBezierPath()
        path.addArc(withCenter: self.center, radius: CGFloat(radius), startAngle: CGFloat(startAngle), endAngle: CGFloat(endAngle), clockwise: true)
        
        layer.lineWidth = 10
        layer.path = path.cgPath
        layer.fillColor = UIColor.red.cgColor
        layer.strokeColor = UIColor.black.cgColor
        
        self.view.layer.addSublayer(layer)
    }
    
    func drawThreeLeaf(){
        let layer = CAShapeLayer()
        
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: self.center.x / 2, y: self.center.y - 75))
        path.addCurve(to: CGPoint(x: self.center.x + 91.0, y: self.center.y + 52), controlPoint1: CGPoint(x: self.center.x - 12.0, y: self.center.y - 30), controlPoint2: CGPoint(x: self.center.x + 91.0, y: self.center.y))
        
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = UIColor.black.cgColor
        
        layer.path = path.cgPath
        self.view.layer.addSublayer(layer)
    }

}



//MARK: 画眼睛
extension ViewController{
    //设置
    func setupTopEyessocketLayer(){
        let topEyessocketLayer:CAShapeLayer = CAShapeLayer()
        let center = CGPoint(x: self.view.frame.width / 2, y: self.view.frame.height / 2)
        
        let path = UIBezierPath()
        
        
        let startPoint = CGPoint(x: 0, y: self.view.frame.height / 2)
        path.move(to: startPoint)
        let endPoint = CGPoint(x: self.view.frame.width, y: self.view.frame.height / 2)
        let controlPoint = CGPoint(x: self.view.frame.width / 2, y: center.y - center.y - 20)
        
        path.addQuadCurve(to: endPoint, controlPoint: controlPoint)
        
        topEyessocketLayer.borderColor = UIColor.black.cgColor
        topEyessocketLayer.lineWidth = 1.0
        topEyessocketLayer.path = path.cgPath
        topEyessocketLayer.fillColor = UIColor.clear.cgColor
        topEyessocketLayer.strokeColor = UIColor.white.cgColor
        self.view.layer.addSublayer(topEyessocketLayer)
        
        
        
        
//        var eyeSecondLightLayer:CAShapeLayer = CAShapeLayer()
//        var eyeballLayer:CAShapeLayer = CAShapeLayer()
//        var topEyessocketLayer:CAShapeLayer = CAShapeLayer()
//        var bottomEyesocketLayer:CAShapeLayer = CAShapeLayer()
    }
    
    
    func setupEyeFirstLightLayer(){
        let eyeFirstLightLayer = CAShapeLayer()
        
        let center = CGPoint(x: self.view.frame.width / 2, y: self.view.frame.height / 2)
        let path = UIBezierPath()
        
        let radius = self.view.frame.width * 0.2
        let startAngle = (230.0 / 180.0) * M_PI
        let endAngle = (265.0 / 180.0) * M_PI
        
        path.addArc(withCenter: center, radius: radius, startAngle: CGFloat(startAngle), endAngle: CGFloat(endAngle), clockwise: true)
        
        eyeFirstLightLayer.borderColor = UIColor.black.cgColor
        eyeFirstLightLayer.lineWidth = 13.0
        eyeFirstLightLayer.path = path.cgPath
        eyeFirstLightLayer.fillColor = UIColor.clear.cgColor
        eyeFirstLightLayer.strokeColor = UIColor.white.cgColor
        self.view.layer.addSublayer(eyeFirstLightLayer)

        
    }
    
    func setupEyeSecondLightLayer(){
        let eyeSecondLightLayer = CAShapeLayer()
        let center = CGPoint(x: self.view.frame.width / 2, y: self.view.frame.height / 2)
        let path = UIBezierPath()
        let radius = self.view.frame.width * 0.2
        let startAngle = (211.0 / 180.0) * M_PI
        let endAngle = (220.0 / 180.0) * M_PI
        
        path.addArc(withCenter: center, radius: radius, startAngle: CGFloat(startAngle), endAngle: CGFloat(endAngle), clockwise: true)
        
        eyeSecondLightLayer.borderColor = UIColor.black.cgColor
        eyeSecondLightLayer.lineWidth = 12.0
        eyeSecondLightLayer.path = path.cgPath
        eyeSecondLightLayer.fillColor = UIColor.clear.cgColor
        eyeSecondLightLayer.strokeColor = UIColor.white.cgColor
        self.view.layer.addSublayer(eyeSecondLightLayer)
        
    }
    
    
    func setupEyeballLayer(){
        let eyeballLayer = CAShapeLayer()
        let center = CGPoint(x: self.view.frame.width / 2, y: self.view.frame.height / 2)
        let path = UIBezierPath()
        let radius = self.view.frame.width * 0.3
        let startAngle = (0.0 / 180.0) * M_PI
        let endAngle = (360.0 / 180.0) * M_PI
        
        path.addArc(withCenter: center, radius: radius, startAngle: CGFloat(startAngle), endAngle: CGFloat(endAngle), clockwise: true)
        
        eyeballLayer.borderColor = UIColor.black.cgColor
        eyeballLayer.lineWidth = 1.0
        eyeballLayer.path = path.cgPath
        eyeballLayer.fillColor = UIColor.clear.cgColor
        eyeballLayer.strokeColor = UIColor.white.cgColor
        eyeballLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.view.layer.addSublayer(eyeballLayer)
        
    }
    
    
    func setupBottomEyesocketLayer(){
        let bottomEyesocketLayer:CAShapeLayer = CAShapeLayer()
        let center = CGPoint(x: self.view.frame.width / 2, y: self.view.frame.height / 2)
        
        let path = UIBezierPath()
        
        
        let startPoint = CGPoint(x: 0, y: self.view.frame.height / 2)
        path.move(to: startPoint)
        let endPoint = CGPoint(x: self.view.frame.width, y: self.view.frame.height / 2)
        let controlPoint = CGPoint(x: self.view.frame.width / 2, y: center.y + center.y + 20)
        
        path.addQuadCurve(to: endPoint, controlPoint: controlPoint)
        
        bottomEyesocketLayer.borderColor = UIColor.black.cgColor
        bottomEyesocketLayer.lineWidth = 1.0
        bottomEyesocketLayer.path = path.cgPath
        bottomEyesocketLayer.fillColor = UIColor.clear.cgColor
        bottomEyesocketLayer.strokeColor = UIColor.white.cgColor
        self.view.layer.addSublayer(bottomEyesocketLayer)
        
    }


}



//MARK:三个动画

extension ViewController{
    
    fileprivate func animation1(){
        let startPoint = CGPoint(x: 50, y: 300)
        
        let endPoint = CGPoint(x: 300, y: 300)
        
        let controlPoint1 = CGPoint(x: 180, y: 250)
        
        let controlPoint2 = CGPoint(x: 200, y: 400)
        
        let path = UIBezierPath()
        path.move(to: startPoint)//从开始点画
        path.addCurve(to: endPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
        
        let layer = CAShapeLayer()
        
        layer.path = path.cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = UIColor.white.cgColor
    
        //添加动画
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 2
        animation.duration = 5
        layer.add(animation, forKey: "")
        
        self.view.layer.addSublayer(layer)
        
        
    }
    
    fileprivate func animation2(){
        let startPoint = CGPoint(x: 50, y: 360)
        
        let endPoint = CGPoint(x: 300, y: 360)
        
        let controlPoint1 = CGPoint(x: 180, y: 300)
        
        let controlPoint2 = CGPoint(x: 200, y: 460)
        
        let path = UIBezierPath()
        path.move(to: startPoint)//从开始点画
        path.addCurve(to: endPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
        
        let layer = CAShapeLayer()
        
        layer.path = path.cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = UIColor.white.cgColor
        
        layer.strokeStart = 0.5
        layer.strokeEnd = 0.5
        
        let animation1 = CABasicAnimation(keyPath: "strokeStart")
        animation1.fromValue = 0.5
        animation1.toValue = 0
        animation1.duration = 5
        
        let animation2 = CABasicAnimation(keyPath: "strokeEnd")
        animation2.fromValue = 0.5
        animation2.toValue = 1
        animation2.duration = 5
        
        layer.add(animation1, forKey: "")
        layer.add(animation2, forKey: "")
        
        self.view.layer.addSublayer(layer)
        
    }
    
    fileprivate func animation3(){
        let startPoint = CGPoint(x: 50, y: 440)
        
        let endPoint = CGPoint(x: 300, y: 500)
        
        let controlPoint1 = CGPoint(x: 180, y: 380)
        
        let controlPoint2 = CGPoint(x: 200, y: 540)
        
        let path = UIBezierPath()
        path.move(to: startPoint)//从开始点画
        path.addCurve(to: endPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
        
        let layer = CAShapeLayer()
        
        layer.path = path.cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = UIColor.white.cgColor

        
        let animation = CABasicAnimation(keyPath: "lineWidth")
        animation.fromValue = 1
        animation.toValue = 10
        
        animation.duration = 5
        
        layer.add(animation, forKey: "")
        
        self.view.layer.addSublayer(layer)

    }
    
    
    fileprivate func aniomation4(){
        
        
        let finalSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
        let layerHeight = finalSize.height * 0.1
        
        let layer = CAShapeLayer()
        let bezier = UIBezierPath()
        
        bezier.move(to: CGPoint(x: 0, y: finalSize.height - layerHeight))
        bezier.addLine(to: CGPoint(x:0, y:finalSize.height - 1))
        bezier.addLine(to: CGPoint(x: finalSize.width, y: finalSize.height - 1))
        bezier.addLine(to: CGPoint(x: finalSize.width, y: finalSize.height - layerHeight))
        bezier.addQuadCurve(to: CGPoint(x: 0, y: finalSize.height - layerHeight), controlPoint: CGPoint(x: finalSize.width / 2, y: finalSize.height - layerHeight - 50))
        
        layer.fillColor = UIColor.orange.cgColor
        layer.path = bezier.cgPath
        
        self.view.layer.addSublayer(layer)
        
    }
    
    
    
}
