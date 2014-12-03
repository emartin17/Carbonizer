//
//  ViewChangeSegmentedControl.swift
//  CarbonizerSwift
//
//  Created by Eric Martin on 11/13/14.
//  Copyright (c) 2014 Martin Developments. All rights reserved.
//

import UIKit

class ViewChangeSegmentedControl: UISegmentedControl {
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
    // Drawing code
    }
    */
    var selectedSegmentIndicator : UIView
    var quizBarFrame : CGRect
    
    required override init() {
        self.selectedSegmentIndicator = UIView()
        self.quizBarFrame = CGRectZero
        super.init()
        self.backgroundColor = UIColor(red: 29, green: 30, blue: 30, alpha: 1.0)
        let activeAttributes : [NSString : AnyObject] = [NSFontAttributeName: UIFont(name: "OpenSans-Semibold", size: 18), NSForegroundColorAttributeName: UIColor.whiteColor()]
        let passiveAttributes : [NSString : AnyObject] = [NSFontAttributeName: UIFont(name: "OpenSans-Semibold", size: 18), NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.setTitleTextAttributes(activeAttributes, forState: UIControlState.Selected)
        self.setTitleTextAttributes(activeAttributes, forState: UIControlState.Normal)
    }
    
    required override init(frame: CGRect) {
        self.selectedSegmentIndicator = UIView()
        self.quizBarFrame = CGRectZero
        super.init(frame: frame)
        let textGrey = UIColor(white: 242/255, alpha: 1.0)
        //        self.frame.size.height = 59.5
        self.layer.borderColor = textGrey.CGColor
        self.layer.borderWidth = 1
        self.backgroundColor = UIColor.clearColor()
        let activeAttributes : [NSString : AnyObject] = [NSFontAttributeName: UIFont(name: "OpenSans-Semibold", size: 18), NSForegroundColorAttributeName: UIColor.blackColor()]
        let passiveAttributes : [NSString : AnyObject] = [NSFontAttributeName: UIFont(name: "OpenSans-Semibold", size: 18), NSForegroundColorAttributeName: textGrey]
        self.setTitleTextAttributes(activeAttributes, forState: UIControlState.Selected)
        //self.setTitleTextAttributes(passiveAttributes, forState: UIControlState.Normal)
        self.setTitleTextAttributes(activeAttributes, forState: UIControlState.Normal)
        self.tintColor = UIColor(white: 245/255, alpha: 1.0)
        self.setDividerImage(UIImage(named: "Divider.png"), forLeftSegmentState: UIControlState.Selected, rightSegmentState: UIControlState.Normal, barMetrics: UIBarMetrics.Default)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        self.selectedSegmentIndicator = UIView()
        self.quizBarFrame = CGRectZero
        super.init(coder: aDecoder)
        
        let activeAttributes : [NSString : AnyObject] = [NSFontAttributeName: UIFont(name: "OpenSans-Semibold", size: 18), NSForegroundColorAttributeName: UIColor.whiteColor()]
        //        let passiveAttributes : [NSString : AnyObject] = [NSFontAttributeName: UIFont(name: "OpenSans-Semibold", size: 18), NSForegroundColorAttributeName: textGrey]
        self.setTitleTextAttributes(activeAttributes, forState: UIControlState.Selected)
        //self.setTitleTextAttributes(passiveAttributes, forState: UIControlState.Normal)
        self.setTitleTextAttributes(activeAttributes, forState: UIControlState.Normal)
        self.tintColor = UIColor.clearColor()
        self.backgroundColor = UIColor(red: 29/255, green: 30/255, blue: 30/255, alpha: 1.0)
        let barWidth = (self.frame.size.width-30)/2
        self.addSubview(selectedSegmentIndicator)
        self.quizBarFrame = CGRectMake(self.bounds.origin.x, self.frame.size.height+10, 65, 3)
        println(self.frame)
        println(self.quizBarFrame)
        self.selectedSegmentIndicator.frame = quizBarFrame
        self.selectedSegmentIndicator.backgroundColor = UIColor(red: 64/255, green: 179/255, blue: 66/255, alpha: 1.0)
        
    }
    
    
    
    
}
