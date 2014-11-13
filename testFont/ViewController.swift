//
//  ViewController.swift
//  testFont
//
//  Created by Cindy Zheng on 11/12/14.
//  Copyright (c) 2014 Cindy Z. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var nagBar: UIButton!
    @IBOutlet weak var fontLabel: UILabel!
      override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        // self.fontLabel.text =  "\u{f082}"
        
        self.fontLabel.textColor = UIColor.orangeColor()
        self.fontLabel.font = UIFont(name: "FontAwesome", size: 38)
        self.fontLabel.text = String(NSString.fontAwesomeIconStringForEnum(FAIcon.ArrowRight))
        self.nagBar.setTitleColor(UIColor.purpleColor(), forState: UIControlState.Normal)
        
        self.nagBar.titleLabel?.font = UIFont(name:"FontAwesome",size : 28)
        
        var iconFont = String(NSString.fontAwesomeIconStringForEnum(FAIcon.ArrowRight))
        
        self.nagBar.setTitle(iconFont, forState: UIControlState.Normal)
        
    }
 

}

