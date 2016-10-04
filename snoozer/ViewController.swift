//
//  ViewController.swift
//  snoozer
//
//  Created by Jeremie Girault on 04/10/2016.
//
//

import UIKit
import SnoozerRPC;

class ViewController: UIViewController {

    let host = "192.168.1.27:50051"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GRPCCall.useInsecureConnections(forHost: host)
        //[GRPCCall useInsecureConnectionsForHost:kHostAddress];
        //[GRPCCall setUserAgentPrefix:@"HelloWorld/1.0" forHost:kHostAddress];
        
        let greeter = HLWGreeter(host: host)
        let req = HLWHelloRequest()
        req.name = "Jay";
        greeter.sayHello(with: req) { (res, error) in
            if let error = error {
                print("\(error.localizedDescription)")
            } else {
                print(res?.message)
            }
        }
        
        view.backgroundColor = .white
    }
}

