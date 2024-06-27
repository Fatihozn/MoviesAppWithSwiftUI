//
//  CastResult.swift
//  MoviesApp
//
//  Created by Fatih Özen on 25.06.2024.
//

import Foundation

struct Cast: Decodable {
    var cast: [CastResult]?
}

struct CastResult: Decodable, Identifiable, Hashable {
    var id: Int?
    var name: String?
    var birthday: String?
    var placeOfBirth: String?
    var gender: Int?
    var character: String?
    var profilePath: String?
    var biography: String?
    var departmant: String?
    var alsoKnownAs: [String]?
    
    enum CodingKeys: String, CodingKey{
        case id
        case name
        case birthday
        case placeOfBirth = "place_of_birth"
        case character
        case profilePath = "profile_path"
        case biography
        case departmant = "known_for_department"
        case alsoKnownAs = "also_known_as"
        case gender
    }
    
    var _id: Int {
        id ?? .zero
    }
    var _name: String {
        name ?? ""
    }
    var _birthday: String {
        birthday ?? "birthday is unknown"
    }
    var _placeOfBirth: String {
        placeOfBirth ?? "place of birth is unknown"
    }
    var _character: String {
        character ?? ""
    }
    var _profilePath: String {
        profilePath ?? ""
    }
    var _biography: String {
        biography ?? "There is no biography"
    }
    var _departmant: String {
        departmant ?? "departmant is unknown"
    }
    var _alsoKnownAs: [String] {
        alsoKnownAs ?? []
    }
    var _gender: Int {
        gender ?? 0
    }
}

struct CastMovie: Decodable {
    var cast: [MovieResult]?
}

struct CastTV: Decodable {
    var cast: [TVResult]?
}
//struct CastCredits: Decodable {
//    var id: Int?
//    var posterPath: String?
//
//    enum CodingKeys: String, CodingKey{
//        case id
//        case posterPath = "poster_path"
//    }
//
//    var _id: Int {
//        id ?? .zero
//    }
//    var _posterPath: String {
//        posterPath ?? ""
//    }
//}

