// important: u hav to add info.plist from the file:dkbcfkf to work the below code

// below code gets current location frm the user also takes permission




import SwiftUI

import CoreLocation



// MARK: - Location Manager

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {

    private var locationManager = CLLocationManager()

    @Published var latitude: Double?

    @Published var longitude: Double?

    @Published var status: CLAuthorizationStatus?

    

    override init() {

        super.init()

        locationManager.delegate = self

        locationManager.desiredAccuracy = kCLLocationAccuracyBest

        locationManager.requestWhenInUseAuthorization()

        locationManager.startUpdatingLocation()

    }

    

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        guard let location = locations.first else { return }

        latitude = location.coordinate.latitude

        longitude = location.coordinate.longitude

    }

    

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {

        status = manager.authorizationStatus

    }

}





struct LocationApp: App {

    var body: some Scene {

        WindowGroup {

            ContentView()

        }

    }

}



// MARK: - UI

struct ContentView: View {

    @StateObject private var locationManager = LocationManager()

    

    var body: some View {

        VStack(spacing: 20) {

            Text("Current Location")

                .font(.title)

                .padding(.top, 40)

            

            if let lat = locationManager.latitude,

               let lon = locationManager.longitude {

                Text("Latitude: \(lat)")

                Text("Longitude: \(lon)")

            } else {

                Text("Fetching location...")

                    .foregroundColor(.gray)

            }

        }

        .padding()

    }

}
