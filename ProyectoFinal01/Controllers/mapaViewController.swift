//
//  mapaViewController.swift
//  ProyectoFinal01
//
//  Created by Karla García on 30/11/21.
//

import UIKit
import MapKit
import CoreLocation

class mapaViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()

    @IBOutlet weak var mapa: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        mapa.showsTraffic = true
        mapa.showsScale = true
        mapa.showsCompass = true
        
        let ls1 = CLLocationCoordinate2DMake(19.436894523932907,  -99.14015301745195)
        mapa.region = MKCoordinateRegion(center: ls1, latitudinalMeters: 4500, longitudinalMeters: 4500)
        let ls1a = MKPointAnnotation()
        ls1a.coordinate = ls1
        ls1a.title = "Sanborns Centro Histórico"
        ls1a.subtitle = "Lugar Seguro de 8:00 a.m. a 10:00 p.m."
        mapa.addAnnotation(ls1a)
        
        let ls2 = CLLocationCoordinate2DMake(19.433315459825554,  -99.14299750041673)
        mapa.region = MKCoordinateRegion(center: ls2, latitudinalMeters: 4500, longitudinalMeters: 4500)
        let ls2a = MKPointAnnotation()
        ls2a.coordinate = ls2
        ls2a.title = "Cielito Querido"
        ls2a.subtitle = "Lugar Seguro de 7:00 a.m. a 10:00 p.m."
        mapa.addAnnotation(ls2a)
        
        let ls3 = CLLocationCoordinate2DMake(19.35140366683566,  -99.16198900753679)
        mapa.region = MKCoordinateRegion(center: ls3, latitudinalMeters: 4500, longitudinalMeters: 4500)
        let ls3a = MKPointAnnotation()
        ls3a.coordinate = ls3
        ls3a.title = "Café El Jarocho"
        ls3a.subtitle = "Lugar Seguro de 6:00 a.m. a 12:00 a.m."
        mapa.addAnnotation(ls3a)
        
        let ls4 = CLLocationCoordinate2DMake(19.415660961010925,  -99.17304101739342)
        mapa.region = MKCoordinateRegion(center: ls4, latitudinalMeters: 4500, longitudinalMeters: 4500)
        let ls4a = MKPointAnnotation()
        ls4a.coordinate = ls4
        ls4a.title = "eNHORAbUENAa Café"
        ls4a.subtitle = "Lugar Seguro de 8:00 a.m. a 8:00 p.m."
        mapa.addAnnotation(ls4a)
        
        let ls5 = CLLocationCoordinate2DMake(19.353680989940177,  -99.16118416626817)
        mapa.region = MKCoordinateRegion(center: ls5, latitudinalMeters: 4500, longitudinalMeters: 4500)
        let ls5a = MKPointAnnotation()
        ls5a.coordinate = ls5
        ls5a.title = "Pizza del Perro Negro"
        ls5a.subtitle = "Lugar Seguro de 11:00 a.m. a 10:00 p.m."
        mapa.addAnnotation(ls5a)
        
        let ls6 = CLLocationCoordinate2DMake(19.29910693016497,  -99.13254933828556)
        mapa.region = MKCoordinateRegion(center: ls6, latitudinalMeters: 4500, longitudinalMeters: 4500)
        let ls6a = MKPointAnnotation()
        ls6a.coordinate = ls6
        ls6a.title = "Tacos CopaCabana"
        ls6a.subtitle = "Lugar Seguro de 12:00 p.m. a 3:00 a.m."
        mapa.addAnnotation(ls6a)
        
        let ls7 = CLLocationCoordinate2DMake(19.407755774759718,  -99.17707287180865)
        mapa.region = MKCoordinateRegion(center: ls7, latitudinalMeters: 4500, longitudinalMeters: 4500)
        let ls7a = MKPointAnnotation()
        ls7a.coordinate = ls7
        ls7a.title = "Molino El Pujol"
        ls7a.subtitle = "Lugar Seguro de 9:00 a.m. a 7:00 p.m."
        mapa.addAnnotation(ls7a)
        
        let ls8 = CLLocationCoordinate2DMake(19.418501794721614,  -99.15870512800304)
        mapa.region = MKCoordinateRegion(center: ls8, latitudinalMeters: 4500, longitudinalMeters: 4500)
        let ls8a = MKPointAnnotation()
        ls8a.coordinate = ls8
        ls8a.title = "Cafebrería El Péndulo"
        ls8a.subtitle = "Lugar Seguro de 8:00 a.m. a 11:00 p.m."
        mapa.addAnnotation(ls8a)
        
        let ls9 = CLLocationCoordinate2DMake(19.356773683222553,  -99.15487422208938)
        mapa.region = MKCoordinateRegion(center: ls9, latitudinalMeters: 4500, longitudinalMeters: 4500)
        let ls9a = MKPointAnnotation()
        ls9a.coordinate = ls9
        ls9a.title = "La Panera"
        ls9a.subtitle = "Lugar Seguro de 8:00 a.m. a 10:00 p.m."
        mapa.addAnnotation(ls9a)
        
        let ls10 = CLLocationCoordinate2DMake(19.439185247576102,  -99.1679647532367)
        mapa.region = MKCoordinateRegion(center: ls10, latitudinalMeters: 4500, longitudinalMeters: 4500)
        let ls10a = MKPointAnnotation()
        ls10a.coordinate = ls10
        ls10a.title = "La Polar"
        ls10a.subtitle = "Lugar Seguro de 8:00 a.m. a 2:00 a.m."
        mapa.addAnnotation(ls10a)
        
        let ls11 = CLLocationCoordinate2DMake(19.28163624166664,  -99.16811421582196)
        mapa.region = MKCoordinateRegion(center: ls11, latitudinalMeters: 4500, longitudinalMeters: 4500)
        let ls11a = MKPointAnnotation()
        ls11a.coordinate = ls11
        ls11a.title = "Amaretto Café"
        ls11a.subtitle = "Lugar Seguro de 10:00 a.m. a 10:00 p.m."
        mapa.addAnnotation(ls11a)
        
        let ls12 = CLLocationCoordinate2DMake(19.299227016634752,  -99.13660653043839)
        mapa.region = MKCoordinateRegion(center: ls12, latitudinalMeters: 4500, longitudinalMeters: 4500)
        let ls12a = MKPointAnnotation()
        ls12a.coordinate = ls12
        ls12a.title = "Starbucks Via Acoxpa"
        ls12a.subtitle = "Lugar Seguro de 10:00 a.m. a 10:00 p.m."
        mapa.addAnnotation(ls12a)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus){
        
        if status == .authorizedWhenInUse{
            //podemos usar la ubicación del iphone
            locationManager.startUpdatingLocation()
            mapa.showsUserLocation = true
        }else{
            //no podemos usar la ubicación
            locationManager.stopUpdatingLocation()
            mapa.showsUserLocation = false
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
