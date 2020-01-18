//
//  DetailsViewController.swift
//  Restaurant
//
//  Created by Hany Karam on 1/16/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import UIKit
import Braintree
var braintreeClient: BTAPIClient!
class DetailsViewController: UIViewController {
    var items:Model?
    @IBOutlet weak var ttle: UILabel!
    @IBOutlet weak var price: UILabel!
     @IBOutlet weak var img: UIImageView!
    override func viewDidLoad() {
        
    
      super.viewDidLoad()

        // Do any additional setup after loading the view.
        braintreeClient = BTAPIClient(authorization: "sandbox_s9tmxg2p_bqxnd6kn5zcm36pf")
       
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let food = items{
            self.ttle.text = food.name
            self.img.image =  UIImage(named: food.image)
            self.price.text = "price: \(food.price)"
        }
    }
    @IBAction func buyyyy(_ sender: Any) {
        let payPalDriver = BTPayPalDriver(apiClient: braintreeClient)
        payPalDriver.viewControllerPresentingDelegate = self
        payPalDriver.appSwitchDelegate = self // Optional
        
        // Specify the transaction amount here. "2.32" is used in this example.
        let request = BTPayPalRequest(amount: "2.32")
        request.currencyCode = "USD" // Optional; see BTPayPalRequest.h for more options
        
        payPalDriver.requestOneTimePayment(request) { (tokenizedPayPalAccount, error) in
            if let tokenizedPayPalAccount = tokenizedPayPalAccount {
                print("Got a nonce: \(tokenizedPayPalAccount.nonce)")
                
                // Access additional information
                let email = tokenizedPayPalAccount.email
                debugPrint(email)
                let firstName = tokenizedPayPalAccount.firstName
                let lastName = tokenizedPayPalAccount.lastName
                let phone = tokenizedPayPalAccount.phone
                
                // See BTPostalAddress.h for details
                let billingAddress = tokenizedPayPalAccount.billingAddress
                let shippingAddress = tokenizedPayPalAccount.shippingAddress
            } else if let error = error {
                // Handle error here...
                print(error)
            } else {
                // Buyer canceled payment approval
            }
        }
        
    }
    

}
extension DetailsViewController: BTViewControllerPresentingDelegate{
    func paymentDriver(_ driver: Any, requestsPresentationOf viewController: UIViewController) {
        
    }
    
    func paymentDriver(_ driver: Any, requestsDismissalOf viewController: UIViewController) {
        
    }
    
    
}
extension DetailsViewController:BTAppSwitchDelegate{
    func appSwitcherWillPerformAppSwitch(_ appSwitcher: Any) {
            }
    
    func appSwitcher(_ appSwitcher: Any, didPerformSwitchTo target: BTAppSwitchTarget) {
        
    }
    
    func appSwitcherWillProcessPaymentInfo(_ appSwitcher: Any) {
        
    }
    
    
}
