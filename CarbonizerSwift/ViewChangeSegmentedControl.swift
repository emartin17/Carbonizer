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
    
    required override init() {
        super.init()
        let textGrey = UIColor(white: 242/255, alpha: 1.0)
        //        self.frame.size.height = 59.5
        self.layer.borderColor = textGrey.CGColor
        self.layer.borderWidth = 1
        self.backgroundColor = UIColor.clearColor()
        let activeAttributes : [NSString : AnyObject] = [NSFontAttributeName: UIFont(name: "OpenSans-Semibold", size: 18), NSForegroundColorAttributeName: UIColor.blackColor()]
        let passiveAttributes : [NSString : AnyObject] = [NSFontAttributeName: UIFont(name: "OpenSans-Semibold", size: 18), NSForegroundColorAttributeName: textGrey]
        self.setTitleTextAttributes(activeAttributes, forState: UIControlState.Selected)
        self.setTitleTextAttributes(activeAttributes, forState: UIControlState.Normal)
        self.tintColor = UIColor(white: 245/255, alpha: 1.0)
        self.setDividerImage(UIImage(named: "Divider.png"), forLeftSegmentState: UIControlState.Selected, rightSegmentState: UIControlState.Normal, barMetrics: UIBarMetrics.Default)
    }
    
    required override init(frame: CGRect) {
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
        super.init(coder: aDecoder)
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
    
    
    
}
