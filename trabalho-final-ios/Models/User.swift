import Foundation

struct User : Codable {
    let UserName: String
    let ImageProfile: String
    let FavoriteFilms: [Film]
}
