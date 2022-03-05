//
//  Model.swift
//  ParsingAPI
//
//  Created by Егор Куракин on 02.03.2022.
//

import Foundation
struct Lesson : Decodable{
    let id : Int
    let name : String
    let date : Date
    let image : String?
    let link : String
    let comments : [Comment]?
    enum CodingKyes : String , CodingKey {
        case id, name, date,link, comments
        case imageLesson = "image"
    }
}
struct Comment : Decodable{
    let id : Int
    let user : User
    let text : String
    let date : Date
}
struct User : Decodable{
    let id : Int
    let name : String
    let gender : Gender
}
enum Gender : String, Decodable{
    case male
    case female
}
