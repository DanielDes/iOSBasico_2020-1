//
//  Profile.swift
//  Agenda
//
//  Created by L Daniel De San Pedro on 9/18/19.
//  Copyright © 2019 L Daniel De San Pedro. All rights reserved.
//

import Foundation

struct Profile{
    var name : String
    var nickName : String
    var bio : String!
    var image : URL!
    var birthday : String
    
    init(name:String, nickName:String, birthday: String) {
        self.name = name
        self.nickName = nickName
        self.birthday = birthday
    }
}
