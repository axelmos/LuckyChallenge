//
//  Section.swift
//  AxelMosiejko
//
//  Created by Axel Mosiejko on 08/11/2022.
//

import Foundation

struct Section: Decodable {
    var title: String
    var items: [Food]
    
    private enum CodingKeys: String, CodingKey {
        case title
        case items
    }
}
