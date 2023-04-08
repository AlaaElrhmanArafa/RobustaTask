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
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.center = self.center
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
        DispatchQueue.global().async {
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {
                    print("error in downloading image:\(error?.localizedDescription ?? "")")
                    return
                }
                print(response?.suggestedFilename ?? url.lastPathComponent)
                complete(data)
            }.resume()
        }
    }
}
