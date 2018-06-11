//
//  ViewController.swift
//  GoogleMapsDemo
//
//  Created by Raghavendra Dattawad on 12/20/17.
//  Copyright © 2017 Raghavendra Dattawad. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController,CLLocationManagerDelegate,GMSMapViewDelegate{

    let marker: GMSMarker? = GMSMarker ()
     var locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
      GMSServices.provideAPIKey("AIzaSyBeLo_dLfpNoOirqwotKDNB3dvXuBQTNzY")
//
//      let camera = GMSCameraPosition.camera(withLatitude: 12.949791, longitude: 77.621686, zoom: 15.0)
//
//
  // let mapView = GMSMapView.map(withFrame:CGRect.zero, camera: camera)
//
     // view = mapView
//
        // Creates a marker in the center of the map.
//        let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2D(latitude: 12.949791, longitude: 77.621686)
//        marker.title = "Bangalore"
//        marker.snippet = "karanataka"
//        marker.map = mapView
//        let markerImage = UIImage(named: "icon")!.withRenderingMode(.alwaysTemplate)
//
//        let markerView = UIImageView(image: markerImage)
//
//        //changing the tint color of the image
//        markerView.tintColor = UIColor.green
//        marker.iconView = markerView
//
        
        locationManager.delegate = self
      locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    
      
    
    }
    
   
    
    
func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
{
    //CLLocation:- IT CONTAINS LATTITUDE AND LONGITUDE INFORMATION //
    
    
    //CLLocationManager :-   The object that you use to start and stop the delivery of location-related events to your app.
    
  let userLocation = locations.last

    // CLLocationCoordinate2D :- The latitude and longitude associated with a location, specified using the WGS 84 reference frame.
    
    
  let center = CLLocationCoordinate2D(latitude: userLocation!.coordinate.latitude, longitude: userLocation!.coordinate.longitude)

   let camera = GMSCameraPosition.camera(withLatitude: userLocation!.coordinate.latitude,
                                                      longitude: userLocation!.coordinate.longitude, zoom: 10)
  
    
    
let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
   mapView.isMyLocationEnabled = true
  self.view = mapView
  // let marker = GMSMarker()
marker?.position = center
marker?.title = "Bangalore"
marker?.snippet = "jayanagr"
marker?.icon =   UIImage(named: "icon")

mapView.delegate =self
    marker?.map = mapView

//Call this method whenever your code no longer needs to receive location-related events. Disabling event delivery gives the receiver the option of disabling the appropriate hardware (and thereby saving power) when no clients need location data. You can always restart the generation of location updates by calling the startUpdatingLocation() method again.
locationManager.stopUpdatingLocation()

//    CATransaction.begin()
//    CATransaction.setValue(2.0, forKey: kCATransactionAnimationDuration)
//    CATransaction.setCompletionBlock({() -> Void in
//        self.marker?.groundAnchor = CGPoint(x: 0.5, y: 0.5)
//        //marker.rotation = Double(data["bearing"] ?? 0.0)
//        //New bearing value from backend after car movement is done
//    })

    
    }
    func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
        
     
        if (gesture) {
        print("move mapview")
        }
       
    }
    

    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        
        return true
    }
    
    
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
     
        print("change camera")
        
        
    }
 
    func mapView(_ mapView: GMSMapView, didDrag marker: GMSMarker) {
        print("drag")
        
        
    }
    func mapView(_ mapView: GMSMapView, didEndDragging marker: GMSMarker) {
        
        print(" did end drag")
        
        
    }

}


