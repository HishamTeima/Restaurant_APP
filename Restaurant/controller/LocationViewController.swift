//
//  LocationViewController.swift
//  Restaurant
//
//  Created by Hany Karam on 1/17/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import UIKit
import  MapKit
class LocationViewController: UIViewController {
 
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let center = CLLocationCoordinate2D(latitude: 30.0072, longitude: 30.9745 )
let region = MKCoordinateRegion(center: center, latitudinalMeters: 1000, longitudinalMeters: 1000)
      mapView.setRegion(region, animated: true)
        
    }
    

 

}
