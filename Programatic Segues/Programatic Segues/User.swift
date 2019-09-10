//
//  User.swift
//  Programatic Segues
//
//  Created by L Daniel De San Pedro on 9/10/19.
//  Copyright © 2019 L Daniel De San Pedro. All rights reserved.
//

import Foundation

enum Gender {
    case Male
    case Female
    case other
}

struct User {
    
    static var currentUser : User!
    
    var name: String
    var password : String
    var email: String!
    var age : Int!
    var birthday : String!
    var gender : Gender!
    var weight : Double!
    var height : Double!
    var isSingle : Bool!
    
    init (name: String, password: String){
        self.name = name
        self.password = password
    }
}
