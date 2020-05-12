//
//  ViewController.swift
//  VKApp
//
//  Created by Julie on 10.05.2020.
//  Copyright © 2020 YuliaShlaeva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
   
    @IBOutlet weak var loginIntput: UITextField!
    
    
    @IBOutlet weak var passwordInput: UITextField!
    
    
  @IBAction func SigninButtonPressed(_ sender: Any) {
      
      let login = loginIntput.text!
      let password = passwordInput.text!
      
      if login == "admin" && password == "012345" {
          print ("Authorization successful")
      } else {
          print ("Authorization unsuccessfull")
      }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
            let checkResult = checkUserData()
            if !checkResult { showLoginError()
            }
            return checkResult
        }
        
    func checkUserData() -> Bool {
        guard let login = loginIntput.text, let password = passwordInput.text else {return false}
        if login == "admin" && password == "012345" {
            return true
        } else {
            return false
        }
    }
        
    func showLoginError() {
        let alert = UIAlertController(title: "Error", message: "Incorrect data of User", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
    }
    
    
    
    

}

