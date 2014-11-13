//
//  ViewController.swift
//  CarbonizerSwift
//
//  Created by Eric Martin on 11/12/14.
//  Copyright (c) 2014 Martin Developments. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for family in UIFont.familyNames() {
            let strFamily = family as String
            for font in UIFont.fontNamesForFamilyName(strFamily) {
                println(font)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

