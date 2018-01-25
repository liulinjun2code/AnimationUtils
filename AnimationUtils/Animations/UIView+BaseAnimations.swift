//
//  UIView+BaseAnimations.swift
//  AnimationUtils
//
//  Created by wanglc on 2018/1/25.
//  Copyright © 2018年 Snail. All rights reserved.
//

import UIKit

extension UIView {
    
    func rk_addAnimation(closure: (_ animation: RKBaseAnimation) -> Void) -> Void {
        
        let animation = RKBaseAnimation()
        animation.fromValue = self.layer.position
        closure(animation);
        
        self.layer.add(animation, forKey: "position")
    }
    
    
    func rk_position(toPoint: CGPoint, duration: TimeInterval) -> CABasicAnimation {
        
        let animation = CABasicAnimation()
        animation.fromValue = self.layer.position
        animation.toValue = NSValue.init(cgPoint: toPoint)
        animation.duration = duration
        //设置动画结束之后是否按照原路返回执行
        animation.autoreverses = false
        //设置动画执行完成后显示图层最后的状态，不设置图层将会显示动画开始的状态
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        
//        self.layer.add(animation, forKey: "position")
        
        return animation
    }
    
    func rk_alpha(alpha: CGFloat, toAlpha: CGFloat, duration: TimeInterval) -> CABasicAnimation {
        
        let animation = CABasicAnimation()
        animation.fromValue = alpha
        animation.toValue = toAlpha
        animation.duration = duration
        animation.autoreverses = false
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        
//        self.layer.add(animation, forKey: "opacity")
        
        return animation
    }
    
    func rk_scaleSize(toSize: CGSize, duration: TimeInterval) -> CABasicAnimation {
    
        let animation = CABasicAnimation()
        animation.fromValue = NSValue.init(cgSize: self.frame.size)
        animation.toValue = NSValue.init(cgSize: toSize)
        animation.duration = duration
        animation.autoreverses = false
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        
//        self.layer.add(animation, forKey: "bounds.size")
        
        return animation
    }
    
    func rk_scaleRate(toRate: CGFloat, duration: TimeInterval) -> CABasicAnimation {
        
        let animation = CABasicAnimation()
        animation.fromValue = 1.0
        animation.toValue = toRate
        animation.duration = duration
        animation.autoreverses = false
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        
//        self.layer.add(animation, forKey: "transform.scale")
        
        return animation
    }
    
    func rk_rotation(angle: CGFloat, duration: TimeInterval) -> CABasicAnimation {
        
        let animation = CABasicAnimation()
        animation.fromValue = .pi*1.0
        animation.toValue = angle
        animation.duration = duration
        animation.autoreverses = false
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        
//        self.layer.add(animation, forKey: "transform.rotation")
        
        return animation
    }
    
    func rk_bezierPath(bezierPath: UIBezierPath, duration: TimeInterval) -> CAKeyframeAnimation {
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = bezierPath.cgPath
        animation.duration = duration
        animation.autoreverses = false
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        
//        self.layer.add(animation, forKey: "path")
        
        return animation
    }
    
    func rk_groupAnimations(animations: Array<CAAnimation>, duration: TimeInterval) -> CAAnimationGroup {
        
        let group = CAAnimationGroup()
        group.animations = animations
        group.duration = duration
        
        self.layer.add(group, forKey: "group")
        
        return group
    }
    
}
