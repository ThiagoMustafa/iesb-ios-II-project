//
//  Film.swift
//  trabalho-final-ios
//
//  Created by Ebenézer de Souza e Silva_Corretora BRB on 12/08/19.
//  Copyright © 2019 Thiago Mustafa. All rights reserved.
//

import Foundation

struct Film : Codable {
    let Title: String
    let Description: String
    let Year: String
    let Duration: String
    let PosterImage: String
    let Genero: String
    let Rating: Decimal
    let Location: Location
    let SimilarFilms: [SimilarFilm]
}

struct SimilarFilm: Codable {
    let PosterImage: String
    let Title: String
}

struct Location: Codable {
    let Latitude: Decimal
    let Longitude: Decimal
    let Description: String
}

