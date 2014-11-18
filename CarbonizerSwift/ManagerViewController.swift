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
        super.init(coder: aDecoder)
    }
    
    
    
    var pageVC : UIPageViewController
    var quizVC : UIViewController
    var studyVC : UIViewController
    
    @IBOutlet weak var viewSwitcher: ViewChangeSegmentedControl!
    
    @IBOutlet weak var vcDisplayer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
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
    
    @IBAction func viewSwitcherPressed(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            pageVC.setViewControllers([quizVC], direction: UIPageViewControllerNavigationDirection.Reverse, animated: true, completion: nil)
        }
        else if sender.selectedSegmentIndex == 1 {
            pageVC.setViewControllers([studyVC], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
        }
    }
}