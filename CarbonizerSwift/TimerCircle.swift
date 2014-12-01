//
//  TimerCircle.swift
//  CarbonizerSwift
//
//  Created by Eric Martin on 11/23/14.
//  Copyright (c) 2014 Martin Developments. All rights reserved.
//

import UIKit
import QuartzCore

class TimerCircle: CALayer {
    
    dynamic var startAngle : CGFloat
    dynamic var endAngle : CGFloat
    var fillColor : UIColor
    var strokeColor : UIColor
    var strokeWidth : CGFloat
    
    
    override init() {
        self.startAngle = CGFloat()
        self.endAngle = CGFloat()
        self.fillColor = UIColor.grayColor()
        self.strokeColor = UIColor.blackColor()
        self.strokeWidth = 1.0
        super.init()
        self.setNeedsDisplay()
    }
    
    required init(coder aDecoder: NSCoder) {
        self.startAngle = CGFloat()
        self.endAngle = CGFloat()
        self.fillColor = UIColor.grayColor()
        self.strokeColor = UIColor.blackColor()
        self.strokeWidth = 1.0
        super.init(coder: aDecoder)
        self.setNeedsDisplay()
    }
    
    override init(layer: AnyObject!) {
        if layer.isKindOfClass(TimerCircle) {
            var other : TimerCircle = layer as TimerCircle
            self.startAngle = other.startAngle
            self.endAngle = other.endAngle
            self.fillColor = other.fillColor
            self.strokeColor = other.strokeColor
            self.strokeWidth = other.strokeWidth
        }
        else {
            self.startAngle = CGFloat()
            self.endAngle = CGFloat()
            self.fillColor = UIColor.grayColor()
            self.strokeColor = UIColor.blackColor()
            self.strokeWidth = 1.0
        }
        super.init(layer: layer)
        self.setNeedsDisplay()
    }
    
    func makeAnimationForKey(key : String) -> CABasicAnimation {
        var anim : CABasicAnimation = CABasicAnimation(keyPath: key)
        anim.fromValue = self.presentationLayer().valueForKey(key)
        anim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        anim.duration = 0.5
        return anim
    }
    
    override func actionForKey(event: String!) -> CAAction! {
        if event == "startAngle" || event == "endAngle" {
            return self.makeAnimationForKey(event)
        }
        
        return super.actionForKey(event)
    }
    
    override class func needsDisplayForKey(key : String) -> (Bool) {
        if key == "startAngle" || key == "endAngle" {
            return true;
        }
        
        return super.needsDisplayForKey(key)
    }
    
    override func drawInContext(ctx: CGContext!) {
        let center : CGPoint = CGPointMake(self.bounds.width/2, self.bounds.size.height/2)
        let radius : CGFloat = min(center.x, center.y)
        
        CGContextBeginPath(ctx)
        CGContextMoveToPoint(ctx, center.x, center.y)
        let cosStart = CGFloat(cosf(Float(self.startAngle)))
        let sinEnd = CGFloat(sinf(Float(self.endAngle)))
        let p1 = CGPointMake(center.x + radius * cosStart, center.y + radius * sinEnd)
        CGContextAddLineToPoint(ctx, p1.x, p1.y)
        
        let clockwise : Int32 = (self.startAngle > self.endAngle) ? 1 : 0
        CGContextAddArc(ctx, center.x, center.y, radius, self.startAngle, self.endAngle, clockwise)
        
        CGContextClosePath(ctx)
        
        CGContextSetFillColorWithColor(ctx, self.fillColor.CGColor)
        CGContextSetStrokeColorWithColor(ctx, self.strokeColor.CGColor)
        CGContextSetLineWidth(ctx, self.strokeWidth)
        
        CGContextSetLineWidth(ctx, self.strokeWidth)
    }
}
