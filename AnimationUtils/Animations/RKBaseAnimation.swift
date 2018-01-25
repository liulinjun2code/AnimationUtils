//
//  RKBaseAnimation.swift
//  AnimationUtils
//
//  Created by wanglc on 2018/1/25.
//  Copyright © 2018年 Snail. All rights reserved.
//

import UIKit

class RKBaseAnimation: CABasicAnimation {
    
    func move(toPoint: CGPoint, duration: TimeInterval) -> RKBaseAnimation {

        self.toValue = NSValue.init(cgPoint: toPoint)
        self.duration = duration
        
        return self
    }
    
    func toLeft(x: CGFloat, duration: TimeInterval) -> RKBaseAnimation {
        
        self.toValue = NSValue.init(cgPoint: CGPoint(x: x, y: 400))
        self.duration = duration
        
        return self
    }
}
