//
//  VideoModel.swift
//  Africa
//
//  Created by Matteo Buompastore on 26/07/23.
//

import Foundation

struct Video : Codable, Identifiable {
    let id : String
    let name : String
    let headline : String
    
    //Computed Propety
    var thumbnail : String {
        "video-\(id)"
    }
    
}
