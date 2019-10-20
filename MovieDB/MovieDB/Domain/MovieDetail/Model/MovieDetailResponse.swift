//
//  MovieDetailResponse.swift
//  MovieDB
//
//  Created by Juan Miguel Marqués Morilla on 20/10/2019.
//  Copyright © 2019 Juan Miguel Marques Morilla. All rights reserved.
//

import Foundation

struct MovieDetailResponse :Codable {
    let budget : Int?
    struct Genres:Codable {
        let id : Int?
        let name : String?
        
        enum CodingKeys: String, CodingKey {
            
            case id = "id"
            case name = "name"
        }
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            name = try values.decodeIfPresent(String.self, forKey: .name)
        }
    }
    let genres : [Genres]?
    let homepage : String?
    let id : Int?
    struct Keywords:Codable {
        let id : Int?
        let name : String?
        
        enum CodingKeys: String, CodingKey {
            
            case id = "id"
            case name = "name"
        }
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            name = try values.decodeIfPresent(String.self, forKey: .name)
        }

    }
    let keywords : [Keywords]?
    let original_language : String?
    let original_title : String?
    let overview : String?
    let popularity : Double?
    struct Production_companies: Codable {
        let id : Int?
        let name : String?
        
        enum CodingKeys: String, CodingKey {
            
            case id = "id"
            case name = "name"
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            name = try values.decodeIfPresent(String.self, forKey: .name)
        }
    }
    
    let production_companies : [Production_companies]?
    struct Production_countries:Codable{
        let iso_3166_1 : String?
        let name : String?
        
        enum CodingKeys: String, CodingKey {
            
            case iso_3166_1 = "iso_3166_1"
            case name = "name"
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            iso_3166_1 = try values.decodeIfPresent(String.self, forKey: .iso_3166_1)
            name = try values.decodeIfPresent(String.self, forKey: .name)
        }
    }
    let production_countries : [Production_countries]?
    let release_date : String?
    let revenue : Int?
    let runtime : Int?
    struct Spoken_languages:Codable {
        let iso_639_1 : String?
        let name : String?
        
        enum CodingKeys: String, CodingKey {
            
            case iso_639_1 = "iso_639_1"
            case name = "name"
        }
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            iso_639_1 = try values.decodeIfPresent(String.self, forKey: .iso_639_1)
            name = try values.decodeIfPresent(String.self, forKey: .name)
        }
    }
    let spoken_languages : [Spoken_languages]?
    let status : String?
    let tagline : String?
    let title : String?
    let vote_average : Double?
    let vote_count : Int?

    enum CodingKeys: String, CodingKey {
        
        case budget = "budget"
        case genres = "genres"
        case homepage = "homepage"
        case id = "id"
        case keywords = "keywords"
        case original_language = "original_language"
        case original_title = "original_title"
        case overview = "overview"
        case popularity = "popularity"
        case production_companies = "production_companies"
        case production_countries = "production_countries"
        case release_date = "release_date"
        case revenue = "revenue"
        case runtime = "runtime"
        case spoken_languages = "spoken_languages"
        case status = "status"
        case tagline = "tagline"
        case title = "title"
        case vote_average = "vote_average"
        case vote_count = "vote_count"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        budget = try values.decodeIfPresent(Int.self, forKey: .budget)
        genres = try values.decodeIfPresent([Genres].self, forKey: .genres)
        homepage = try values.decodeIfPresent(String.self, forKey: .homepage)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        keywords = try values.decodeIfPresent([Keywords].self, forKey: .keywords)
        original_language = try values.decodeIfPresent(String.self, forKey: .original_language)
        original_title = try values.decodeIfPresent(String.self, forKey: .original_title)
        overview = try values.decodeIfPresent(String.self, forKey: .overview)
        popularity = try values.decodeIfPresent(Double.self, forKey: .popularity)
        production_companies = try values.decodeIfPresent([Production_companies].self, forKey: .production_companies)
        production_countries = try values.decodeIfPresent([Production_countries].self, forKey: .production_countries)
        release_date = try values.decodeIfPresent(String.self, forKey: .release_date)
        revenue = try values.decodeIfPresent(Int.self, forKey: .revenue)
        runtime = try values.decodeIfPresent(Int.self, forKey: .runtime)
        spoken_languages = try values.decodeIfPresent([Spoken_languages].self, forKey: .spoken_languages)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        tagline = try values.decodeIfPresent(String.self, forKey: .tagline)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        vote_average = try values.decodeIfPresent(Double.self, forKey: .vote_average)
        vote_count = try values.decodeIfPresent(Int.self, forKey: .vote_count)
    }

}
