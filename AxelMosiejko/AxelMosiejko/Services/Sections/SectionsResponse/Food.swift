//
//  Food.swift
//  AxelMosiejko
//
//  Created by Axel Mosiejko on 08/11/2022.
//

import Foundation

struct Food: Decodable {
    var detailUrl: String
    var imageUrl: String
    var brand: String
    var title: String
    var tags: String?
    var favoriteCount: Int
    
    private enum CodingKeys: String, CodingKey {
        case detailUrl
        case imageUrl
        case brand
        case title
        case tags
        case favoriteCount
    }
}
