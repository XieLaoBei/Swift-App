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
        
        self.mapView.delegate = self

        // Convert address to coordinate and annotate it on map
        let geoCoder = CLGeocoder()
        if let res = restaurant {
            geoCoder.geocodeAddressString(res.location, completionHandler: {placemarks, error in
                if error != nil {
                    print(error!)
                    return
                }
                
                if placemarks != nil && (placemarks?.count)! > 0 {
                    let placemark = (placemarks?[0])! as CLPlacemark
                    
                    // Add Annotation
                    let annotation = MKPointAnnotation()
                    annotation.title = res.name
                    annotation.subtitle = res.type
                    annotation.coordinate = (placemark.location?.coordinate)!
                    
                    self.mapView.showAnnotations([annotation], animated: true)
                    self.mapView.selectAnnotation(annotation, animated: true)
                }
            })
        }

    }
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "MyPin"
        
        if annotation.isKind(of: MKUserLocation.self) {
            return nil
        }
        
        // Reuse the annotation if possible
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
        }
        
        let leftIconView = UIImageView(frame: CGRect(x:0, y:0, width:53, height:53))
        leftIconView.image = UIImage(named: restaurant.image)
        annotationView?.leftCalloutAccessoryView = leftIconView
        
        return annotationView
    }
}
