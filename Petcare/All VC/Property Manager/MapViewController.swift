////
////  MapViewController.swift
////  Petcare
////
////  Created by Navdeep Paliwal on 16/12/20.
////
//
//import UIKit
//import GoogleMaps
//import GooglePlaces
//import Alamofire
//import SwiftyJSON
//
//class MapViewController: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate  {
//
//    @IBOutlet weak var currentLocation: UIView!
//    @IBOutlet weak var destinationLocation: UIView!
//    @IBOutlet weak var mapView: GMSMapView!
//    let locationManager = CLLocationManager()
//    var latValue = CLLocationDegrees()
//    var longValue = CLLocationDegrees()
//    var markerArray = Array<Any>()
//    var i : Int = 0
//    var origin = String()
//    var destination = String()
//    
//    var previousLat = CLLocationDegrees()
//    var previousLong = CLLocationDegrees()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        currentLocation.layer.shadowOffset = CGSize(width: 0, height: 1)
//        currentLocation.layer.shadowColor = UIColor.lightGray.cgColor
//        currentLocation.layer.shadowOpacity = 1
//        currentLocation.layer.shadowRadius = 5
//        currentLocation.layer.masksToBounds = false
//        currentLocation.layer.cornerRadius = currentLocation.layer.frame.height/2
//        
//        destinationLocation.layer.shadowOffset = CGSize(width: 0, height: 1)
//        destinationLocation.layer.shadowColor = UIColor.lightGray.cgColor
//        destinationLocation.layer.shadowOpacity = 1
//        destinationLocation.layer.shadowRadius = 5
//        destinationLocation.layer.masksToBounds = false
//        destinationLocation.layer.cornerRadius = destinationLocation.layer.frame.height/2
//        
//        getCurrentLocation()
//        
//        let camera = GMSCameraPosition.camera(withLatitude: 13.096079826355, longitude: 80.2916030883789, zoom: 6.0)
//        mapView.camera = camera
//        mapView.delegate = self
//        mapView.isMyLocationEnabled = true
//        mapView.settings.myLocationButton = true
//        initializeYourMap()
//    }
//    @IBAction func backButtonPressed(_ sender: UIButton) {
//        self.navigationController?.popViewController(animated: true)
//    }
//    @IBAction func directionButtonPressed(_ sender: UIButton) {
//        
//    }
//    
//    @IBAction func currentLocationBtnPressed(_ sender: UIButton) {
//        
//    }
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//          return .lightContent
//    }
//    func getCurrentLocation() {
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
//        locationManager.requestWhenInUseAuthorization() // Call the authorizationStatus() class
//        if CLLocationManager.locationServicesEnabled() { // get my current locations lat, lng
//            let lat = locationManager.location?.coordinate.latitude
//            let long = locationManager.location?.coordinate.longitude
//            if let lattitude = lat  {
//                if let longitude = long {
//                    latValue = lattitude
//                    longValue = longitude
//                } else {}
//            } else {
//                print("problem to find lat and lng")
//            }
//            
//        }
//        else {
//            print("Location Service not Enabled. Plz enable u'r location services")
//        }
//    }
//
//   func initializeYourMap() {
//    
//    var latLongArray : NSArray?
//    if let path = Bundle.main.path(forResource: "stations", ofType: "plist"){
//        latLongArray = NSArray(contentsOfFile : path)
//    }
//
//    if let items = latLongArray {
//        for item in items {
//            let latitude    = (item as AnyObject).value(forKey: "lat")
//            let longitude   = (item as AnyObject).value(forKey: "long")
//            let titleString = (item as AnyObject).value(forKey: "title")
//            drawMarker(title: titleString as! String, lat: latitude as! CLLocationDegrees , long: longitude as! CLLocationDegrees)
//            drawPath(title: titleString as! String, lat: latitude as! CLLocationDegrees , long: longitude as! CLLocationDegrees)
//        }
//    }
//}
//    
//    func drawMarker(title: String, lat: CLLocationDegrees , long: CLLocationDegrees) {
//        
//        let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2D(latitude: lat, longitude: long)
//        marker.title = title
//        marker.snippet = "GoogleMap"
//        marker.map = mapView
//        
//    }
//    
//    func drawPath(title: String, lat: CLLocationDegrees , long: CLLocationDegrees) {
//        
//        if i == 0 {
//             origin = "\(lat),\(long)"
//             destination = "\(lat),\(long)"
//
//        } else {
//            destination = "\(lat),\(long)"
//        }
//        i=1
//        
//        let url = "https://maps.googleapis.com/maps/api/directions/json?origin=\(origin)&destination=\(destination)&mode=driving"
//        origin = "\(lat),\(long)"
//        Alamofire.request(url).responseJSON { response in
//            
//            let json = try! JSON(data: response.data!)
//            let routes = json["routes"].arrayValue
//            
//            for route in routes
//            {
//                let routeOverviewPolyline = route["overview_polyline"].dictionary
//                let points = routeOverviewPolyline?["points"]?.stringValue
//                let path = GMSPath.init(fromEncodedPath: points!)
//                let polyline = GMSPolyline.init(path: path)
//                polyline.strokeWidth = 4
//                polyline.strokeColor = UIColor.red
//                polyline.map = self.mapView
//            }
//            
//        }
//    }
//}
