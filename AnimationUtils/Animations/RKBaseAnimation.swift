//
//  RKBaseAnimation.swift
//  AnimationUtils
//
//  Created by wanglc on 2018/1/25.
//  Copyright © 2018年 Snail. All rights reserved.
//

import UIKit

struct RKPoint {
    var fromPoint: CGPoint = .zero
    var toPoint: CGPoint = .zero
}

struct RKAlpha {
    var fromAlpha: Float = 1.0
    var toAlpha: Float = 0.0
}

struct RKSize {
    var fromSize: CGSize = .zero
    var toSize: CGSize = .zero
}

struct RKRate {
    var fromRate: Float = 1.0
    var toRate: Float = 0.0
}

struct RKAngle {
    var fromAngle: Float = .pi
    var toAngle: Float = .pi*4
}

struct RKColor {
    var fromColor:UIColor = UIColor.white
    var toColor:UIColor = UIColor.white
}

class RKBaseAnimation: NSObject {
    
    var groups = Array<CAAnimation>()
    var time: CFTimeInterval = 0.0
    
    var isSync: Bool = false        //是否同步执行动画
    var isRepeat: Bool = false      //是否重复执行动画
    var repeatCount: Float = 0.0    //设置动画循环次数
    var isBack: Bool = false        //设置动画执行完是否回到动画开始的位置
    
    /// 设置动画是否同步执行
    ///
    /// - Returns: Self
    func toSync() -> RKBaseAnimation {
        self.isSync = true
        
        return self
    }
    
    /// 设置动画是否一直循环
    ///
    /// - Returns: Self
    func toRepeat() -> RKBaseAnimation {
        self.isRepeat = true
        self.repeatCount = MAXFLOAT
        
        return self
    }
    
    /// 设置动画执行次数
    ///
    /// - Parameter count: 执行次数
    /// - Returns: Self
    func repeatCount(count: Float) -> RKBaseAnimation {
        self.isRepeat = true
        self.repeatCount = count
        
        return self
    }
    
    /// 设置动画执行完是否回到动画开始的位置
    ///
    /// - Returns: Self
    func toBack() -> RKBaseAnimation {
        self.isBack = true
        
        return self
    }
    
    //MARK: - Base Animations
    
    /// 线性移动
    ///
    /// - Parameters:
    ///   - point: 目标顶点点
    ///   - duration: 动画时长
    /// - Returns: Self
    func toPoint(point: RKPoint, duration: TimeInterval) -> RKBaseAnimation {

        let animation = CABasicAnimation()
        animation.keyPath = "position"
        animation.fromValue = NSValue.init(cgPoint: point.fromPoint)
        animation.toValue = NSValue.init(cgPoint: point.toPoint)
        animation.duration = duration
        //设置动画结束之后是否按照原路返回执行
        animation.autoreverses = false
        //设置动画执行完成后显示图层最后的状态，不设置图层将会显示动画开始的状态
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        
        if !isSync {
            animation.beginTime = self.time
        }
        
        groups.append(animation)
        time += duration
        
        return self
    }
    
    /// 淡入淡出
    ///
    /// - Parameters:
    ///   - alpha: 透明度
    ///   - duration: 动画时长
    /// - Returns: Self
    func alpha(alpha: RKAlpha, duration: TimeInterval) -> RKBaseAnimation {
        
        let animation = CABasicAnimation()
        animation.keyPath = "opacity"
        animation.fromValue = alpha.fromAlpha
        animation.toValue = alpha.toAlpha
        animation.duration = duration
        animation.autoreverses = false
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        
        if !isSync {
            animation.beginTime = self.time
        }
        
        groups.append(animation)
        time += duration
        
        return self
    }
    
    /// 颜色变化
    ///
    /// - Parameters:
    ///   - color: 颜色
    ///   - duration: 动画时长
    /// - Returns: Self
    func color(color: RKColor, duration: TimeInterval) -> RKBaseAnimation {
        
        let animation = CABasicAnimation()
        animation.keyPath = "backgroundColor"
        animation.fromValue = color.fromColor.cgColor
        animation.toValue = color.toColor.cgColor
        animation.duration = duration
        animation.autoreverses = false
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        
        if !isSync {
            animation.beginTime = self.time
        }
        
        groups.append(animation)
        time += duration
        
        return self
    }
    
    /// 形状缩放（尺寸）
    ///
    /// - Parameters:
    ///   - size: 缩放视图尺寸
    ///   - duration: 动画时长
    /// - Returns: Self
    func scaleSize(size: RKSize, duration: TimeInterval) -> RKBaseAnimation {
        
        let animation = CABasicAnimation()
        animation.keyPath = "bounds.size"
        animation.fromValue = NSValue.init(cgSize: size.fromSize)
        animation.toValue = NSValue.init(cgSize: size.toSize)
        animation.duration = duration
        animation.autoreverses = false
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        
        if !isSync {
            animation.beginTime = self.time
        }
        
        groups.append(animation)
        time += duration
        
        return self
    }
    
    /// 比例缩放
    ///
    /// - Parameters:
    ///   - rate: 缩放比例
    ///   - duration: 动画时长
    /// - Returns: Self
    func scaleRate(rate: RKRate, duration: TimeInterval) -> RKBaseAnimation {
        
        let animation = CABasicAnimation()
        animation.keyPath = "transform.scale"
        animation.fromValue = rate.fromRate
        animation.toValue = rate.toRate
        animation.duration = duration
        animation.autoreverses = false
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards

        if !isSync {
            animation.beginTime = self.time
        }
        
        groups.append(animation)
        time += duration
        
        return self
    }
    
    /// 旋转
    ///
    /// - Parameters:
    ///   - angle: 旋转角度
    ///   - duration: 动画时长
    /// - Returns: Self
    func rotation(angle: RKAngle, duration: TimeInterval) -> RKBaseAnimation {
        
        let animation = CABasicAnimation()
        animation.keyPath = "transform.rotation"
        animation.fromValue = angle.fromAngle
        animation.toValue = angle.toAngle
        animation.duration = duration
        animation.autoreverses = false
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        
        if !isSync {
            animation.beginTime = self.time
        }
        
        groups.append(animation)
        time += duration
        
        return self
    }
    
    /// 贝塞尔曲线
    ///
    /// - Parameters:
    ///   - bezierPath: 贝塞尔路径
    ///   - duration: 动画时长
    /// - Returns: Self
    func bezierPath(bezierPath: UIBezierPath, duration: TimeInterval) -> RKBaseAnimation {
        
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position"
        animation.path = bezierPath.cgPath
        animation.duration = duration
        animation.autoreverses = false
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        
        if !isSync {
            animation.beginTime = self.time
        }
        
        groups.append(animation)
        time += duration
        
        return self
    }
}
