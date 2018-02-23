//
//  ViewController.swift
//  Simple Network Status Checker
//
//  Created by Mark Filter on 2/23/18.
//  Copyright © 2018 Mark Filter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var lbl_resultsLabel: UILabel!
    @IBOutlet var tf_targetUrlTextField: UITextField!
    @IBOutlet var btn_CheckStatusButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        disableButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Custom Methods
    
    func enableButton() {
        btn_CheckStatusButton.alpha = 1.0
        btn_CheckStatusButton.isEnabled = true
    }
    
    func disableButton() {
        btn_CheckStatusButton.alpha = 0.5
        btn_CheckStatusButton.isEnabled = false
    }

}

