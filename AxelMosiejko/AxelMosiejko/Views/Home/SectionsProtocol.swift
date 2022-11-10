//
//  SectionsProtocol.swift
//  AxelMosiejko
//
//  Created by Axel Mosiejko on 09/11/2022.
//

import Foundation

protocol SectionsProtocol {
    var sections: [Section] { get }
    
    func getOffers(completion: @escaping () -> (), failure: @escaping (String) -> ())
    
}
