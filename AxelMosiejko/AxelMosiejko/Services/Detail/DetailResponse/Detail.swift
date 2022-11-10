//
//  Detail.swift
//  AxelMosiejko
//
//  Created by Axel Mosiejko on 09/11/2022.
//

import Foundation

struct Detail: Decodable {
    var imageUrl: String
    var brand: String
    var title: String
    var favoriteCount: Int
    var description: String
    var price: String
    var discount: String
    var date: String
    var redemptions: String
    
    
    private enum CodingKeys: String, CodingKey {
        case imageUrl
        case brand
        case title
        case favoriteCount
        case description
        case price
        case discount
        case date
        case redemptions
    }
}
