//
//  DetailViewModel.swift
//  AxelMosiejko
//
//  Created by Axel Mosiejko on 09/11/2022.
//

import Foundation

class DetailViewModel {
    var _result: Detail?
    var service: DetailService
    
    init(service: DetailService = DetailService()) {
        self.service = service
    }
}

extension DetailViewModel: DetailProtocol {
    
    var result: Detail {
        return _result! // Force unwrap because loading local json will never  be nil
    }
    
    func getDetail(completion: @escaping () -> (), failure: @escaping (String) -> ()) {
        service.getMockDetail() { [weak self] data in
            self?._result = data
            completion()
        } failure: { error in
            failure(error)
        }
    }    
}
