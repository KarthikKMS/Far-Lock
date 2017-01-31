//
//  BeaconRangerManager.swift
//  Far Lock
//
//  Created by Karthik M S on 30/01/17.
//  Copyright © 2017 Karthik M S. All rights reserved.
//

import UIKit
import CoreLocation

protocol BeaconRangerManagerDelegate {
    func didEnterRegion(region: CLRegion)
    func didExitRegion(region: CLRegion)
    func didRangeBeacon(beacon: CLBeacon, proximityString: String)
}

class BeaconRangerManager: NSObject {
    
    // MARK: - Global Constants and Variables
    
    static var beaconRangerManager: BeaconRangerManager?
    
    let beaconRegion: CLBeaconRegion!
    let locationManager: CLLocationManager!
    var delegate: BeaconRangerManagerDelegate?
    var closestBeacon: CLBeacon?
    
    
    // MARK: - Initializations
    
    static func initBeaconRangerManager(uuid: UUID) {
        beaconRangerManager = BeaconRangerManager(uuid: uuid)
    }
    
    init(uuid: UUID) {
        beaconRegion = CLBeaconRegion(proximityUUID: uuid, identifier: "FarLockBeaconRegion")
        locationManager = CLLocationManager()
        super.init()
        locationManager.delegate = self
        beaconRegion.notifyOnEntry = true
        beaconRegion.notifyOnExit = true
    }
    
    
    // MARK: - Public Methods
    
    static func set(delegate: BeaconRangerManagerDelegate) {
        beaconRangerManager?.delegate = delegate
    }
    
    static func startMonitoringForBeacons() {
        beaconRangerManager?.locationManager.requestAlwaysAuthorization()
        beaconRangerManager?.locationManager.startMonitoring(for: (beaconRangerManager?.beaconRegion)!)
        beaconRangerManager?.locationManager.startUpdatingLocation()
    }
    
    static func stopMonitoringForBeacons() {
        beaconRangerManager?.locationManager.stopMonitoring(for: (beaconRangerManager?.beaconRegion)!)
        beaconRangerManager?.locationManager.stopRangingBeacons(in: (beaconRangerManager?.beaconRegion)!)
        beaconRangerManager?.locationManager.stopUpdatingLocation()
    }
    
}


// MARK: - CLLocationManagerDelegate Methods

extension BeaconRangerManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didStartMonitoringFor region: CLRegion) {
        print("locationManager didStartMonitoringForRegion: \(region)")
        locationManager.requestState(for: region)
    }
    
    func locationManager(_ manager: CLLocationManager, didDetermineState state: CLRegionState, for region: CLRegion) {
        print("locationManager didDetermineState: \(state)")
        if state == CLRegionState.inside {
            locationManager.startRangingBeacons(in: beaconRegion)
        }
        else {
            locationManager.stopRangingBeacons(in: beaconRegion)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        print("locationManager didRangeBeacons: \(beacons) inRegion: \(region)")
        
        if beacons.count > 0 {
            closestBeacon = beacons[0]
            var proximityString: String!
            
            switch closestBeacon!.proximity {
            case .immediate:
                proximityString = "very close"
                
            case .near:
                proximityString = "fear"
                
            case .far:
                proximityString = "far"
                
            case .unknown:
                proximityString = "unknown"
            }
            
            if let unwrappedDelegate = delegate {
                DispatchQueue.main.async(execute: {() -> Void in
                    unwrappedDelegate.didRangeBeacon(beacon: self.closestBeacon!, proximityString: proximityString)
                })
            }
            
            print("BeaconRangerManager :: proximity: \(proximityString  )")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("locationManager didEnterRegion: \(region)")
        if let unwrappedDelegate = delegate {
            DispatchQueue.main.async(execute: {() -> Void in
                unwrappedDelegate.didEnterRegion(region: region)
            })
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("locationManager didExitRegion: \(region)")
        if let unwrappedDelegate = delegate {
            DispatchQueue.main.async(execute: {() -> Void in
                unwrappedDelegate.didExitRegion(region: region)
            })
        }
    }
    
}
