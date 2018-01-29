//
//  RKAnimations.swift
//  AnimationUtils
//
//  Created by wanglc on 2018/1/26.
//  Copyright © 2018年 Snail. All rights reserved.
//

import UIKit

extension UIView {
    
    /// 添加基本动画
    ///
    /// - Parameter closure: 基础动画
    func rk_addAnimations(closure: (_ animation: RKBaseAnimation) -> Void) -> Void {
        
        let animation = RKBaseAnimation()
        closure(animation);
        
        let group = CAAnimationGroup()
        group.animations = animation.groups
        group.duration = animation.time
        //动画执行速度 `linear', `easeIn', `easeOut' and `easeInEaseOut' and `default'
        group.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
        group.repeatCount = animation.isRepeat ? animation.repeatCount:0
        if !animation.isBack {
            //设置动画执行完成后显示图层最后的状态，不设置图层将会显示动画开始的状态
            group.isRemovedOnCompletion = false
            group.fillMode = kCAFillModeForwards
        }
        
        self.layer.add(group, forKey: "group")
    }
    
    /// 添加关键帧动画
    ///
    /// - Parameter animation: 关键帧动画
    func rk_addKeyframeAnimation(closure: (_ animation: RKKeyframeAnimation) -> Void) -> Void {
        
        let animation = RKKeyframeAnimation()
        closure(animation);
        
        self.layer.add(animation, forKey: nil)
    }
    
    /// 暂停动画执行
    func rk_pauseAnimationa() -> Void {
        
        let pausedTime = self.layer.convertTime(CACurrentMediaTime(), from: nil)
        
        //让CALayer的时间停止走动
        layer.speed = 0.0
        layer.timeOffset = pausedTime
    }
    
    /// 恢复动画执行
    func rk_resumeAnimation() -> Void {
        
        let pausedTime = self.layer.timeOffset
        
        //让CALayer的时间继续走动
        self.layer.speed = 1.0
        //取消上次记录的停留时间
        self.layer.timeOffset = 0.0
        
        self.layer.beginTime = 0.0
        //计算暂停的时间
        let timeSincePause = (self.layer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime)
        self.layer.beginTime = timeSincePause
    }
    
    /// 停止动画执行
    func rk_stopAnimation() -> Void {
        
        self.layer.removeAllAnimations()
    }
}
