//
//  Film.swift
//  trabalho-final-ios
//
//  Created by Ebenézer de Souza e Silva_Corretora BRB on 12/08/19.
//  Copyright © 2019 Thiago Mustafa. All rights reserved.
//

import Foundation

struct Film {
    let id: Int
    let Title: String
    let Description: String
    let Year: String
    let Duration: String
    let PosterImage: String
    let Genero: String
    let Rating: Decimal
    let Location: Location?
    let SimilarFilms: [SimilarFilm]?
}

struct SimilarFilm {
    let PosterImage: String
    let Title: String
}

struct Location {
    let Latitude: Decimal
    let Longitude: Decimal
    let Description: String
}

