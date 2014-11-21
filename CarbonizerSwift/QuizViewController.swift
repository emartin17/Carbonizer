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
        self.settingsDisplay.transform = CGAffineTransformMakeTranslation(0, self.view.frame.height)
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
    
    @IBAction func toggleSettings(sender : UIButton) {
        if settingsDisplay.hidden {
            self.showSettings()
        }
        else {
            self.dissmissSettings()
        }
    }
    
    func showSettings() {
        UIView.transitionWithView(self.view, duration: 0.5, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.settingsDisplay.hidden = false
            self.settingsDisplay.transform = CGAffineTransformIdentity
            }, completion: nil)
    }
    
    func dissmissSettings() {
        UIView.transitionWithView(self.view, duration: 0.5, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.settingsDisplay.transform = CGAffineTransformMakeTranslation(0, self.view.frame.height)
            }, completion: { (Bool finished) -> () in
                self.settingsDisplay.hidden = true
        })
    }
}

