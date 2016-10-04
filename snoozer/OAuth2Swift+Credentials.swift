//
//  Credentials.swift
//  snoozer
//
//  Created by Jeremie Girault on 04/10/2016.
//
//

import Foundation
import OAuthSwift

extension OAuth2Swift {
    
    static var fromEnvironment: OAuth2Swift {
        
        let currentProcess = ProcessInfo()
        let key = currentProcess.environment["consumerKey"] ?? "<myKey>"
        let secret = currentProcess.environment["consumerSecret"] ?? "<mySecret>"
        
        return OAuth2Swift(consumerKey: key,
                           consumerSecret: secret,
                           authorizeUrl: "https://accounts.google.com/o/oauth2/auth",
                           accessTokenUrl: "https://accounts.google.com/o/oauth2/token",
                           responseType: "code")
    }
}
