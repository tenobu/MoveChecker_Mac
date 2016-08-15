//
//  ViewController.swift
//  MoveChecker
//
//  Created by 寺内 信夫 on 2016/08/07.
//  Copyright © 2016年 寺内 信夫. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

	@IBOutlet weak var button_From     : NSButton!
	@IBOutlet weak var textField_From  : NSTextField!
	
	@IBOutlet weak var button_ToBase   : NSButton!
	@IBOutlet weak var textField_ToBase: NSTextField!

	@IBOutlet weak var textField_To    : NSTextField!

	@IBOutlet weak var button_Copy     : NSButton!
	@IBOutlet weak var button_Delete   : NSButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()

		let defaults = NSUserDefaults.standardUserDefaults()
		if let from = defaults.stringForKey("From") {
			self.textField_From.stringValue = from
		}
		if let to_base = defaults.stringForKey("ToBase") {
			self.textField_ToBase.stringValue = to_base
		}
		if let to = defaults.stringForKey("To") {
			self.textField_To.stringValue = to
		}
	}
	
	override func viewDidDisappear() {
		super.viewDidDisappear()
		
		let from    = self.textField_From  .stringValue
		let to_base = self.textField_ToBase.stringValue
		let to      = self.textField_To    .stringValue
		
		let defaults = NSUserDefaults.standardUserDefaults()
		defaults.setObject(from   , forKey: "From"  )
		defaults.setObject(to_base, forKey: "ToBase")
		defaults.setObject(to     , forKey: "To"    )
	}
	
	override var representedObject: AnyObject? {
		didSet {
		// Update the view, if already loaded.
		}
	}
	
	@IBAction func button_From_On(sender: AnyObject) {
		let openPanel = NSOpenPanel();
		openPanel.title = "Select a folder to From Folder"
		openPanel.message = "Froms you drop in the folder you select will be Copy Files"
		openPanel.showsResizeIndicator=true;
		openPanel.canChooseDirectories = true;
		openPanel.canChooseFiles = false;
		openPanel.allowsMultipleSelection = false;
		openPanel.canCreateDirectories = true;
		//openPanel.delegate = self;
		
		openPanel.beginWithCompletionHandler { (result) -> Void in
			if(result == NSFileHandlingPanelOKButton){
				let path = openPanel.URL!.path!
				print("selected folder is \(path)");
				// self.watchFolderLabel.stringValue = path; //  no need when binding
				//self.savePref("watchFolder", value: path);
				
				self.textField_From.stringValue = path
			}
		}
	}

	@IBAction func button_ToBase_On(sender: AnyObject) {
		let openPanel = NSOpenPanel();
		openPanel.title = "Select a folder to ToBase Folder"
		openPanel.message = "ToBases you drop in the folder you select will be Copy Files"
		openPanel.showsResizeIndicator=true;
		openPanel.canChooseDirectories = true;
		openPanel.canChooseFiles = false;
		openPanel.allowsMultipleSelection = false;
		openPanel.canCreateDirectories = true;
		//openPanel.delegate = self;
		
		openPanel.beginWithCompletionHandler { (result) -> Void in
			if(result == NSFileHandlingPanelOKButton){
				let path = openPanel.URL!.path!
				print("selected folder is \(path)");
				// self.watchFolderLabel.stringValue = path; //  no need when binding
				//self.savePref("watchFolder", value: path);
				
				self.textField_ToBase.stringValue = path
				
				self.makeToFolder()
			}
		}
	}

	@IBAction override func mouseDragged(theEvent: NSEvent) {
		/*NSCursor.closedHandCursor().set()
		var event_location = theEvent.locationInWindow
		
		test.frame.origin.x = event_location.x - 192
		test.frame.origin.y = event_location.y*/
	}
	
	private func makeToFolder() {
		let from = self.textField_From.stringValue;
		
		let fileManager = NSFileManager.defaultManager()

		var isDir : ObjCBool = true
		if fileManager.fileExistsAtPath(from, isDirectory: &isDir) == false {
			return
		}
		
		let to_base = self.textField_ToBase.stringValue;
		if fileManager.fileExistsAtPath(to_base, isDirectory: &isDir) == false {
			return
		}
		
		let froms = from.componentsSeparatedByString("/")
		
		self.textField_To.stringValue = to_base + "/" + froms[froms.count - 1]
	}

}

