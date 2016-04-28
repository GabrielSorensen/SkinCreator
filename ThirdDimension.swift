//
//  ThirdDimension.swift
//  SkinCreator
//
//  Created by Gabe Sorensen on 3/28/16.
//  Copyright © 2016 TeamEvil. All rights reserved.
//

import Foundation
import UIKit
import SceneKit

class ThirdDimension: UIViewController {
	@IBOutlet weak var sceneView: SCNView!

	var Currentmodel: WeaponModel?;
	var scene = SCNScene();
	let bundle: NSBundle = NSBundle.mainBundle()

	override func viewDidLoad() {
		super.viewDidLoad()
		boxDemo()
		self.sceneView.play(nil)
	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		Currentmodel = (self.tabBarController as! TabController).currentModel;
	}
	
	func collada2SCNNode(filepath:String) -> SCNNode {
		let node = SCNNode()
		let scene = SCNScene(named: filepath)
		let nodeArray = scene!.rootNode.childNodes
		
		for childNode in nodeArray {
			node.addChildNode(childNode as SCNNode)
		}
		return node
	}

	func boxDemo() {
		scene = SCNScene()
		if let daepath = bundle.pathForResource("awp2", ofType: "dae") {
			print("Path: \(daepath)")
			let url = NSURL(fileURLWithPath: daepath)
			do {
				let geoScene = try SCNScene(URL: url, options: nil)
				var materials = geoScene.rootNode.geometry?.materials
				if materials != nil {
					for mat in materials! {
						mat.diffuse.contents = UIColor.blueColor()
						mat.doubleSided = true
					}
				}
				geoScene.rootNode.geometry?.firstMaterial?.diffuse.contents = UIColor.blueColor()
				geoScene.rootNode.geometry?.firstMaterial?.doubleSided = true
				print("SCNcene: \(geoScene)")
				scene.rootNode.addChildNode(geoScene.rootNode)
			} catch _ {
				
			}
			
		}
		
		// /Applications/Xcode.app/Contents/Developer/usr/bin/scntool --convert thing.dae --format c3d --output thingOUT.dae --force-y-up --force-interleaved --look-for-pvrtc-image

		var plane: SCNBox = SCNBox(width: 1000, height: 1000, length: 40, chamferRadius: 10);
		plane.firstMaterial!.diffuse.contents = UIColor(white: 0.2, alpha: 1.0);
		var planeNode: SCNNode = SCNNode(geometry: plane);
		planeNode.position = SCNVector3Make(100, 100, 0);
		planeNode.castsShadow = true;
//		scene.rootNode.addChildNode(planeNode);

		var lightNode2 = SCNNode()
		lightNode2.light = SCNLight();
		lightNode2.light!.type = SCNLightTypeAmbient;
		lightNode2.light!.color = UIColor.blueColor();
		lightNode2.light!.zFar = 100
		lightNode2.light!.zNear = 1
		lightNode2.light!.orthographicScale = 5
		scene.rootNode.addChildNode(lightNode2);

		var cameraNode = SCNNode()
		cameraNode.camera = SCNCamera()
		cameraNode.position = SCNVector3Make(0, 0, 100)
		scene.rootNode.addChildNode(cameraNode)

		self.sceneView.scene = scene
	}
}