//
//  DetailService.swift
//  AxelMosiejko
//
//  Created by Axel Mosiejko on 09/11/2022.
//

import Foundation

final class DetailService : ApiService {
    
    func getMockDetail(completion: @escaping (Detail) -> Void, failure: @escaping (String) -> Void) {
        
        if let url = Bundle.main.url(forResource: "detail", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(DetailDataResponse.self, from: data)
                completion(jsonData.data)
            } catch {
                failure("Error loading detail.json")
            }
        }
    }
    
    // This function is to be used in the future when the detail service is available.
    
    func getDetail(completion: @escaping (Detail) -> Void, failure: @escaping (String) -> Void) {
        
        let request = ApiRequest(path: .detail, method: .get)
        
        self.request(request, completion: { (response: DetailDataResponse) in
            completion(response.data)
        }, failure: { error in
            failure(error.message)
        })
    }
}
