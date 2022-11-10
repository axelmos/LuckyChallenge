//
//  SectionsViewModel.swift
//  AxelMosiejko
//
//  Created by Axel Mosiejko on 09/11/2022.
//

import Foundation

class SectionsViewModel {
    var _sections: [Section]?
    var service: SectionsService
    
    init(service: SectionsService = SectionsService()) {
        self.service = service
    }
}

extension SectionsViewModel: SectionsProtocol {
    var sections: [Section] {
        return _sections ?? []
    }
    
    func getOffers(completion: @escaping () -> (), failure: @escaping (String) -> ()) {
        service.getOffers() { [weak self] data in
            self?._sections = data
            completion()
        } failure: { error in
            failure(error)
        }
    }
    
}
