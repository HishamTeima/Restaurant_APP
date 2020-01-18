//
//  ViewController.swift
//  Restaurant
//
//  Created by Hany Karam on 1/16/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase


class ViewController: UIViewController,LoginButtonDelegate {
  

    @IBOutlet weak var fblogin: FBLoginButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fblogin.delegate = self
        fblogin?.permissions = ["email"]

    }
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        if error == nil {
            let credential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
            
            Auth.auth().signIn(with: credential) { (authResult, error) in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                print(authResult?.user.email)
            }
            
        }
        else {
            print((error?.localizedDescription)!)
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("user logged out")
    }
    

}
