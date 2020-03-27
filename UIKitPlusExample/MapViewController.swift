import UIKitPlus
import MapKit
import CoreLocation

class MapViewController: NavigationViewController {
    override var statusBarStyle: StatusBarStyle { .dark }
    
    lazy var mapView = MKMapView()
    
    var mapAnnotation: MKPointAnnotation?
    let locationManager = CLLocationManager()
    
    override func buildUI() {
        super.buildUI()
        title = "Map View"
        view.backgroundColor = .darkGray / .black
        body {
            UView(inline: mapView)
                .masksToBounds()
                .corners(10)
                .top(to: navigationBar, 16, safeArea: true)
                .edgesToSuperview(leading: 8, trailing: -8)
                .bottomToSuperview(-16, safeArea: true)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startTrackingLocation()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        stopTrackingLocation()
    }
    
    deinit { print("map view deinit") }
}

extension MapViewController {
    func startTrackingLocation() {
        locationManager.requestAlwaysAuthorization()
        // For use in foreground
        locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }

        mapView.delegate = self
        mapView.mapType = .standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true

        if let coor = mapView.userLocation.location?.coordinate {
            mapView.setCenter(coor, animated: true)
        }
    }
    
    func stopTrackingLocation() {
        locationManager.stopUpdatingLocation()
    }
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate

        mapView.mapType = MKMapType.standard

        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: locValue, span: span)
        mapView.setRegion(region, animated: true)
        let ma = MKPointAnnotation()
        ma.coordinate = locValue
        mapView.addAnnotation(ma)
        if let ma = mapAnnotation {
            mapView.removeAnnotation(ma)
        }
        mapAnnotation = ma
    }
}

extension MapViewController: MKMapViewDelegate {}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
@available(iOS 13.0, *)
struct MapViewController_Preview: PreviewProvider, UIKitPreviewProvider {
    static var colorScheme: PreviewColorScheme { .light }
    static var device: UIKitPreviewDevice { .iPhoneX }
    static var view: UIView { MapViewController().view }
}
#endif
