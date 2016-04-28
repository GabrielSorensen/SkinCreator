//
//  ModelDetails.swift
//  SkinCreator
//
//  Created by Gabe Sorensen on 3/23/16.
//  Copyright © 2016 TeamEvil. All rights reserved.
//

import Foundation
import UIKit
import SceneKit

@available(iOS 8.0, *)
class WeaponModel {
    
    var bundle = NSBundle.mainBundle();
	var image: UIImage?;
	var objStringPath: String?;
	var objURL: NSURL?
	var tgaStringPath: String?;
	var tgaURL: NSURL?
	var niceName: String?
	
	//var objAsset: MDLAsset?;
    
    init(objName: String) {
		self.niceName = objName
		let path = bundle.pathForResource(objName, ofType: "obj")
		self.objStringPath = path
		let url = NSURL(fileURLWithPath: path!);
		self.objURL = url
		self.image = UIImage(named: "Assets/TGAs/\(objName)")
		//let tgaPath = bundle.pathForResource(objName, ofType: "tga")
		//self.tgaStringPath = tgaPath
		//let tgaURL = NSURL(fileURLWithPath: tgaPath!)
		//self.tgaURL = tgaURL
		//print(self.stringRepresentation())
    }
	
	convenience init() {
		self.init(objName: "awp")
	}
	
    func printVars() {
        print(bundle);
    }
	
    func getNSobject()  {
		//let note = SCNNode
		//mdl = MDLAsset(URL: url);
		//self.objAsset = asset;
    }
	
	func stringRepresentation() -> String {
		return "WeapMDL: \(objStringPath), WeapTGA \(tgaStringPath), Image: \(image.debugDescription)"
	}
    
    
}