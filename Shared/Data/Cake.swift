//
//  Cake.swift
//  Cake List
//
//  Created by Dave on 14/03/2022.
//

import Foundation

class Cake: Identifiable, Encodable, Decodable {
    var id = UUID().uuidString
    var title = ""
    var desc = ""
    var image = ""
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case desc
        case image
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: CodingKeys.id)
        try container.encode(title, forKey: CodingKeys.title)
        try container.encode(desc, forKey: CodingKeys.desc)
        try container.encode(image, forKey: CodingKeys.image)
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(String.self, forKey: .id)
        title = try values.decode(String.self, forKey: .title)
        desc = try values.decode(String.self, forKey: .desc)
        image = try values.decode(String.self, forKey: .image)
    }
    
    init() {
        
    }
}

var cake1: Cake {
    let cake = Cake()
    
    cake.title = "Lemon Cheesecake"
    cake.desc = "A cheesecake made of lemon"
    cake.image = "https://s3-eu-west-1.amazonaws.com/s3.mediafileserver.co.uk/carnation/WebFiles/RecipeImages/lemoncheesecake_lg.jpg"
    
    return cake
}

var cake2: Cake {
    let cake = Cake()
    
    cake.title = "Victoria Sponge"
    cake.desc = "Sponge with jam"
    cake.image = "http://www.bbcgoodfood.com/sites/bbcgoodfood.com/files/recipe_images/recipe-image-legacy-id--1001468_10.jpg"
    
    return cake
}

var cake3: Cake {
    let cake = Cake()
    
    cake.title = "Carrot cake"
    cake.desc = "Bugs bunnys favourite"
    cake.image = "http://www.villageinn.com/i/pies/profile/carrotcake_main1.jpg"
    
    return cake
}
