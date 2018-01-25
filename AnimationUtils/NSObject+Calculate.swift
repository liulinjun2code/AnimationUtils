//
//  NSObject+Calculate.swift
//  AnimationUtils
//
//  Created by wanglc on 2018/1/25.
//  Copyright © 2018年 Snail. All rights reserved.
//

import Foundation

extension NSObject {
 
    class func sl_calculate(closure: (_ make: Calculater) -> Void) -> Float {
        
        let maker = Calculater()
        closure(maker)
        
        return maker.result
    }
}
