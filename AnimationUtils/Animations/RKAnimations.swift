//
//  RKAnimations.swift
//  AnimationUtils
//
//  Created by wanglc on 2018/1/26.
//  Copyright © 2018年 Snail. All rights reserved.
//

import UIKit

extension UIView {
    
    func rk_addAnimations(closure: (_ animation: RKBaseAnimation) -> Void) -> Void {
        
        let animation = RKBaseAnimation()
        closure(animation);
        
        let group = CAAnimationGroup()
        group.animations = animation.groups
        group.duration = animation.time
        group.repeatCount = animation.isRepeat ? animation.repeatCount:0
        if !animation.isBack {
            //设置动画执行完成后显示图层最后的状态，不设置图层将会显示动画开始的状态
            group.isRemovedOnCompletion = false
            group.fillMode = kCAFillModeForwards
        }
        
        self.layer.add(group, forKey: "group")
    }
}
