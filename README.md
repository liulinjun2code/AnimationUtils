
AnimationUtils 是基于CoreAnimation框架，结合链式编程思想整合的动画工具库。将基本动画（位移、透明度、缩放、旋转、贝塞尔路径）封装成一个个独立的方法，通过链式编程自由组合，方便实现复杂类型的动画。

主要文件

RKAnimations.swift

RKBaseAnimation.swift

简单使用
   
    self.testView.rk_addAnimations { (animation) in {
    
        let scaleRate = RKRate(fromRate: 1.0, toRate: 2.0)
        let rotation = RKAngle(fromAngle: .pi, toAngle: .pi*4)

        let _ = animation.scaleRate(rate: scaleRate, duration: 2.0).rotation(angle: rotation, duration: 2.0)
    }

位移动画

      let point = RKPoint(fromPoint: self.testView.layer.position, toPoint: CGPoint(x: 100, y: 400))
      let _ = animation.toPoint(point: point, duration: 4.0)
      
透明度

      let alpha = RKAlpha(fromAlpha: 1.0, toAlpha: 0.1)
      let _ = animation.alpha(alpha: alpha, duration: 2.0)
      
尺寸缩放

      let scaleSize = RKSize(fromSize: self.testView.frame.size, toSize: CGSize(width: 200, height: 50))
      let _ = animation.scaleSize(size: scaleSize, duration: 8.0)
      
等比例缩放

      let scaleRate = RKRate(fromRate: 1.0, toRate: 2.0)
      let _ = animation.scaleRate(rate: scaleRate, duration: 6.0)
      
旋转

      let rotation = RKAngle(fromAngle: .pi, toAngle: .pi*4)
      let _ = animation.rotation(angle: rotation, duration: 10.0)
      
贝塞尔曲线

      let path = UIBezierPath(ovalIn: CGRect(x: 50, y: 220, width: 200, height: 200))
      let _ = animation.bezierPath(bezierPath: path, duration: 2.0)
