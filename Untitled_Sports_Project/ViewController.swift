//
//  ViewController.swift
//  Untitled_Sports_Project
//
//  Created by Eric Carter on 1/6/19.
//  Copyright © 2019 Eric Carter. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
//    let firebaseAuth = Auth.auth()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func SignIn(_ sender: AnyObject){
        if username.text == ""{
            let alertController = UIAlertController(title: "Error",
                                                    message: "Please Enter your Username/Password",
                                                    preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK",
                                              style: .cancel,
                                              handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
        }
        else{
            Auth.auth().signIn(withEmail: self.username.text!, password: self.password.text!){ (user, error) in
                if error == nil{
                    //login successfull
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "homeController")
                    self.present(vc!, animated: true, completion: nil)
                }
                else{
                    let alertController = UIAlertController(title: "Error",
                                                            message: error?.localizedDescription,
                                                            preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK",
                                                      style: .cancel,
                                                      handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func Register(_ sender: AnyObject){
        if username.text == ""{
            let alertController = UIAlertController(title: "Error",
                                                    message: "Please Enter your Username/Password",
                                                    preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK",
                                              style: .cancel,
                                              handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
        }
        else{
            Auth.auth().createUser(withEmail: self.username.text!, password: self.password.text!){ (authResult, error) in
                if error == nil{
                    //Creation successfull
                                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                                        self.present(vc!, animated: true, completion: nil)
                }
                else{
                    let alertController = UIAlertController(title: "Error",
                                                            message: error?.localizedDescription,
                                                            preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK",
                                                      style: .cancel,
                                                      handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }

}

