//
//  UIViewController+Toast.swift
//  snoozer
//
//  Created by Jeremie Girault on 04/10/2016.
//
//

import UIKit
import SnapKit

extension UIViewController {
    func toast(withTitle title: String, cancel: @escaping () -> Void) {
        let toastView = UIView()
        toastView.backgroundColor = .black
        
        let label = UILabel()
        label.text = title
        let cancel = UIButton(type: .system)
        cancel.setTitle("Cancel", for: .normal)
        cancel.addTarget(self, action: #selector(toastDidCancel), for: .touchUpInside)
        
        toastView.addSubview(label)
        toastView.addSubview(cancel)
        view.addSubview(toastView)
        
        toastView.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.snp.bottom)
            make.height.greaterThanOrEqualTo(label.snp.height).offset(20)
            make.height.greaterThanOrEqualTo(cancel.snp.height).offset(20)
        }
        
        label.snp.makeConstraints { make in
            make.centerY.equalTo(view)
            make.leading.equalTo(view).offset(10)
            make.trailing.lessThanOrEqualTo(cancel.snp.leading).priority(200)
        }
        cancel.snp.makeConstraints { make in
            make.centerY.equalTo(view)
            make.trailing.equalTo(view).offset(-10)
        }
        
        toastView.layoutIfNeeded()
        
        let toastHideTransform = CATransform3DMakeTranslation(0, toastView.frame.height, 0)
        toastView.layer.transform = toastHideTransform
        UIView.animate(withDuration: 0.2) {
            toastView.layer.transform = CATransform3DIdentity
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            UIView.animate(withDuration: 0.2, animations: {
                toastView.layer.transform = toastHideTransform
                }, completion: { _ in
                    toastView.removeFromSuperview()
                })
        }
    }
    
    @objc func toastDidCancel(button: UIButton) {
        print("Cancel")
    }

}
