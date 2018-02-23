//
//  ViewController.swift
//  Simple Network Status Checker
//
//  Created by Mark Filter on 2/23/18.
//  Copyright © 2018 Mark Filter. All rights reserved.
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software
//  and associated documentation files (the "Software"), to deal in the Software without restriction,
//  including without limitation the rights to use, copy, modify, merge, publish, distribute,
//  sublicense, and/or sell coppies of the software and to permit persons to whome the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all copies or
//  substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT
//  NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
//  DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var lbl_resultsLabel: UILabel!
    @IBOutlet var tf_targetUrlTextField: UITextField!
    @IBOutlet var btn_CheckStatusButton: UIButton!
    var targetURLString : String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        registerTextFieldDelegate()
        disableButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NetworkUtils.checkConnection(viewController: self, urlString: "https://www.google.com/") { (alertController, isConnected) -> (Void) in
            if isConnected {
                self.lbl_resultsLabel.text = "Connected successfully!"
            }
            else {
                 self.lbl_resultsLabel.text = "Error connecting to server!"
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    // Sets status bar to indicated style
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent 
    }
    
    // MARK: - Actions
    
    @IBAction func buttonCheckStatusTapped(_ sender: UIButton) {
        if btn_CheckStatusButton.isEnabled == true {
            lbl_resultsLabel.text = "Checking " + targetURLString
            Log.d(TAG: "buttonCheckStatusTapped", message: targetURLString)
            NetworkUtils.checkConnection(viewController: self, urlString: targetURLString) { (alertController, isConnected) -> (Void) in
                if isConnected {
                    self.lbl_resultsLabel.text = "Connected successfully!"
                }
                else {
                    self.lbl_resultsLabel.text = "Error connecting to server!"
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
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

extension ViewController : UITextFieldDelegate {
    
    func registerTextFieldDelegate() {
        tf_targetUrlTextField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
        if tf_targetUrlTextField.text == "" {
            self.disableButton()
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let urlStringInput = textField.text! + string
        Log.i(TAG: "textField.shouldChangeCharactersIn", message: urlStringInput)
        targetURLString = urlStringInput
        
        if urlStringInput != "" && self.btn_CheckStatusButton.isEnabled == false {
            self.enableButton()
            targetURLString = urlStringInput
        }
        
        return true
    }
}

