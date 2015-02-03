//
//  SettingsViewController.swift
//  tips
//
//  Created by Katerina Simonova on 2/2/15.
//  Copyright (c) 2015 Katerina Simonova. All rights reserved.
//

import UIKit


class SettingsViewController: UIViewController {

    @IBOutlet weak var settingsControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var defaults = NSUserDefaults.standardUserDefaults()
        var defaultTipIndex = defaults.integerForKey(GlobalConstants.defaultTipIndexKey)
        settingsControl.selectedSegmentIndex = defaultTipIndex
    }

    @IBAction func onSettingChange(sender: AnyObject) {
        var settingsIndex = settingsControl.selectedSegmentIndex
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(settingsIndex, forKey: GlobalConstants.defaultTipIndexKey)
        defaults.synchronize()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onTouchUpInside(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
