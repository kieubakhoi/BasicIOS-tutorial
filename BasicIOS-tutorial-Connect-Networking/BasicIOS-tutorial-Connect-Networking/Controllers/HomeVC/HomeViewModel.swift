//
//  HomeViewModel.swift
//  BasicIOS-tutorial-Connect-Networking
//
//  Created by Apple on 03/08/2021.
//

import Foundation

typealias Completion = (Bool, String) -> Void

class HomeViewModel {
    var names: [String] = []
    var musics: [Music] = []
    
    func loadAPI (completion: @escaping Completion) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/itunes-music/hot-tracks/all/100/explicit.json"
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        let config = URLSessionConfiguration.ephemeral
        config.waitsForConnectivity = true
        let session = URLSession(configuration: config)
        let talk = session.dataTask(with: request) {    (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print("API- that bai")
                    // callback
                    completion(false, error.localizedDescription)
                } else {
                    print("API- thanh cong")
                    if let data = data {
                        let json = data.toJSON()
                        let feed = json["feed"] as! JSON
                        let results = feed["results"] as! [JSON]
                        
                        // using loop
                        for item in results {
                            let name = item["name"] as! String
                            self.names.append(name)
                        }
                        
                        // call back
                        completion(true, "load data done")
                        print("Load data done \(self.names.count)")
                    } else {
                        // call bacl
                        completion(false, "Data format is error .")
                    }
                }
            }
            
        }
        talk.resume()
        print("Done")
    }
    func loadAPI2(completion : @escaping Completion) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/itunes-music/hot-tracks/all/100/explicit.json"
        NetWorking.shared().request(with: urlString)  { (data, error) in
            if let error = error {
                completion(false, error.localizedDescription)
            } else {
                if let data = data {
                    let json = data.toJSON()
                    let feed = json["feed"] as! JSON
                    let results = feed["results"] as! [JSON]
                    
                    // using loop
                    for item in results {
                        let music  = Music(json: item)
                        self.musics.append(music)
                        completion(true, "")
                        }
                    } else {
                        completion(false, "Data format is error")
                }
            }
        }
    }
    func loadAPI3(completion: @escaping Completion) {
        APIManager.Music.getHotMusic() { (result) in
            switch result {
            case .failure(let error):
                //call back
                
                completion(false, error.localizedDescription)

            case .success(let musicResult):
                self.musics.append(contentsOf: musicResult.musics)
                
                //call back
                completion(true, "")
            }
        }
    }
}
