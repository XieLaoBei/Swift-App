//
//  MapViewController.swift
//  FoodPin
//
//  Created by LaoBeiXie on 04/02/2017.
//  Copyright © 2017 LaoBeiXie. All rights reserved.
//

import UIKit

import MapKit


class MapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var restaurant:Restaurant!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self

        // implement the mapView(_: viewForAnnotation:) method
        
        func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
            let identifier = "MyPin"
            
            if annotation.isKind(of: MKUserLocation.self) {
                return nil
            }
            
            // Reuse the annotation if possible
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            
            if annotation == nil {
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView?.canShowCallout = true
            }
            
            let leftIconView = UIImageView(frame: CGRect(0,0,53,53))
            leftIconView.image = UIImage(named: restaurant.image)
            annotationView?.leftCalloutAccessoryView = leftIconView
            return annotationView
        }
        
        // Add the Annotation on the map
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(restaurant.location, completionHandler: { placemarks, error in
            if error != nil {
              print(error!)
              return
            }
    
            if placemarks != nil && (placemarks?.count)!  > 0 {
              let placemark = (placemarks?[0])! as CLPlacemark
                
              let annotation = MKPointAnnotation()
              annotation.title = self.restaurant.name
              annotation.subtitle = self.restaurant.type
              annotation.coordinate = (placemark.location?.coordinate)!
            
              self.mapView.showAnnotations([annotation], animated: true)
              self.mapView.selectAnnotation(annotation, animated: true)
          }
        }
     )
  }
}
