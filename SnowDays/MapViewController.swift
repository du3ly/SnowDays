//
//  MapViewController.swift
//  SnowDays
//
//  Created by Duely Yung on 3/2/16.
//  Copyright © 2016 Duely Yung. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let chicago = CLLocation(latitude: 41.878114, longitude: -89.629798)
        
        // Center map to Chicago
        centerMapOnLocation(chicago)
        
        // Function contains 6 ski resorts around the Chicagoland area
        coordinatesAndPoints()
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let span = MKCoordinateSpanMake(5,5)
        let coordinateRegion = MKCoordinateRegionMake(location.coordinate, span)
        
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func coordinatesAndPoints() {
        let devilsHead = CLLocation(latitude: 43.3855, longitude: -89.6323)
        let alpine = CLLocation(latitude: 42.451859, longitude: -88.260968)
        let cascade = CLLocation(latitude:43.5501, longitude: -89.4714)
        let wilmot = CLLocation(latitude: 42.5072, longitude: -88.1913)
        let chestnut = CLLocation(latitude: 42.2594, longitude: -90.2897)
        let sunburst = CLLocation(latitude: 43.5214, longitude: -88.1925)
        
        let annotationDevil = MKPointAnnotation()
        annotationDevil.coordinate = devilsHead.coordinate
        annotationDevil.title = "Devil's Head Resort"
        
        let annotationAlpine = MKPointAnnotation()
        annotationAlpine.coordinate = alpine.coordinate
        annotationAlpine.title = "Alpine Ski Valley"
        
        let annotationCascade = MKPointAnnotation()
        annotationCascade.coordinate = cascade.coordinate
        annotationCascade.title = "Cascade Mountain"
        
        let annotationWilmot = MKPointAnnotation()
        annotationWilmot.coordinate = wilmot.coordinate
        annotationWilmot.title = "Wilmot Mountain"
        
        let annotationChestnut = MKPointAnnotation()
        annotationChestnut.coordinate = chestnut.coordinate
        annotationChestnut.title = "Chestnut Mountain"
        
        let annotationSunburst = MKPointAnnotation()
        annotationSunburst.coordinate = sunburst.coordinate
        annotationSunburst.title = "Sunburst Ski Area"
        
        mapView.addAnnotation(annotationDevil)
        mapView.addAnnotation(annotationAlpine)
        mapView.addAnnotation(annotationCascade)
        mapView.addAnnotation(annotationWilmot)
        mapView.addAnnotation(annotationChestnut)
        mapView.addAnnotation(annotationSunburst)
    }
    
    
}
