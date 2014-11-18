//
//  ViewController.swift
//  CarbonizerSwift
//
//  Created by Eric Martin on 11/12/14.
//  Copyright (c) 2014 Martin Developments. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var settingsDisplay: UIView!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let originalOrigin = self.settingsDisplay.frame.origin
//        UIView.transitionWithView(self.view, duration: 1.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
//            self.settingsDisplay.transform = CGAffineTransformMakeTranslation(0, self.view.frame.height)
//            
//            //            self.settingsDisplay.transform = CGAffineTransformIdentity
//            }, completion: { (finished: Bool) -> () in
//                UIView.transitionWithView(self.view, duration: 1.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
//                    self.settingsDisplay.hidden = false
//                    self.settingsDisplay.transform = CGAffineTransformIdentity
//                    }, completion: nil)
//        })
        
        self.settingsDisplay.transform = CGAffineTransformMakeTranslation(0, self.view.frame.height)
        UIView.transitionWithView(self.view, duration: 0.75, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.settingsDisplay.hidden = false
            self.settingsDisplay.transform = CGAffineTransformIdentity
            }, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submit(sender: UIButton) {
        sender.alpha = 0.4
        sender.enabled = false;
        KeyRecognizeButton.deactiveAll(self.view)
        
    }
    
}

