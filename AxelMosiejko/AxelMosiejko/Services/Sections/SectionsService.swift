//
//  SectionsService.swift
//  AxelMosiejko
//
//  Created by Axel Mosiejko on 08/11/2022.
//

import Foundation

final class SectionsService : ApiService {
    
    func getOffers(completion: @escaping ([Section]) -> Void, failure: @escaping (String) -> Void) {
        
        // This is an example of how I will do it if parameters were needed.
        //let params = SectionsApiParameters(sortBy: sortBy)
        //let apiParameters = ApiRequestParameters(parameters: params)
        
        let request = ApiRequest(path: .home, method: .get)
        
        self.request(request, completion: { (response: SectionsDataResponse) in
            completion(response.data)
        }, failure: { error in
            failure(error.message)
        })
    }
    
}
