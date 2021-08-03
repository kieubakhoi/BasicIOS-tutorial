//
//  Music.swift
//  BasicIOS-tutorial-Connect-Networking
//
//  Created by Apple on 03/08/2021.
//

import Foundation
import UIKit

final class Music {
    var id: String
    var artistName: String
    var releaseDate: String
    var name: String
    var artworkUrl100: String
    var thumbnaiImage: UIImage?
    
    init(json: JSON) {
        self.id = json["id"] as! String
        self.artistName = json["artistName"] as! String
        self.releaseDate = "" // json["releaseDate"] as! String
        self.name = json["name"] as! String
        self.artworkUrl100 = json["artworkUrl100"] as! String
    }
}
//enum APIError {       move in API
//    case error(String)
//    case errorUrl
//
//    var localizedDescription: String {
//        switch self {
//        case .error(let string):
//            return string
//        case .errorUrl:
//            return "URl String is error"
//        }
//    }
//}
