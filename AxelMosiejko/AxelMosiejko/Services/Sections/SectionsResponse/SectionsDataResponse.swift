//
//  SectionsDataResponse.swift
//  AxelMosiejko
//
//  Created by Axel Mosiejko on 08/11/2022.
//

import Foundation

struct SectionsDataResponse : Decodable{
    var data : [Section]
    
    private enum CodingKeys : String, CodingKey{
        case data = "sections"
    }
}
