//
//  HomeViewController.swift
//  snoozer
//
//  Created by Jeremie Girault on 04/10/2016.
//
//

import UIKit
import SnapKit
import OAuthSwift

class HomeViewController: UIViewController {
    
    let startButton: UIButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Sn👀zer"
        view.backgroundColor = .white
        
        view.addSubview(startButton)
        startButton.snp.makeConstraints { make in
            make.center.equalTo(view)
        }
        
        startButton.setTitle("Start", for: .normal)
        startButton.addTarget(self, action: #selector(startTouched), for: .touchUpInside)
    }
    
    @objc func startTouched() {
        let oauth = OAuth2Swift.fromEnvironment
        oauth.authorizeURLHandler = SafariURLHandler(viewController: self, oauthSwift: oauth)
        let state = NSUUID().uuidString
        
        self.navigationController?.pushViewController(TaskViewController(), animated: true)
        
        return
        let _ = oauth.authorize(
            withCallbackURL: URL(string: "com.kamidude.snoozer:/oauth-callback/gcal")!,
            scope: "https://www.googleapis.com/auth/calendar.readonly",
            state: state,
            success: { [weak self] credential, response, parameters in
                print(credential.oauthToken)
                self?.navigationController?.pushViewController(TaskViewController(), animated: true)
            },
            failure: { error in
                print(error.localizedDescription)
            }
        )
    }
}

