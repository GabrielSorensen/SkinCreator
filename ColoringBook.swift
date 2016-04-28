//
//  ColoringBook.swift
//  SkinCreator
//
//  Created by Gabe Sorensen on 3/28/16.
//  Copyright © 2016 TeamEvil. All rights reserved.
//

import UIKit


class ColoringBook: UIViewController {
    
    struct color {
        var r: CGFloat;
        var g: CGFloat;
        var b: CGFloat;
        var opacity: CGFloat;
        var name: String;
    }
    var possibleColors = [color]();
	var Currentmodel: WeaponModel?;
	var lastPoint = CGPoint.zero;
	var red: CGFloat = 0.0;
	var green: CGFloat = 0.0;
	var blue: CGFloat = 0.0;
	var brushwidth: CGFloat = 10.0;
	var opacity: CGFloat = 1.0;
	var swiped = false;
    var flip = false;
    var currentColor: color?;
    var i = 0;

    @IBOutlet weak var sizeSlider: UISlider!
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var tempImageView: UIImageView!
    @IBOutlet weak var weaponMask: UIImageView!
    @IBOutlet weak var brushLabel: UIBarButtonItem!
    @IBOutlet weak var colorStepper: UIStepper!
    @IBOutlet weak var selectedColorLabel: UIBarButtonItem!
    @IBOutlet weak var showOverlayButton: UIBarButtonItem!

	override func viewWillAppear(animated: Bool) {
		Currentmodel = (self.tabBarController as! TabController).currentModel;
        possibleColors = [color]();
        addColors();
        colorStepper.minimumValue = 0;
        colorStepper.autorepeat = false;
        colorStepper.continuous = false;
        colorStepper.value = 0;
        colorStepper.stepValue = 1.0;
        colorStepper.maximumValue = Double(possibleColors.count) - 1.0;
        sizeSlider.minimumValue = 1;
        sizeSlider.maximumValue = Float(view.frame.size.width/3);
        sizeSlider.continuous = true;
        sizeSlider.setValue(Float(brushwidth), animated: true);
        currentColor = possibleColors[Int(colorStepper.value)];
        selectedColorLabel.title = currentColor!.name;
	}
	
	override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
		swiped = false;
		if let touch = touches.first {
			lastPoint = touch.locationInView(self.view);
		}
	}
    
    @IBAction func sliderChanged(sender: UISlider) {
        brushLabel.title = "\(String(format: sizeSlider.value == floor(sizeSlider.value) ? "%.0f" : "%.1f", sizeSlider.value) + "px")";
        brushwidth = CGFloat(sizeSlider.value);
    }
    
    @IBAction func Clear(sender: UIBarButtonItem) {
		//mainImageView.image = nil;
		tempImageView.image = nil;
    }
    
    
    @IBAction func changeColor(sender: UIStepper) {
        currentColor = possibleColors[Int(colorStepper.value)];
        self.red = currentColor!.r;
        self.green = currentColor!.g;
        self.blue = currentColor!.b;
        selectedColorLabel.title = currentColor!.name;
    }
	
	func drawLineFrom(fromPoint: CGPoint, toPoint: CGPoint) {
		UIGraphicsBeginImageContext(view.frame.size);
		let context = UIGraphicsGetCurrentContext();
        tempImageView.image?.drawInRect(CGRect(x:0, y: 0, width: view.frame.size.width, height: view.frame.size.height));
        CGContextMoveToPoint(context, fromPoint.x, fromPoint.y);
        CGContextAddLineToPoint(context, toPoint.x, toPoint.y);
        CGContextMoveToPoint(context, fromPoint.x, fromPoint.y)
        CGContextAddLineToPoint(context, toPoint.x, toPoint.y)
        CGContextSetLineCap(context, CGLineCap.Round)
        CGContextSetLineWidth(context, brushwidth)
        CGContextSetRGBStrokeColor(context, red, green, blue, 1.0)
        CGContextSetBlendMode(context, CGBlendMode.Normal)
        CGContextStrokePath(context)
        tempImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        tempImageView.alpha = opacity
        UIGraphicsEndImageContext()
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        swiped = true
        if let touch = touches.first {
            let currentPoint = touch.locationInView(view)
            drawLineFrom(lastPoint, toPoint: currentPoint)
            lastPoint = currentPoint
        }
    }
	
	@IBAction func showOverlay(sender: UIBarButtonItem) {
		if (flip) {
			self.flip = false;
			//weaponMask.
		} else {
			self.flip = true;
			
		}
	}
	
    func addColors() {
		possibleColors.append(color(r: 0.0, g: 0.0, b: 0.0, opacity: 1.0, name: "black"));
		possibleColors.append(color(r: 1.0, g: 1.0, b: 1.0, opacity: 1.0, name: "white"));
        possibleColors.append(color(r: 1.0, g: 0.0, b: 0.0, opacity: 1.0, name: "red"));
        possibleColors.append(color(r: 0.0, g: 1.0, b: 0.0, opacity: 1.0, name: "green"));
        possibleColors.append(color(r: 0.0, g: 0.0, b: 1.0, opacity: 1.0, name: "blue"));
        possibleColors.append(color(r: 1.0, g: 1.0, b: 0.0, opacity: 1.0, name: "yellow"));
        possibleColors.append(color(r: 0.0, g: 1.0, b: 1.0, opacity: 1.0, name: "cyan"));
        possibleColors.append(color(r: 1.0, g: 0.0, b: 1.0, opacity: 1.0, name: "purple"));
		possibleColors.append(color(r: 1.0, g: 0.6, b: 0.0, opacity: 1.0, name: "orange"));
		//possibleColors.append(color(r: 0.0, g: 0.0, b: 0.0, opacity: 1.0, name: ""));
    }
    
    
    
	
}