//
//  User.swift
//  UIProjectsToDo
//
//  Created by batuhan on 4.04.2024.
//

import Foundation

struct User:Codable {
    let id       : String
    let email    : String
    let name     : String
    let password : String
    
    init(id : String,email : String,name : String,password:String) {
        self.id       = id
        self.email    = email
        self.name     = name
        self.password = password
    }
    
    init(data : [String:Any]) {
        self.id       =  data["id"] as? String ?? ""
        self.email    = data["email"] as? String ?? ""
        self.name     = data["name"] as? String ?? ""
        self.password = data["password"] as? String ?? ""
    }
    
  
}
