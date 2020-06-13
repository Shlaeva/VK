//
//  ViewController.swift
//  VKApp
//
//  Created by Julie on 10.05.2020.
//  Copyright © 2020 YuliaShlaeva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var roll1: UIView!
    @IBOutlet weak var roll2: UIView!
    @IBOutlet weak var roll3: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        roll1.clipsToBounds = true
        roll1.layer.cornerRadius = roll1.bounds.size.width/2
        roll2.clipsToBounds = true
        roll2.layer.cornerRadius = roll2.bounds.size.width/2
        roll3.clipsToBounds = true
        roll3.layer.cornerRadius = roll3.bounds.size.width/2
        
        
        
        UIView.animate(withDuration: 2, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.roll1.alpha = 0.1
        })
        UIView.animate(withDuration: 2, delay: 1, options: [.repeat, .autoreverse], animations: {
                self.roll2.alpha = 0.1
        })
        UIView.animate(withDuration: 2, delay: 2, options: [.repeat, .autoreverse], animations: {
                    self.roll3.alpha = 0.1
        })
            
            
           
        
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
        _ = UIAlertController(title: "Error", message: "Incorrect data of User", preferredStyle: .alert)
        _ = UIAlertAction(title: "OK", style: .cancel, handler: nil)
    }
    
    

}

