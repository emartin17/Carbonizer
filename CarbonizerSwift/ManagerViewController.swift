//
//  ManagerViewController.swift
//  CarbonizerSwift
//
//  Created by Eric Martin on 11/16/14.
//  Copyright (c) 2014 Martin Developments. All rights reserved.
//

import UIKit

class ManagerViewController: UIViewController {
    
    required init(coder aDecoder: NSCoder) {
        pageVC = UIPageViewController()
        quizVC = UIViewController()
        studyVC = UIViewController()
        //        barConstraintsQ = [NSLayoutConstraint()]
        //        barConstraintsS = [NSLayoutConstraint()]
        quizBtnConstraint = NSLayoutConstraint()
        studyBtnConstraint = NSLayoutConstraint()
        super.init(coder: aDecoder)
        //        quizBtnConstraint = NSLayoutConstraint(item: self.activeStateBar, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.quizButton, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0)
        //        studyBtnConstraint = NSLayoutConstraint(item: self.activeStateBar, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.studyButton, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0)
        //        let widthCn = NSLayoutConstraint(item: self.activeStateBar, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 48)
        //        let heightCn = NSLayoutConstraint(item: self.activeStateBar, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 3)
        //        barConstraintsQ = [quizBtnConstraint, widthCn, heightCn]
        //        barConstraintsS = [studyBtnConstraint, widthCn, heightCn]
    }
    
    
    
    var pageVC : UIPageViewController
    var quizVC : UIViewController
    var studyVC : UIViewController
    var quizBtnConstraint : NSLayoutConstraint
    var studyBtnConstraint : NSLayoutConstraint
    //    var barConstraintsQ : [NSLayoutConstraint]
    //    var barConstraintsS : [NSLayoutConstraint]
    
    @IBOutlet weak var quizButton: UIButton!
    @IBOutlet weak var studyButton: UIButton!
    @IBOutlet weak var activeStateBar: UIView!
    @IBOutlet weak var vcDisplayer: UIView!
    @IBOutlet weak var quizButtonConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib
        quizBtnConstraint = NSLayoutConstraint(item: self.activeStateBar, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.quizButton, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0)
        quizBtnConstraint.identifier = "quizCn"
        studyBtnConstraint = NSLayoutConstraint(item: self.activeStateBar, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.studyButton, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0)
        studyBtnConstraint.identifier = "studyCn"
        
        quizVC = self.storyboard?.instantiateViewControllerWithIdentifier("quiz") as UIViewController
        studyVC = self.storyboard?.instantiateViewControllerWithIdentifier("study") as UIViewController
        pageVC.setViewControllers([quizVC], direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "initialEmbed" {
            pageVC = segue.destinationViewController as UIPageViewController
        }
        
    }
    
    @IBAction func viewSwitcherPressed(sender: UIButton) {
        self.view.removeConstraint(quizButtonConstraint)
        if sender.tag == 0 {
            self.view.removeConstraint(studyBtnConstraint)
            self.view.addConstraint(quizBtnConstraint)
            UIView.animateWithDuration(0.2, animations: {
                self.view.layoutIfNeeded()
            })
            pageVC.setViewControllers([quizVC], direction: UIPageViewControllerNavigationDirection.Reverse, animated: true, completion: nil)
            
        }
            
        else if sender.tag == 1 {
            println("CONSTRAINTS: \(self.view.constraints())")
            self.view.removeConstraint(quizBtnConstraint)
            println("CONSTRAINTS: \(self.view.constraints())")
            self.view.addConstraint(studyBtnConstraint)
            UIView.animateWithDuration(0.2, animations: {
                self.view.layoutIfNeeded()
            })
            pageVC.setViewControllers([studyVC], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
            
        }
        //        println("MARK \(self.view.subviews)")
    }
}