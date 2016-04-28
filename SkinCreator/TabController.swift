//
//  TabController.swift
//  SkinCreator
//
//  Created by Gabe Sorensen on 3/28/16.
//  Copyright © 2016 TeamEvil. All rights reserved.
//

import Foundation
import UIKit


class TabController: UITabBarController {
	
	//note check NSuser Defaults
	let prefs = NSUserDefaults.standardUserDefaults();
	//prefs.setValue("Value", forKey: "Key");
	//prefs.stringForKey("Key");
	//prefs.synchronize(); //this saves the data. Note not actuall necessary
	
	
	var currentModel: WeaponModel = WeaponModel.init(objName: "awp");
	
	override func viewDidLoad() {
		super.viewDidLoad();
		
	}

	required init?(coder aDecoder: NSCoder) {
	    //fatalError("init(coder:) has not been implemented")
		super.init(coder: aDecoder);
	}
	
	
}