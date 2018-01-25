//
//  Calculater.swift
//  AnimationUtils
//
//  Created by wanglc on 2018/1/25.
//  Copyright © 2018年 Snail. All rights reserved.
//

import UIKit

class Calculater: NSObject {

    var result: Float = 0.0
    
    func add(value: Float) -> Calculater {
        
        result += value
        return self
    }
    
    func sub(value: Float) -> Calculater {
        
        result -= value
        return self
    }
    
}
