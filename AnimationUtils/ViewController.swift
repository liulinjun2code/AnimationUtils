//
//  ViewController.swift
//  AnimationUtils
//
//  Created by wanglc on 2018/1/25.
//  Copyright © 2018年 Snail. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let redView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        self.redView.backgroundColor = UIColor.red
        self.redView.frame = CGRect(x: 100, y: 200, width: 100, height: 100)
        self.view.addSubview(self.redView);
        
        //绘制心形图形
//        RKShaper.addHeartShape(view: self.view, color: UIColor.red)
    }
    
    
    @IBAction func animationAction(_ sender: UIButton) {
        
        self.redView.rk_addAnimations { (animation) in
            
            let point = RKPoint(fromPoint: self.redView.layer.position, toPoint: CGPoint(x: 100, y: 400))
            let alpha = RKAlpha(fromAlpha: 1.0, toAlpha: 0.1)
            let scaleSize = RKSize(fromSize: self.redView.frame.size, toSize: CGSize(width: 200, height: 50))
            let scaleRate = RKRate(fromRate: 1.0, toRate: 2.0)
            let rotation = RKAngle(fromAngle: .pi, toAngle: .pi*4)
            
            let path = UIBezierPath(ovalIn: CGRect(x: 50, y: 220, width: 200, height: 200))
            let _ = animation.scaleRate(rate: scaleRate, duration: 2.0).rotation(angle: rotation, duration: 2.0).bezierPath(bezierPath: path, duration: 2.0).repeatCount(count: 1.0).toBack()
            
//            let _ = animation.alpha(alpha: alpha, duration: 2.0).toPoint(point: point, duration: 4.0).scaleRate(rate: scaleRate, duration: 6.0).scaleSize(size: scaleSize, duration: 8.0).rotation(angle: rotation, duration: 10.0)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

