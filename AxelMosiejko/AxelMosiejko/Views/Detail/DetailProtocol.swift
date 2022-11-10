//
//  DetailProtocol.swift
//  AxelMosiejko
//
//  Created by Axel Mosiejko on 09/11/2022.
//

import Foundation

protocol DetailProtocol {
    var result: Detail { get }
    
    func getDetail(completion: @escaping () -> (), failure: @escaping (String) -> ())
    
}
