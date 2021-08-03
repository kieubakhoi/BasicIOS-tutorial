//
//  Networking.swift
//  BasicIOS-tutorial-Connect-Networking
//
//  Created by Apple on 03/08/2021.
//

import Foundation
import UIKit

final class NetWorking {
    //MARK: singleton
    private static var sharedNetWorking: NetWorking = {
        let netWorking = NetWorking()
        return netWorking
    }()
    class func shared() -> NetWorking {
        return sharedNetWorking
    }
    
    //MARK: init
    init() {
        
    }
    
    //MARK: - request
    func  request(with urlString: String, completion: @escaping (Data?, APIError?) -> Void) {
        guard let url = URL(string: urlString) else {
            let error = APIError.error("URL loi")
            completion(nil, error)
            return
        }
        
        let config = URLSessionConfiguration.ephemeral
        config.waitsForConnectivity = true
        
        let session = URLSession(configuration: config)
        let talk = session.dataTask(with: url) {(data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(nil, APIError.error(error.localizedDescription))
                } else {
                    if let data = data {
                        completion(data, nil)
                    } else {
                        completion(nil, APIError.error("Data format is error"))
                    }
                }
            }
        }
        talk.resume()
    }
    
    //MARK: - downloaded
    func downloadImage(url: String, completion: @escaping (UIImage?) -> Void) {
            guard let url = URL(string: url) else {
                completion(nil)
                return
            }
            let config = URLSessionConfiguration.default
            config.waitsForConnectivity = true
            let session = URLSession(configuration: config)
            let task = session.dataTask(with: url) { (data, response, error) in
                DispatchQueue.main.async {
                    if let _ = error {
                        completion(nil)
                    } else {
                        if let data = data {
                            let image = UIImage(data: data)
                            completion(image)
                        } else {
                            completion(nil)
                        }
                    }
                }
            }
            task.resume()
        }
    
    
}
