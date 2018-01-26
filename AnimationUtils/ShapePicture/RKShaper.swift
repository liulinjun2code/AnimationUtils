//
//  RKShaper.swift
//  AnimationUtils
//
//  Created by wanglc on 2018/1/26.
//  Copyright © 2018年 Snail. All rights reserved.
//

import UIKit

class RKShaper: NSObject {

    class func addHeartShape(view: UIView, color: UIColor) -> Void {
        
        let shapelayer = CAShapeLayer()
        shapelayer.fillColor = color.cgColor
        shapelayer.lineWidth = 1.0
        shapelayer.path = RKShaper.bezierHeartShapePath(width: 160.0, center: CGPoint(x: 160, y: 200)).cgPath
        shapelayer.strokeColor = color.cgColor
        
        view.layer.addSublayer(shapelayer)
    }
    
    class func bezierHeartShapePath(width: CGFloat, center:CGPoint) -> UIBezierPath {
        
        let w: CGFloat = width/2.0
        
        let path = UIBezierPath()
        path.addArc(withCenter: CGPoint(x: (center.x - w/2.0), y: (center.y - sqrt(3.0) * w/6.0)), radius: w/sqrt(3.0), startAngle: .pi*150/180.0, endAngle: .pi*(-30)/180, clockwise: true)
        path.addArc(withCenter: CGPoint(x: (center.x + w/2.0), y: (center.y - sqrt(3.0) * w/6.0)), radius: w/sqrt(3.0), startAngle: .pi*(-150)/180.0, endAngle: .pi*30/180.0, clockwise: true)
        
        path.move(to: CGPoint(x: (center.x - w), y: center.y))
        path.addLine(to: CGPoint(x: center.x, y: (center.y + w*0.6*sqrt(3.0))))
        path.addLine(to:  CGPoint(x: (center.x + w), y: center.y))
        
        return path
    }
}
