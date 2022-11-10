//
//  SectionsApiParameters.swift
//  AxelMosiejko
//
//  Created by Axel Mosiejko on 08/11/2022.
//

import Foundation

struct SectionsApiParameters: ApiParametersProtocol {
    
    // This struct is no needed, but I made it as an example of how I will do it if I need to send parameters to the API Call
    
    var sortBy: String?
     
    init(sortBy: String?) {
        self.sortBy = sortBy
    }
    
    func queryParams() -> ApiParameters {
        return ["sort_by": sortBy ?? ""]
    }
}
