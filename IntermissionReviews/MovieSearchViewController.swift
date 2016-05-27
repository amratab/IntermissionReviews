//
//  ViewController.swift
//  IntermissionReviews
//
//  Created by Sahil Dhankhar on 23/05/16.
//  Copyright © 2016 Dhankhars. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import AlamofireImage

class MovieSearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var moviesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMoviesStylishFromApi()

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    var movies = [Movie]()
    
    func fetchMoviesStylishFromApi() {
        let URL = "https://api.themoviedb.org/3/discover/movie?primary_release_date.gte=2016-04-23&primary_release_date.lte=2016-05-23&api_key=178cd47fbd418539cfd68a7f573d0dac"
        Alamofire.request(.GET, URL).responseObject { (response: Response<MovieApiResponse, NSError>) in
            
            let movieApiResponse = response.result.value
            
            guard let results = movieApiResponse?.results else {
                print("Could not find any data!")
                return;
            }
            
            for movie in results {
                let thumbImageUrl = MovieApiContants.Constants.ImageBaseURL + MovieApiContants.ImageSizeKeys.Thumbnail + movie.posterPath!
                Alamofire.request(.GET, thumbImageUrl)
                    .responseImage { response in
                        if let image = response.result.value {
                            movie.thumbImage = image
                        }
                        self.movies.append(movie)
                        if(self.movies.count == movieApiResponse?.results?.count) {
                            self.performUIUpdatesOnMain() {
                                self.moviesTableView.reloadData()
                            }
                        }
                }
            }
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        print("selected!!!")
        let movieDetailViewCtlr = self.storyboard?.instantiateViewControllerWithIdentifier("MovieDetailViewController") as! MovieDetailViewController
        movieDetailViewCtlr.movie = movies[indexPath.item]
        navigationController!.pushViewController(movieDetailViewCtlr, animated: true)
    }

    
    func performUIUpdatesOnMain(updates: () -> Void) {
        dispatch_async(dispatch_get_main_queue()) {
            updates()
        }
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let uiTableCell = tableView.dequeueReusableCellWithIdentifier("MovieCell")! as UITableViewCell
        let movie = movies[indexPath.item]
        uiTableCell.textLabel!.text = movie.title
        uiTableCell.detailTextLabel!.text = movie.overview
        uiTableCell.imageView?.image = movie.thumbImage
        return uiTableCell
       
    }
    
    func propertyValues(propertyName: String) -> AnyObject? {
        let path = NSBundle.mainBundle().pathForResource("Properties", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: path!)
        
        let tableData = dict!.objectForKey(propertyName) as! String
        return tableData
    }

}

