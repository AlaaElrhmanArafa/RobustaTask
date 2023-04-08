//
//  UIImageView+Ext.swift
//  AlaaElrhmanRobustaTask
//
//  Created by AlaaElrhman on 08/04/2023.
//

import Foundation
import UIKit

extension UIImageView{
    func downloadImage(from url: URL) {
        var activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        self.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        getImageData(url: url) { [weak self] data in
            DispatchQueue.main.async {
                activityIndicator.stopAnimating()
                guard let data = data else { return }
                self?.image = UIImage(data: data)
            }
        }
    }
    
    private func getImageData(url: URL, complete: @escaping (_ data: Data?) -> Void){
        let request = URLRequest(url: url)
        DispatchQueue.global().async {
            URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else { return }
                print(response?.suggestedFilename ?? url.lastPathComponent)
                complete(data)
            }
        }
    }
}
