//
//  RKKeyframeAnimation.swift
//  AnimationUtils
//
//  Created by wanglc on 2018/1/29.
//  Copyright © 2018年 Snail. All rights reserved.
//

import UIKit

class RKKeyframeAnimation: CAKeyframeAnimation {
    
    /// 设置动画是否一直循环
    ///
    /// - Returns: Self
    func toRepeat() -> RKKeyframeAnimation {
        self.repeatCount = MAXFLOAT
        
        return self
    }
    
    /// 设置动画执行次数
    ///
    /// - Parameter count: 执行次数
    /// - Returns: Self
    func repeatCount(count: Float) -> RKKeyframeAnimation {
        self.repeatCount = count
        
        return self
    }
    
    /// 设置动画执行完是否回到动画开始的位置
    ///
    /// - Returns: Self
    func toBack() -> RKKeyframeAnimation {
        
        self.isRemovedOnCompletion = true
        self.fillMode = kCAFillModeRemoved
        
        return self
    }
    
    /// 设置某一关键帧动画运动节奏
    ///
    /// - Parameter type: 速度控制函数
    ///   - kCAMediaTimingFunctionDefault 默认
    ///   - kCAMediaTimingFunctionLinear 线性，匀速运动
    ///   - kCAMediaTimingFunctionEaseIn 渐入，动画缓慢进入，加速离开
    ///   - kCAMediaTimingFunctionEaseOut 渐出，动画加速进入，减速离开
    ///   - kCAMediaTimingFunctionEaseInEaseOut 渐入渐出，动画缓慢进入，中间加速，最后减速离开
    ///
    /// - Returns: Self
    func timingType(type: String) -> RKKeyframeAnimation {
        
        self.timingFunction = CAMediaTimingFunction(name: type)
        
        return self
    }
    
    /// 设置所有关键帧动画运动节奏
    ///
    /// - Parameter types: 速度控制函数
    /// - Returns: Self
    func timingTypes(types: Array<CAMediaTimingFunction>) -> RKKeyframeAnimation {
        self.timingFunctions = types
        
        return self
    }
    
    /// 设置动画类型
    ///
    /// - Parameter keyPath: 动画类型 - 默认“position”
    /// - Returns: Self
    func keyPath(keyPath: String) -> RKKeyframeAnimation {
        self.keyPath = keyPath
        
        return self
    }
    
    /// 通过Values属性设置帧动画
    ///
    /// - Parameters:
    ///   - values: 关键帧数组，依次显示values数组中的每一个关键帧
    ///   - keyTimes: 每一个值对应一帧动画，表示每一帧的动画时长占据总动画时长的比例，取值为0~1.0。该值不设置那么各关键帧平分总的动画时长
    ///   - keyPath:
    ///   - duration: 动画总时长
    /// - Returns: Self
    func keyframe(values: Array<Any>, keyTimes: Array<Float>, duration: TimeInterval) -> RKKeyframeAnimation {
        
        self.keyPath = "position"
        self.values = values
        self.duration = duration
        self.isRemovedOnCompletion = false
        self.fillMode = kCAFillModeForwards
        
        if (keyTimes.count > 0) {
            self.keyTimes = keyTimes as [NSNumber]
        }
        
        return self;
    }
    
    /// 通过Path属性设置帧动画
    ///
    /// - Parameters:
    ///   - path: CGPathRef/CGMutablePathRef, 路径
    ///   - duration: 动画总时长
    /// - Returns: Self
    func keyframe(path: CGPath, duration: TimeInterval) -> RKKeyframeAnimation {
        
        self.keyPath = "position"
        self.path = path
        self.duration = duration
        self.isRemovedOnCompletion = false
        self.fillMode = kCAFillModeForwards
        
        return self;
    }
}
