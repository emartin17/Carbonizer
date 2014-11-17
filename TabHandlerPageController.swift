//
//  TabHandlerPageControllerViewController.swift
//  CarbonizerSwift
//
//  Created by Eric Martin on 11/17/14.
//  Copyright (c) 2014 Martin Developments. All rights reserved.
//

import UIKit

class TabHandlerPageController: UIPageViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let quizVC: UIViewController? = self.storyboard?.instantiateViewControllerWithIdentifier("quiz") as? UIViewController
        let studyVC: UIViewController? = self.storyboard?.instantiateViewControllerWithIdentifier("study") as? UIViewController
        
        let pages = [quizVC!, studyVC!]
        
        self.setViewControllers([quizVC!], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
