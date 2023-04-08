//
//  UIViewController+Ext.swift
//  AlaaElrhmanRobustaTask
//
//  Created by AlaaElrhman on 08/04/2023.
//

import Foundation
import UIKit

extension UIViewController{
    func showOKAlert(message:String){
        let alert = UIAlertController(title: message, message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default , handler:{ (UIAlertAction)in
            self.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }
}
