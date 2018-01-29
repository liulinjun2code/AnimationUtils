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
        self.redView.frame = CGRect(x: 0, y: 200, width: 100, height: 100)
        self.view.addSubview(self.redView);
        
        //绘制心形图形
//        RKShaper.addHeartShape(view: self.view, color: UIColor.red)
        
        //抖动效果
//        RKShaper.addShake(view: self.redView, angle: 5)
    }
    
    
    @IBAction func animationAction(_ sender: UIButton) {
        
        
        /* 关键帧动画1 - Values
        let width = self.view.frame.size.width
        let vales = [NSValue.init(cgPoint: self.redView.layer.frame.origin),
                     NSValue.init(cgPoint: CGPoint(x: width - self.redView.frame.size.width/2, y: self.redView.frame.origin.y)),
                     NSValue.init(cgPoint: CGPoint(x: width - self.redView.frame.size.width/2, y: self.redView.frame.origin.y + 100)),
                     NSValue.init(cgPoint: CGPoint(x: self.redView.frame.size.width/2, y: self.redView.frame.origin.y + 100)),
                     NSValue.init(cgPoint: self.redView.layer.frame.origin)]
        let times = [Float(0.0), Float(0.6), Float(0.7), Float(0.8), Float(1.0)];
        let timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut),
                               CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear),
                               CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear),
                               CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)]
        
        self.redView.rk_addKeyframeAnimation { (animation) in
            let _ = animation.keyframe(values: vales, keyTimes: times, duration: 4.0).timingTypes(types: timingFunctions).toRepeat()
        }
        */
        
        /* 关键帧动画1 - Path
        self.redView.rk_addKeyframeAnimation { (animation) in
            
            let path = CGMutablePath()
            path.addEllipse(in: CGRect(x: 150, y: 100, width: 100, height: 100))
            
            let _ = animation.keyframe(path: path, duration: 2.0).keyPath(keyPath: "position").toRepeat()
        }
        */
        
        // 基本动画 - 组合动画
        self.redView.rk_addAnimations { (animation) in

            let point = RKPoint(fromPoint: self.redView.layer.position, toPoint: CGPoint(x: 100, y: 400))
            let alpha = RKAlpha(fromAlpha: 1.0, toAlpha: 0.1)
            let scaleSize = RKSize(fromSize: self.redView.frame.size, toSize: CGSize(width: 200, height: 50))
            let scaleRate = RKRate(fromRate: 1.0, toRate: 2.0)
            let rotation = RKAngle(fromAngle: .pi, toAngle: .pi*4)
            let color = RKColor(fromColor: UIColor.red, toColor: UIColor.green)

            //let path = UIBezierPath(ovalIn: CGRect(x: 50, y: 220, width: 200, height: 200))
            //let _ = animation.scaleRate(rate: scaleRate, duration: 2.0).rotation(angle: rotation, duration: 2.0).bezierPath(bezierPath: path, duration: 2.0).repeatCount(count: 1.0).toBack()

            let _ = animation.alpha(alpha: alpha, duration: 2.0).toPoint(point: point, duration: 4.0).scaleRate(rate: scaleRate, duration: 6.0).scaleSize(size: scaleSize, duration: 8.0).rotation(angle: rotation, duration: 10.0)
        }
         //*/
    }
    
    @IBAction func pauseAnimation(_ sender: UIButton) {
        
        self.redView.rk_pauseAnimationa()
    }
    
    @IBAction func resumeAnimation(_ sender: UIButton) {
        
        self.redView.rk_resumeAnimation()
    }
    
    @IBAction func stopAnimation(_ sender: UIButton) {
        
        self.redView.rk_stopAnimation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

