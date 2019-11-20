//
//  SignUpViewController.swift
//  BuddyEats2.0
//
//  Created by Natasha Rao on 9/14/19.
//  Copyright © 2019 Natasha Rao. All rights reserved.
//

import UIKit
import Firebase
//edit^


class SignUpViewController: UIViewController {


    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var ConfirmPass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func SignUp(_ sender: Any) {
        
        var email = ""
        var password = ""
        
        if Email.text != nil {
            email = Email.text ?? ""
        }
        if Password.text != nil {
            password = Password.text ?? ""
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            // ...
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
