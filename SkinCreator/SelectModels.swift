//
//  SelectModels.swift
//  SkinCreator
//
//  Created by Gabe Sorensen on 3/28/16.
//  Copyright © 2016 TeamEvil. All rights reserved.
//

import Foundation
import UIKit


class SelectModels: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

	var Currentmodel: WeaponModel?
	var tableView: UITableView  =   UITableView()
	//var items: [String]?
	var availableWeapons = [WeaponModel]()
	let bundle = NSBundle.mainBundle()
	
	let FRAME_HEIGHT_OFFSET = UIApplication.sharedApplication().statusBarFrame.size.height + 2 // grab the topbar height and offset the tableview on that with a buffer of 2 somethings
	
	override func viewWillAppear(animated: Bool) {
		Currentmodel = (self.tabBarController as! TabController).currentModel;
        tableView.frame = CGRectMake(0, FRAME_HEIGHT_OFFSET, self.view.frame.width, self.view.frame.height);
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
		loadOBJS()
	}
	
	func loadOBJS() {
		let weps = ["ak-47", "awp"]
		for i in weps {
			let curWep = WeaponModel(objName: i)
			availableWeapons.append(curWep)
			//print("CurrentlyAdding: \(curWep.stringRepresentation())")
		}
	}
	
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return availableWeapons.count
		//self.items!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
		cell.textLabel?.text = self.availableWeapons[indexPath.row].niceName
        //cell.textLabel?.text = self.items![indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell #\(indexPath.row)!")
		Currentmodel = availableWeapons[indexPath.row]
		(self.tabBarController as! TabController).currentModel = Currentmodel!
		print(availableWeapons[indexPath.row].stringRepresentation())
		if ((tabBarController) != nil) {
			sleep(1)
			tabBarController?.selectedIndex = ((tabBarController?.selectedIndex)!-1)
			print("Jumping to tab: \(tabBarController?.selectedIndex)")
		}
    }
    
}