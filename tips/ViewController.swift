//
//  ViewController.swift
//  tips
//
//  Created by Katerina Simonova on 2/2/15.
//  Copyright (c) 2015 Katerina Simonova. All rights reserved.
//

import UIKit

struct GlobalConstants {
    static let defaultTipIndexKey = "defaultTipKey"
}

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billField.text = ""
        tipLabel.text = "0.00"
        totalLabel.text = "$0.00"
        
        var defaults = NSUserDefaults.standardUserDefaults()
        var defaultTipIndex = defaults.integerForKey(GlobalConstants.defaultTipIndexKey)
        tipControl.selectedSegmentIndex = defaultTipIndex
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        var defaults = NSUserDefaults.standardUserDefaults()
        var defaultTipIndex = defaults.integerForKey(GlobalConstants.defaultTipIndexKey)
        tipControl.selectedSegmentIndex = defaultTipIndex
        updateFields()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateFields()
    {
        var billAmount = (billField.text as NSString).doubleValue
        
        var tipPercentages = [0.18, 0.2, 0.25]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        println(tipControl.selectedSegmentIndex)
        
        var tipAmount = billAmount * tipPercentage
        
        var total = billAmount + tipAmount
        
        tipLabel.text = "$\(tipAmount)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tipAmount)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        updateFields()
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

