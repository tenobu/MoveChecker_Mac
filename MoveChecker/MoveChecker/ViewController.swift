//
//  ViewController.swift
//  MoveChecker
//
//  Created by 寺内 信夫 on 2016/08/07.
//  Copyright © 2016年 寺内 信夫. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

	@IBOutlet weak var button_From: NSButton!
	@IBOutlet weak var textField_From: NSTextField!
	
	@IBOutlet weak var button_ToBase: NSButton!
	@IBOutlet weak var textField_ToBase: NSTextField!

	@IBOutlet weak var textField_To: NSTextField!
	
	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.
	}

	override var representedObject: AnyObject? {
		didSet {
		// Update the view, if already loaded.
		}
	}


}

