//
//  Result.swift
//  H4XOR News
//
//  Created by Abdeljaouad Mezrari on 12/03/2023.
//  Copyright © 2023 Abdeljaouad Mezrari. All rights reserved.
//

import Foundation

struct Result: Decodable{
    let hits: [Post]
}

struct Post: Decodable, Identifiable{
    
    var id: String{
        return objectID
    }
    let objectID: String
    let title: String
    let points: Int
    let url: String?

}
