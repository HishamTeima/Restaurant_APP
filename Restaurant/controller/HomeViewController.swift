//
//  HomeViewController.swift
//  Restaurant
//
//  Created by Hany Karam on 1/16/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
     @IBOutlet weak var tableview: UITableView!
 
     var item = [Model]()
     var index = 0
   var counterItem = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        item.append(Model(image:"Screen Shot 2020-01-16 at 8.56.40 PM" , name: "FAMILY MEAL", price: 176, id: 0, quantity: 1))
        
        item.append(Model(image: "Screen Shot 2020-01-16 at 9.01.54 PM", name: "SUPER SUPREME", price: Int(88.5), id: 1, quantity: 2))
        item.append(Model(image: "Screen Shot 2020-01-16 at 9.03.53 PM", name: "SPICY CHICKEN RANCH", price: Int(113.16), id: 2, quantity: 3))
        item.append(Model(image: "Screen Shot 2020-01-16 at 9.05.36 PM", name: "HOT N SPICY", price: 75, id: 3, quantity: 4 ))
        item.append(Model(image: "Screen Shot 2020-01-16 at 9.07.20 PM", name: "PEPSI", price: 13, id: 4, quantity: 5))
        item.append(Model(image: "Screen Shot 2020-01-16 at 9.10.42 PM", name: "Share Box", price: 125, id: 5, quantity: 6))
    
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
            let des = segue.destination as! DetailsViewController
            
        des.items = self.item[index]
        
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HomeTableViewCell
        cell.img.image = UIImage(named: item[indexPath.row].image)
        
        cell.name.text = item[indexPath.row].name
        cell.price.text = String(item[indexPath.row].price)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        performSegue(withIdentifier: "Home", sender: self)
        
    }
    
  
    
}
