//
//  Snoozer+Impl.swift
//  snoozer
//
//  Created by Jeremie Girault on 04/10/2016.
//
//

import Foundation
import SnoozerRPC

extension SNZSnoozer {
    
    private static func create() -> SNZSnoozer {
        let host = "192.168.1.27:50051"
        GRPCCall.useInsecureConnections(forHost: host)
        return SNZSnoozer(host: host)
    }
    
    // @nonobjc because of bug http://stackoverflow.com/questions/29814706/a-declaration-cannot-be-both-final-and-dynamic-error-in-swift-1-2
    @nonobjc static let shared = SNZSnoozer.create()
}
