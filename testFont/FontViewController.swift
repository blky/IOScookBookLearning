//
//  FontViewController.swift
//  testFont
//
//  Created by Cindy Zheng on 11/12/14.
//  Copyright (c) 2014 Cindy Z. All rights reserved.
//

import UIKit

class FontViewController: UIViewController {

    @IBOutlet weak var barItem: UIBarButtonItem!
    @IBOutlet weak var nagBar: UIButton!
    @IBOutlet weak var fontLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.fontLabel.textColor = UIColor.orangeColor()
        self.fontLabel.font = UIFont(name: "FontAwesome", size: 38)
        self.fontLabel.text = String(NSString.fontAwesomeIconStringForEnum(FAIcon.ArrowRight))
        self.nagBar.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        
        self.nagBar.titleLabel?.font = UIFont(name:"FontAwesome",size : 28)
        
        var iconFont = String(NSString.fontAwesomeIconStringForEnum(FAIcon.Bookmark))
        
        self.nagBar.setTitle(iconFont, forState: UIControlState.Normal)
    
        self.barItem.title = "back"
    
    }

    

}
