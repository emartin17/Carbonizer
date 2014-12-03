//
//  TimerView.swift
//  CarbonizerSwift
//
//  Created by Eric Martin on 12/1/14.
//  Copyright (c) 2014 Martin Developments. All rights reserved.
//

import UIKit

class TimerView: UIView {
    
    var greyCircle : CAShapeLayer
    var redCircle : CAShapeLayer
    var timerLabel : UILabel
    var timeLeft : Int
    var labelTimer : NSTimer
    
    required init(coder aDecoder: NSCoder) {
        greyCircle = CAShapeLayer(coder: aDecoder)
        redCircle = CAShapeLayer(coder: aDecoder)
        timerLabel = UILabel(coder: aDecoder)
        timeLeft = 60
        labelTimer = NSTimer()
        super.init(coder: aDecoder)
        
        self.timerLabel.font = UIFont(name: "OpenSans", size: 18)
        let minutes = timeLeft/60
        let seconds = timeLeft%60
        let secondString = String(format: "%02d", seconds)
        self.timerLabel.text = "\(minutes):\(secondString)"
        self.timerLabel.textAlignment = NSTextAlignment.Center
        self.timerLabel.sizeToFit()
        self.timerLabel.textColor = UIColor.whiteColor()
        self.addSubview(timerLabel)
        self.addConstraint(NSLayoutConstraint(item: timerLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: timerLabel, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: timerLabel, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: timerLabel, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 0.0))
        
        self.greyCircle.frame = CGRectMake(0, 0, self.frame.width, self.frame.height)
        let greyCirclePath = UIBezierPath(ovalInRect: CGRectMake(0, 0, 61, 61))
        self.greyCircle.path = greyCirclePath.CGPath
        self.greyCircle.strokeColor = UIColor(red: 36/255, green: 37/255, blue: 38/255, alpha: 1.0).CGColor
        self.greyCircle.lineWidth = 4.0
        self.greyCircle.fillColor = UIColor.clearColor().CGColor
        self.layer.addSublayer(self.greyCircle)
        
        self.redCircle.frame = CGRectMake(0, 0, self.frame.width, self.frame.height)
        var redCirclePath = UIBezierPath(ovalInRect: CGRectMake(0, 0, 61, 61)).bezierPathByReversingPath()
        let bounds = CGPathGetPathBoundingBox(redCirclePath.CGPath)
        let center = CGPointMake(CGRectGetMidX(bounds), CGRectGetMidY(bounds))
        var transform = CGAffineTransformIdentity
        transform = CGAffineTransformTranslate(transform, center.x, center.y);
        transform = CGAffineTransformRotate(transform, CGFloat(M_PI*1.5));
        transform = CGAffineTransformTranslate(transform, -center.x, -center.y);
        redCirclePath.applyTransform(transform)
        self.redCircle.path = redCirclePath.CGPath
        self.redCircle.strokeStart = 0.0
        self.redCircle.strokeEnd = 0.0
        self.redCircle.strokeColor = UIColor(red: 214/255, green: 61/255, blue: 34/255, alpha: 1.0).CGColor
        self.redCircle.lineWidth = 4.0
        self.redCircle.fillColor = UIColor.clearColor().CGColor
        self.layer.addSublayer(self.redCircle)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        startTimer(true, duration: 60.0, target: self, selector: Selector("timerDone"))
    }
    
    func startTimer(animated : Bool, duration : NSTimeInterval, target : AnyObject, selector : Selector) {
        let timer = NSTimer(timeInterval: duration, target: target, selector: selector, userInfo: nil, repeats: false)
        self.timeLeft = Int(duration)
        labelTimer = NSTimer(timeInterval: 1.0, target: self, selector: Selector("countDown"), userInfo: nil, repeats: true)
        NSRunLoop.mainRunLoop().addTimer(timer, forMode: NSDefaultRunLoopMode)
        NSRunLoop.mainRunLoop().addTimer(labelTimer, forMode: NSDefaultRunLoopMode)
        setProgress(1.0, animated: animated, duration: duration)
    }
    
    func setProgress(progress : Float, animated : Bool, duration : NSTimeInterval) {
        if animated {
            CATransaction.setDisableActions(true)
            self.redCircle.strokeEnd = CGFloat(progress)
            CATransaction.setDisableActions(false)
            var stroke = CABasicAnimation(keyPath: "strokeEnd")
            stroke.fromValue = 0.0
            stroke.duration = duration
            redCircle.addAnimation(stroke, forKey: nil)
        }
        else {
            CATransaction.begin()
            CATransaction.setDisableActions(true)
            self.redCircle.strokeEnd = CGFloat(progress)
            CATransaction.commit()
        }
    }
    
    func countDown() {
        timeLeft-=1
        println(timeLeft)
        let minutes = timeLeft/60
        let seconds = timeLeft%60
        let secondString = String(format: "%02d", seconds)
        self.timerLabel.text = "\(minutes):\(secondString)"
        if timeLeft <= 0 {
            labelTimer.invalidate()
        }
    }
    
    func timerDone() {
        println("TIMER IS DONE")
    }
}
