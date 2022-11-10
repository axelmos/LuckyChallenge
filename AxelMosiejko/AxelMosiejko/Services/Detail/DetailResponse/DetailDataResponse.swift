//
//  DetailDataResponse.swift
//  AxelMosiejko
//
//  Created by Axel Mosiejko on 09/11/2022.
//

import Foundation

struct DetailDataResponse : Decodable{
    var data : Detail
    
    private enum CodingKeys : String, CodingKey{
        case data = "result"
    }
}
