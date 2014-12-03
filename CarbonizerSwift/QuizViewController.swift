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
    @IBOutlet weak var timer: TimerView!
    var secondsLeft : Int
    
    required init(coder aDecoder: NSCoder) {
        secondsLeft = 60
        super.init(coder: aDecoder)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let quizTimer = NSTimer(timeInterval: 1.0, target: self, selector: Selector("updateTimer"), userInfo: nil, repeats: true)
        let mainLoop = NSRunLoop.mainRunLoop()
//        mainLoop.addTimer(quizTimer, forMode: NSDefaultRunLoopMode)
//        self.timer.setProgress(0.0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submit(sender: UIButton) {
        sender.alpha = 0.4
        sender.enabled = false;
        KeyRecognizeButton.deactivateAll(self.view)
        
    }
    
    
    @IBAction func toggleSettings(sender : UIButton) {
        let popoverVC = self.storyboard?.instantiateViewControllerWithIdentifier("quizSettings") as UIViewController
        popoverVC.modalPresentationStyle = UIModalPresentationStyle.Popover
        
        let popoverController = popoverVC.popoverPresentationController
        popoverController?.sourceView = sender
        popoverController?.sourceRect = sender.bounds
        popoverController?.permittedArrowDirections = UIPopoverArrowDirection.Any
        
        presentViewController(popoverVC, animated: true, completion: nil)
    }
    
    
    func gameOver() {
        println("CHUNDRABINDU")
    }
    
    func updateTimer() {
        self.secondsLeft-=1
        let progress = Float(60.0-secondsLeft)/60.0
        println(progress)
//        self.timer.setProgress(progress)
    }
}

