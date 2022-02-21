//
//  BLEManager.swift
//  Diy
//
//  Created by Mohanraj S K on 19/02/22.
//

import UIKit
import CoreBluetooth

typealias StatusCallback = ((CBManagerState) -> Void)

class BLEManager: NSObject {

    // MARK: Properties

    private var manager: CBCentralManager?
    var status: CBManagerState! = .none
    var statusCallback: StatusCallback?

    // MARK: Lifecycle
    
    init(callback: @escaping StatusCallback) {
        super.init()
        manager = CBCentralManager.init(delegate: self, queue: nil)
        self.statusCallback = callback
    }

}

// MARK: Delegate - Service's

extension BLEManager: CBCentralManagerDelegate {

    // MARK: Receive bluetooth state after - init manager

    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        
        case .poweredOff:
            print("BLE is powered off")

        case .poweredOn:
            print("BLE is powered On")

        case .resetting:
            print("BLE is resetting")
            
        case .unauthorized:
            print("BLE is unauthorized")
            
        case .unknown:
            print("BLE is unknown")
            
        case .unsupported:
            print("BLE is unsupported")
            
        default:
            print("BLE default")
            
        }
        statusCallback?(central.state)
        manager = nil
    }

}
