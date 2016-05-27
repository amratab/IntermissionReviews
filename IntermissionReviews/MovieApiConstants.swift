//
//  MovieApiConstants.swift
//  IntermissionReviews
//
//  Created by Sahil Dhankhar on 24/05/16.
//  Copyright © 2016 Dhankhars. All rights reserved.
//

import Foundation

struct MovieApiContants {
    
    // MARK: Constants
    struct Constants {
        
        // MARK: API Key
        static let ApiKey : String = "4e8bdccc3bb63cefbec21f936eca5651"
        
        // MARK: URLs
        static let ApiScheme = "https"
        static let ApiHost = "api.themoviedb.org"
        static let ApiPath = "/3"
        static let AuthorizationURL : String = "https://www.themoviedb.org/authenticate/"
        static let ImageBaseURL: String = "https://image.tmdb.org/t/p/"
    }
    
    // MARK: Methods
    struct Methods {
        
        // MARK: Account
        static let Account = "/account"
        static let AccountIDFavoriteMovies = "/account/{id}/favorite/movies"
        static let AccountIDFavorite = "/account/{id}/favorite"
        static let AccountIDWatchlistMovies = "/account/{id}/watchlist/movies"
        static let AccountIDWatchlist = "/account/{id}/watchlist"
        
        // MARK: Authentication
        static let AuthenticationTokenNew = "/authentication/token/new"
        static let AuthenticationSessionNew = "/authentication/session/new"
        
        // MARK: Search
        static let SearchMovie = "/search/movie"
        
        // MARK: Config
        static let Config = "/configuration"
        
    }
    
    // MARK: URL Keys
    struct URLKeys {
        static let UserID = "id"
    }
    
    // MARK: Parameter Keys
    struct ParameterKeys {
        static let ApiKey = "api_key"
        static let SessionID = "session_id"
        static let RequestToken = "request_token"
        static let Query = "query"
    }
    
    // MARK: JSON Body Keys
    struct JSONBodyKeys {
        static let MediaType = "media_type"
        static let MediaID = "media_id"
        static let Favorite = "favorite"
        static let Watchlist = "watchlist"
    }
    
    struct ImageSizeKeys {
        static let Thumbnail = "w92"
        static let Poster = "w300"
    }
    
    // MARK: JSON Response Keys
    struct JSONResponseKeys {
        // MARK: Response
        static let CurrentPage = "page"
        static let TotalResults = "total_results"
        static let Results = "results"
        static let TotalPages = "total_pages"
        // MARK: General
        static let StatusMessage = "status_message"
        static let StatusCode = "status_code"
        
        // MARK: Authorization
        static let RequestToken = "request_token"
        static let SessionID = "session_id"
        
        // MARK: Account
        static let UserID = "id"
        
        // MARK: Config
        static let ConfigBaseImageURL = "base_url"
        static let ConfigSecureBaseImageURL = "secure_base_url"
        static let ConfigImages = "images"
        static let ConfigPosterSizes = "poster_sizes"
        static let ConfigProfileSizes = "profile_sizes"
        
        // MARK: Movies
        static let MovieID = "id"
        static let MovieTitle = "title"
        static let MoviePosterPath = "poster_path"
        static let MovieReleaseDate = "release_date"
        static let MovieReleaseYear = "release_year"
        static let MovieAdult = "adult"
        static let MovieOverview = "overview"
        static let MovieGenreIds = "genre_ids"
        static let MovieOriginalTitle = "original_title"
        static let MovieOriginalLang = "original_language"
        static let MovieBackdropPath = "backdrop_path"
        static let MoviePopularity = "popularity"
        static let MovieVoteCount = "vote_count"
        static let MovieVideo = "video"
        static let MovieVoteAvg = "vote_average"
    
    }
    
    // MARK: Poster Sizes
//    struct PosterSizes {
//        static let RowPoster = TMDBClient.sharedInstance().config.posterSizes[2]
//        static let DetailPoster = TMDBClient.sharedInstance().config.posterSizes[4]
//    }
}