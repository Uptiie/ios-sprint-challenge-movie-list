//
//  MoviesTableViewController.swift
//  Movie List
//
//  Created by Uptiie on 7/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class MoviesTableViewController: UITableViewController {
    
    var movies: [Movie] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
        
        var movie = movies[indexPath.row]
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddMovieSegue" {
            if let addMovieVC = segue.destination as? AddMovieViewController {
                addMovieVC.delegate = self
            }
        }
    }
}

extension AddMovieViewController: AddMovieDelegate {
    func movieWasCreated(_ movie: String) {
        movies.append(Movie)
        dismiss(animated: true, completion: nil)
    }

}
