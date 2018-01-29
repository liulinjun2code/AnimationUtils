//
//  RKShaper.swift
//  AnimationUtils
//
//  Created by wanglc on 2018/1/26.
//  Copyright © 2018年 Snail. All rights reserved.
//

import UIKit

class RKShaper: NSObject {
    
    //MARK: - ❤️

    /// 绘制心形
    ///
    /// - Parameters:
    ///   - view: 视图层
    ///   - color: 颜色
    class func addHeartShape(view: UIView, color: UIColor) -> Void {
        
        let shapelayer = CAShapeLayer()
        shapelayer.fillColor = color.cgColor
        shapelayer.lineWidth = 1.0
        shapelayer.path = RKShaper.bezierHeartShapePath(width: 160.0, center: CGPoint(x: 160, y: 200)).cgPath
        shapelayer.strokeColor = color.cgColor
        
        view.layer.addSublayer(shapelayer)
    }
    
    /// 创建心形贝塞尔曲线
    ///
    /// - Parameters:
    ///   - width: 心形宽度
    ///   - center: 心形中心
    /// - Returns: 贝塞尔曲线
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
    
    //MARK: - 抖动效果
    
    /// 添加抖动效果
    ///
    /// - Parameters:
    ///   - view: 视图层
    ///   - angle: 角度
    class func addShake(view: UIView, angle: Float) -> Void {
        
        view.rk_addKeyframeAnimation { (animation) in
            
            let array: Array = [RKShaper.angle2Radian(angle: -angle), RKShaper.angle2Radian(angle: angle), RKShaper.angle2Radian(angle: -angle)]
            let _ = animation.keyframe(values: array, keyTimes: Array(), duration: 0.5).keyPath(keyPath: "transform.rotation").toRepeat()
        }
    }
    
    /// 停止抖动
    ///
    /// - Parameter view: 视图层
    class func stopShake(view: UIView) -> Void {
        
        view.layer.removeAllAnimations()
    }
    
    /// 角度转换
    ///
    /// - Parameter angle: 角度值
    /// - Returns: Float
    class private func angle2Radian(angle: Float) -> Float {
        
        return .pi*angle/180.0
    }
}
