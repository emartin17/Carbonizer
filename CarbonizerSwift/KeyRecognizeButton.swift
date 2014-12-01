//
//  KeyRecognizeButton.swift
//  CarbonizerSwift
//
//  Created by Eric Martin on 11/10/14.
//  Copyright (c) 2014 Martin Developments. All rights reserved.
//

import UIKit

class KeyRecognizeButton: UIButton {
    var sharpImage : UIImageView
    var flatImage : UIImageView
    var circleLayer : CAShapeLayer
    var sharpActive : Bool
    var activeState : Bool
    let mySuperView : UIView?
    
    required init(coder aDecoder: NSCoder) {
        self.activeState = false
        self.sharpActive = true
        self.sharpImage = UIImageView()
        self.flatImage = UIImageView()
        circleLayer = CAShapeLayer()
        super.init(coder: aDecoder)
        //Add touch recognizer
        self.addTarget(self, action: "buttonTapped", forControlEvents: UIControlEvents.TouchUpInside)
        
        //Set up button asthetics
        self.backgroundColor = UIColor.clearColor()
        
        //Set up circle shape layer
        self.circleLayer.frame = CGRectMake(0, 0, 57, 57)
        let circlePath = UIBezierPath(ovalInRect: CGRectMake(0, 0, 57, 57))
        self.circleLayer.path = circlePath.CGPath
        self.circleLayer.fillColor = UIColor(red: 64/255, green: 179/255, blue: 66/255, alpha: 1.0).CGColor
        self.circleLayer.hidden = true
        self.layer.insertSublayer(self.circleLayer, atIndex: 0)
        
        //Set up sharpImage ImageView
        self.sharpImage.frame = CGRectMake(self.frame.width*0.6152, 16.5, 8.5, 23.5)
        self.sharpImage.image = UIImage(named: "sharp.png")
        self.sharpImage.hidden = true;
        self.addSubview(sharpImage)
        
        //Set up flatImage ImageView
        self.flatImage.frame = CGRectMake(self.frame.width*0.7172, 16.5, 8.5, 23.5)
        self.flatImage.image = UIImage(named: "flat.png")
        self.flatImage.hidden = true;
        self.addSubview(flatImage)
        if self.titleForState(UIControlState.Normal) != "0" {
            self.flatImage.alpha = 0.4;
        }
    }
    
    func setState(toActive : Bool) {
        if toActive {
            self.activeState = true
            //Prepare for transformation by scaling images down
            let sharpFrame = CGRectMake(self.frame.width, -23.5, 8.5, 23.5)
            let flatFrame = CGRectMake(self.frame.width+15, -23.5, 8.5, 23.5)
            let circleFrame = CGRectMake(0, 0, 57, 57)
            self.sharpImage.transform = CGAffineTransformMakeScale(0.1, 0.1)
            self.flatImage.transform = CGAffineTransformMakeScale(0.1, 0.1)
            self.circleLayer.transform = CATransform3DMakeScale(0.1, 0.1, 0.1)
            //Scale them back up in an ease-out block
            UIView.transitionWithView(self, duration: 0.10, options:UIViewAnimationOptions.CurveEaseOut, animations: {
                self.sharpImage.hidden = false
                self.flatImage.hidden = false
                self.circleLayer.hidden = false
                self.sharpImage.transform = CGAffineTransformIdentity
                self.flatImage.transform = CGAffineTransformIdentity
                self.circleLayer.transform = CATransform3DIdentity
                self.sharpImage.frame = sharpFrame
                self.flatImage.frame = flatFrame
                self.circleLayer.frame = circleFrame
                }, completion: nil)
            //self.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        }
        else {
            self.activeState = false
            
            //Animate scaling images down in an ease-out block
            UIView.transitionWithView(self, duration: 0.10, options:UIViewAnimationOptions.TransitionCrossDissolve, animations: {
                self.sharpImage.transform = CGAffineTransformMakeScale(0.001, 0.001)
                self.flatImage.transform = CGAffineTransformMakeScale(0.001, 0.001)
                self.circleLayer.transform = CATransform3DMakeScale(0.001, 0.001, 0.001)
                self.sharpImage.hidden = true;
                self.flatImage.hidden = true;
                self.circleLayer.hidden = true;
                self.setAccidental(true)
                }, completion: nil)
        }
    }
    
    func drawCircle() {
        
    }
    
    func setAccidental(toSharp : Bool) {
        if self.titleForState(UIControlState.Normal) != "0" {
            if toSharp {
                self.sharpActive = true
                UIView.transitionWithView(self, duration: 0.10, options:UIViewAnimationOptions.CurveLinear, animations: {
                    let tmpOrigin = self.flatImage.frame.origin
                    self.flatImage.frame.origin = self.sharpImage.frame.origin
                    self.sharpImage.frame.origin = tmpOrigin
                    self.flatImage.alpha = 0.4
                    self.sharpImage.alpha = 1.0
                    }, completion: nil)
            }
            else {
                self.sharpActive = false
                UIView.transitionWithView(self, duration: 0.10, options: UIViewAnimationOptions.CurveLinear, animations: {
                    let tmpOrigin = self.sharpImage.frame.origin
                    self.sharpImage.frame.origin = self.flatImage.frame.origin
                    self.flatImage.frame.origin = tmpOrigin
                    self.sharpImage.alpha = 0.4
                    self.flatImage.alpha = 1.0
                    }, completion: nil)
            }
        }
        else {
            UIView.transitionWithView(self, duration: 0.075, options: UIViewAnimationOptions.CurveLinear, animations: {
                self.sharpImage.transform = CGAffineTransformMakeScale(0.50, 0.50)
                self.flatImage.transform = CGAffineTransformMakeScale(0.50, 0.50)
                }, completion: { (finished: Bool) -> () in
                    UIView.transitionWithView(self, duration: 0.075, options: UIViewAnimationOptions.CurveLinear, animations: {
                        self.sharpImage.transform = CGAffineTransformIdentity
                        self.flatImage.transform = CGAffineTransformIdentity
                        }, completion: nil)
            })
        }
    }
    
    func buttonTapped() {
        if let activeButton = self.getActiveButton() {
            if self != activeButton {
                activeButton.setState(false)
            }
        }
        if self.activeState {
            self.setAccidental(!self.sharpActive)
        }
        else {
            self.setState(true)
        }
    }
    
    //Return the KeyRecognizeButton (if any) in active state
    func getActiveButton() -> KeyRecognizeButton? {
        if let superView = self.superview {
            for view in superView.subviews {
                if view.isKindOfClass(KeyRecognizeButton) {
                    if let isActive = view.activeState {
                        if isActive {
                            return view as? KeyRecognizeButton
                        }
                    }
                    
                }
            }
        }
        return nil
    }
    
    class func deactivateAll(aView : UIView) {
        for view in aView.subviews {
            if view.isKindOfClass(KeyRecognizeButton) {
                view.setState(false)
            }
        }
    }
}
