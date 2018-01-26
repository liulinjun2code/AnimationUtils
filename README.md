
AnimationUtils 是基于CoreAnimation框架，结合链式编程思想整合的动画工具库。将基本动画（位移、透明度、缩放、旋转、贝塞尔路径）封装成一个个独立的方法，通过链式编程自由组合，方便实现复杂类型的动画。
# 主要文件

 * RKAnimations.swift
 * RKBaseAnimation.swift

# 简单使用
   
### 为视图添加动画

      self.testView.rk_addAnimations { (animation) in {

            let scaleRate = RKRate(fromRate: 1.0, toRate: 2.0)
            let rotation = RKAngle(fromAngle: .pi, toAngle: .pi*4)
            
            let _ = animation.scaleRate(rate: scaleRate, duration: 2.0).rotation(angle: rotation, duration: 2.0)
       }
    
### 设置动画是否同步执行

      let _ = animation.toSync().bezierPath(bezierPath: path, duration: 2.0)
      
   注意: .toSync()不设置默认动画按照顺序逐步执行，同时该方法需要在添加动画之前优先调用。
   
### 设置动画一直循环

      let _ = animation.bezierPath(bezierPath: path, duration: 2.0).toRepeat()
     
   注意: .toRepeat()设置以后动画会一直循环执行，同时该方法需要在添加完所有动画之后调用。

### 设置动画循环次数

      let _ = animation.bezierPath(bezierPath: path, duration: 2.0).repeatCount(count: 2)
      
   注意: .repeatCount(count: Float)设置以后动画会环执行相应的次数，同时该方法需要在添加完所有动画之后调用。
   
## 设置动画执行完成后是否返回到初始状态

      let _ = animation.bezierPath(bezierPath: path, duration: 2.0).toBack()
      
   注意: .toBack()不设置默认动画执行完成之后不会回到动画开始时的状态而保持动画执行完成后的状态，同时该方法需要在添加完所有动画之后调用。
    
# 基本动画

### 位移

      let point = RKPoint(fromPoint: self.testView.layer.position, toPoint: CGPoint(x: 100, y: 400))
      let _ = animation.toPoint(point: point, duration: 4.0)
      
### 透明度

      let alpha = RKAlpha(fromAlpha: 1.0, toAlpha: 0.1)
      let _ = animation.alpha(alpha: alpha, duration: 2.0)
      
### 尺寸缩放

      let scaleSize = RKSize(fromSize: self.testView.frame.size, toSize: CGSize(width: 200, height: 50))
      let _ = animation.scaleSize(size: scaleSize, duration: 8.0)
      
### 等比例缩放

      let scaleRate = RKRate(fromRate: 1.0, toRate: 2.0)
      let _ = animation.scaleRate(rate: scaleRate, duration: 6.0)
      
### 旋转

      let rotation = RKAngle(fromAngle: .pi, toAngle: .pi*4)
      let _ = animation.rotation(angle: rotation, duration: 10.0)
      
### 贝塞尔曲线

      let path = UIBezierPath(ovalIn: CGRect(x: 50, y: 220, width: 200, height: 200))
      let _ = animation.bezierPath(bezierPath: path, duration: 2.0)
