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
    
//        let layer = CALayer();
//        let animation = CABasicAnimation();
//        animation.keyPath = "transform.scale";
//        animation.toValue = 0;
//
//        layer.add(animation, forKey: nil);
    
        self.redView.backgroundColor = UIColor.red
        self.redView.frame = CGRect(x: 100, y: 200, width: 100, height: 100)
        self.view.addSubview(self.redView);
        
        
        let result = NSObject.sl_calculate { (make) in
            let _ = make.add(value: 5).sub(value: 3).add(value: 4)
        }
        print(result)
    }
    
    
    @IBAction func animationAction(_ sender: UIButton) {
        
//        self.redView.rk_addAnimation { (animation) in
//
//            let _ = animation.move(toPoint: CGPoint(x: 100, y: 400), duration: 3.0).toLeft(x: 50, duration: 5.0)
//        }
        
//        self.redView.rk_position(toPoint: CGPoint(x: 100, y: 400), duration: 2.0)
//
//        self.redView.rk_alpha(alpha: 1.0, toAlpha: 0.1, duration: 4.0)
//
//        self.redView.rk_scaleSize(toSize: CGSize(width: 200, height: 50), duration: 6.0)
        
//        let path = UIBezierPath(ovalIn: CGRect(x: 50, y: 220, width: 200, height: 200))
//        self.redView.rk_bezierPath(bezierPath: path, duration: 8.0)
        
//        self.redView.rk_scaleRate(toRate: 3.0, duration: 10.0)
        
//        self.redView.rk_rotation(angle: .pi*4, duration: 12.0)
        
        let postion = self.redView.rk_position(toPoint: CGPoint(x: 100, y: 400), duration: 2.0)
        let alpha =  self.redView.rk_alpha(alpha: 1.0, toAlpha: 0.1, duration: 4.0)
        let scaleSize = self.redView.rk_scaleSize(toSize: CGSize(width: 200, height: 50), duration: 6.0)
        self.redView.rk_groupAnimations(animations: [postion, alpha, scaleSize], duration: 12.0)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

