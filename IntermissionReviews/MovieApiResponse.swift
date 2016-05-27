//
//  MovieApiResponse.swift
//  IntermissionReviews
//
//  Created by Sahil Dhankhar on 24/05/16.
//  Copyright © 2016 Dhankhars. All rights reserved.
//

import Foundation
import ObjectMapper

class MovieApiResponse: Mappable {
    var page: Int?
    var results: [Movie]?
    var totalResults: Int?
    var totalPages: Int?
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        page <- map[MovieApiContants.JSONResponseKeys.CurrentPage]
        totalPages <- map[MovieApiContants.JSONResponseKeys.TotalPages]
        results <- map[MovieApiContants.JSONResponseKeys.Results]
        totalResults <- map[MovieApiContants.JSONResponseKeys.TotalResults]
    }
    
}
