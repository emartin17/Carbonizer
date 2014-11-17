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
        navC = UINavigationController()
        quizVC = UIViewController()
        studyVC = UIViewController()
        super.init(coder: aDecoder)
    }
    
    
    
    var navC : UINavigationController
    var quizVC : UIViewController
    var studyVC : UIViewController
    
    @IBOutlet weak var viewSwitcher: ViewChangeSegmentedControl!
    
    @IBOutlet weak var vcDisplayer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        quizVC = self.storyboard?.instantiateViewControllerWithIdentifier("quiz") as UIViewController
        studyVC = self.storyboard?.instantiateViewControllerWithIdentifier("study") as UIViewController
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        navC = segue.destinationViewController as UINavigationController
        println("MARK: \(navC)")
    }
    
    @IBAction func viewSwitcherPressed(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            navC.popViewControllerAnimated(true)
        }
        if sender.selectedSegmentIndex == 1 {
            self.navC.pushViewController(self.studyVC, animated: true)
        }
    }
}