//
//  LocationView.swift
//  A View To The Past
//
//  Created by James O'Rourke on 01/02/2020.
//  Copyright © 2020 James O'Rourke. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps
import CoreLocation

class LocationView: UIViewController,  CLLocationManagerDelegate{
    let nav = NavBar()
    let locationManager = CLLocationManager()
    var loc = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
    let marker = GMSMarker()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nav.setupNavBarItems()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
}
        print()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        loc = locValue
    print("locations = \(locValue.latitude) \(locValue.longitude)")
        marker.position = loc
    
}

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }
    override func loadView() {
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    let camera = GMSCameraPosition.camera(withLatitude: 52.40 , longitude: -6.93, zoom: 6.0)
    let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
    view = mapView

    // Creates a marker in the center of the map.
    
    marker.position = loc
    marker.title = "Sydney"
    marker.snippet = "Australia"
    marker.map = mapView
  }
    
    
}
