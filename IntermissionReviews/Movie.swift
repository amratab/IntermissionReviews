//
//  Movie.swift
//  IntermissionReviews
//
//  Created by Sahil Dhankhar on 23/05/16.
//  Copyright © 2016 Dhankhars. All rights reserved.
//

import Foundation
import ObjectMapper

class Movie: Mappable {
    var posterPath: String?
    var adult: Bool?
    var overview: String?
    var releaseDate: NSDate?
    var id: IntMax?
    var originalTitle: String?
    var originalLang: String?
    var title: String?
    var backdropPath: String?
    var popularity: Float?
    var voteCount: Int?
    var video: Bool?
    var voteAvg: Float?
    var genreIds: [Int]?
    var thumbImage: UIImage?
    var posterImage: UIImage?
    
    required init?(_ map: Map){
        
    }
    
    
    
    func mapping(map: Map) {
        posterPath <- map[MovieApiContants.JSONResponseKeys.MoviePosterPath]
        id <- map[MovieApiContants.JSONResponseKeys.MovieID]
        title <- map[MovieApiContants.JSONResponseKeys.MovieTitle]
        adult <- map[MovieApiContants.JSONResponseKeys.MovieAdult]
        overview <- map[MovieApiContants.JSONResponseKeys.MovieOverview]
        releaseDate <- map[MovieApiContants.JSONResponseKeys.MovieReleaseDate]
        originalTitle <- map[MovieApiContants.JSONResponseKeys.MovieOriginalTitle]
        originalLang <- map[MovieApiContants.JSONResponseKeys.MovieOriginalLang]
        backdropPath <- map[MovieApiContants.JSONResponseKeys.MovieBackdropPath]
        popularity <- map[MovieApiContants.JSONResponseKeys.MoviePopularity]
        voteCount <- map[MovieApiContants.JSONResponseKeys.MovieVoteCount]
        voteAvg <- map[MovieApiContants.JSONResponseKeys.MovieVoteAvg]
        video <- map[MovieApiContants.JSONResponseKeys.MovieVideo]
        genreIds <- map[MovieApiContants.JSONResponseKeys.MovieGenreIds]
        
    }
}
