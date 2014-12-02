//
//  KeyRecognizeButton.swift
//  CarbonizerSwift
//
//  Created by Eric Martin on 11/10/14.
//  Copyright (c) 2014 Martin Developments. All rights reserved.
//

import UIKit

class KeyRecognizeButton: UIButton {
    var accidentalView : UIImageView
    var circleLayer : CAShapeLayer
    var sharpActive : Bool
    var activeState : Bool
    let mySuperView : UIView?
    
    required init(coder aDecoder: NSCoder) {
        self.activeState = false
        self.sharpActive = true
        self.accidentalView = UIImageView()
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
        self.circleLayer.transform = CATransform3DMakeScale(0.1, 0.1, 0.1)
        self.layer.insertSublayer(self.circleLayer, atIndex: 0)
        
        //Set up accidental ImageView
        
        if self.titleForState(UIControlState.Normal) == "0" {
            self.accidentalView.frame = CGRectMake(self.frame.width+7, -22, 24.5, 22)
            self.accidentalView.image = UIImage(named: "sharpFlat.png")
        }
        else {
            self.accidentalView.frame = CGRectMake(self.frame.width+24.5, -22, 7, 22)
            self.accidentalView.image = UIImage(named: "sharp.png")
        }
        self.accidentalView.hidden = true;
        self.accidentalView.transform = CGAffineTransformMakeScale(0.1, 0.1)
        self.addSubview(accidentalView)
    }
    
    func setState(toActive : Bool) {
        
        var accidentalFrame = CGRectZero
        if self.titleForState(UIControlState.Normal) == "0" {
            accidentalFrame = CGRectMake(self.frame.width+24.5, -22, 24.5, 22)
        }
        else {
            accidentalFrame = CGRectMake(self.frame.width+24.5, -22, 7, 22)
        }
        let circleFrame = CGRectMake(0, 0, 57, 57)
        
        if toActive {
            self.activeState = true
            self.accidentalView.hidden = false
            self.circleLayer.hidden = false
            UIView.transitionWithView(self, duration: 0.10, options:UIViewAnimationOptions.CurveEaseOut, animations: {
                self.accidentalView.transform = CGAffineTransformIdentity
                self.circleLayer.transform = CATransform3DIdentity
                }, completion: nil)
        }
        else {
            self.activeState = false
            
            //Animate scaling images down in an ease-out block
            UIView.transitionWithView(self, duration: 0.10, options:UIViewAnimationOptions.CurveEaseInOut, animations: {
                self.accidentalView.transform = CGAffineTransformMakeScale(0.1, 0.1)
                self.circleLayer.transform = CATransform3DMakeScale(0.1, 0.1, 0.1)
                }, completion: { (finished : Bool) -> () in
                    self.accidentalView.hidden = true;
                    self.circleLayer.hidden = true;
                    if self.titleForState(UIControlState.Normal) != "0" {
                        self.accidentalView.image = UIImage(named: "sharp.png")
                        self.sharpActive = true
                    }
                }
            )
        }
    }
    
    
    func setAccidental(toSharp : Bool) {
        if self.titleForState(UIControlState.Normal) != "0" {
            let accidentalFrame = CGRectMake(self.frame.width+7, -22, 7, 22)
            if toSharp {
                self.sharpActive = true
                UIView.transitionWithView(self, duration: 0.075, options: UIViewAnimationOptions.CurveLinear, animations: {
                    self.accidentalView.transform = CGAffineTransformMakeScale(0.50, 0.50)
                    }, completion: { (finished: Bool) -> () in
                        UIView.transitionWithView(self, duration: 0.075, options: UIViewAnimationOptions.CurveLinear, animations: {
                            self.accidentalView.image = UIImage(named: "sharp.png")
                            self.accidentalView.transform = CGAffineTransformIdentity
                            }, completion: nil)
                })
            }
            else {
                self.sharpActive = false
                UIView.transitionWithView(self, duration: 0.075, options: UIViewAnimationOptions.CurveLinear, animations: {
                    self.accidentalView.transform = CGAffineTransformMakeScale(0.50, 0.50)
                    }, completion: { (finished: Bool) -> () in
                        UIView.transitionWithView(self, duration: 0.075, options: UIViewAnimationOptions.CurveLinear, animations: {
                            self.accidentalView.image = UIImage(named: "flat.png")
                            self.accidentalView.transform = CGAffineTransformIdentity
                            }, completion: nil)
                })
            }
        }
        else {
            let accidentalFrame = CGRectMake(self.frame.width+24.5, -22, 24.5, 22)
            UIView.transitionWithView(self, duration: 0.075, options: UIViewAnimationOptions.CurveLinear, animations: {
                self.accidentalView.transform = CGAffineTransformMakeScale(0.50, 0.50)
                }, completion: { (finished: Bool) -> () in
                    UIView.transitionWithView(self, duration: 0.075, options: UIViewAnimationOptions.CurveLinear, animations: {
                        self.accidentalView.transform = CGAffineTransformIdentity
                        //                        self.accidentalView.frame = accidentalFrame
                        }, completion: nil)
            })
        }
    }
    
    //    override func layoutSubviews() {
    //        let accidentalCenter = accidentalView.center
    //        let circleCenter = CGPointMake(circleLayer.position.x, circleLayer.position.y)
    //        super.layoutSubviews()
    //        accidentalView.center = accidentalCenter
    //        circleLayer.position = circleCenter
    //    }
    
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
