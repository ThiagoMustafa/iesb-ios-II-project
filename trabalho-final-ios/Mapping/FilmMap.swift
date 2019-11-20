//
//  FilmMap.swift
//  trabalho-final-ios
//
//  Created by HC2MAC19 on 19/11/2019.
//  Copyright © 2019 Thiago Mustafa. All rights reserved.
//

import Foundation

class FilmMap {
    func map(_ dictionary: [String: Any]) -> Film? {
        guard let id = dictionary["id"] as? Int else { return nil }
        guard let title = dictionary["title"] as? String else { return nil }
        guard let description = dictionary["overview"] as? String else { return nil }
        guard let year = dictionary["release_date"] as? String else { return nil }
        guard let duration = dictionary["runtime"] as? String else { return nil }
        guard let posterImage = dictionary["poster_path"] as? String else { return nil }
        guard let generos = dictionary["genres"] as? String else { return nil }
        guard let rating = dictionary["vote_average"] as? String else { return nil }
        
        
        
        return Film(id: id,
                    Title: title,
                    Description: description,
                    Year: String(year.prefix(5)),
                    Duration: String(Int(duration) ?? 0 / 60),
                    PosterImage: posterImage,
                    Genero:generos,
                    Rating: Decimal(string: rating) ?? 0,
                    Location: nil,
                    SimilarFilms: nil
        )
    }
}
