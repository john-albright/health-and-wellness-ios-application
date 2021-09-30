//
//  ViewControllerLocations.swift
//  wellness
//
//  Created by John Albright on 5/12/21.
//  Copyright © 2021 John Albright. All rights reserved.
//

import UIKit
import MapKit


class ViewControllerLocations: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    // Link the map view to the controller swift file
    @IBOutlet weak var mapView: MKMapView!
    
    // Create a class to inherit from MKPointAnnotation class to hold points
    class MyAnnotation: MKPointAnnotation { }
    
    var locationManager = CLLocationManager()
    
    var annotationArray = [MyAnnotation]()
    
    var allObjectsTupleArray: [(objLat: CLLocationDegrees, objLong: CLLocationDegrees, objName: String, objDesc: String)] = [(objLat: 41.878114, objLong: -87.629798, objName: "Nuveen Bld.", objDesc: "333 W Wacker, Chicago"), (objLat: 41.888969, objLong: -87.633924, objName: "Merch Mart Bld.", objDesc: "333 W Wacker, Chicago"), (objLat: 41.885295, objLong: -87.621490, objName: "Aon Building", objDesc: "200 E Randolph Street, Chicago"), (objLat: 41.889019, objLong: -87.626549, objName: "Trump International Hotel & Tower", objDesc: "401 N Wabash Ave, Chicago"), (objLat: 41.884892, objLong: -87.631897, objName: "James R. Thompson Center", objDesc: "100 W Randolph Street, Chicago")]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        // Set current head office location of Dr. Feelgood (state of IL building)
        let currentLatitude = 41.885598
        let currentLongitude = -87.625001
        
        // Set map span
        let latDelta = 0.10
        let longDelta = 0.10
        
        let currentLocationSpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        let currentLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(currentLatitude, currentLongitude)
        let currentRegion: MKCoordinateRegion = MKCoordinateRegion(center: currentLocation, span: currentLocationSpan)
        self.mapView.setRegion(currentRegion, animated: true)
        
        var indx = 0
        
        for oneObject in allObjectsTupleArray {
            let oneAnnotation = MyAnnotation()
            let oneObjLoc: CLLocationCoordinate2D = CLLocationCoordinate2DMake(oneObject.objLat, oneObject.objLong)
            
            print("Latitude: \(oneObject.objLat)   Longitude: \(oneObject.objLong)")
            oneAnnotation.coordinate = oneObjLoc
            
            oneAnnotation.title = oneObject.objName
            print("ObjectName: \(oneObject.objName)")
            
            oneAnnotation.subtitle = oneObject.objDesc
            print("ObjectDescription: \(oneObject.objDesc)")
            
            // Declare variable d with each iteration
            var d:Double = 0
            
            if (indx < allObjectsTupleArray.count - 1) {
                let vlat1:Double = allObjectsTupleArray[indx].0
                let vlong1:Double = allObjectsTupleArray[indx].1
                let vlat2:Double = allObjectsTupleArray[indx+1].0
                let vlong2:Double = allObjectsTupleArray[indx+1].1
                
                d = distance(lat1: vlat1, lon1: vlong1, lat2: vlat2, lon2:vlong2)
                
                print(d);
                
            }
            
            // Only add (successive) pins that are less than 0.7 miles apart from each other 
            if d < 0.7 {
                annotationArray.append(oneAnnotation);
            }
            
            indx = indx + 1;
            print()
        }
        
        self.mapView.addAnnotations(annotationArray)
        
    }
    
    // Haversine function to calculate distance
    func distance(lat1: Double, lon1: Double, lat2: Double, lon2: Double) -> Double {
        
        let radlat1 = .pi * lat1/180
        let radlat2 = .pi * lat2/180
        let theta = lon1-lon2
        let radtheta = .pi * theta/180
        var dist = sin(radlat1) * sin(radlat2) + cos(radlat1) * cos(radlat2) * cos(radtheta)
        
        dist = acos(dist)
        dist = dist * 180/Double.pi
        dist = dist * 60 * 1.1515
        return dist
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
