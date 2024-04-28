//
//  DoModel.swift
//  UIProjectsToDo
//
//  Created by batuhan on 6.04.2024.
//

import Foundation

struct Job          : Codable ,Identifiable{
  
    let id          : String
    let title       : String
    let dueDate     : TimeInterval
    let createdDate : TimeInterval
    var isDone      : Bool
    
    mutating func setDone(_ status : Bool){
        isDone = status
    }
    
    mutating func setDone()->Job{
        return Job(id: id, title: title, dueDate: dueDate, createdDate: createdDate, isDone: !isDone)
    }
    
    init(id:String,title:String,dueDate:TimeInterval,createdDate:TimeInterval,isDone:Bool){
        self.id = id
        self.title = title
        self.dueDate = dueDate
        self.createdDate = createdDate
        self.isDone = isDone
    }
    
    init(data:[String:Any]){
        self.id       =  data["id"] as? String ?? ""
        self.title    = data["title"] as? String ?? ""
        self.isDone = data["isDone"] as? Bool ?? false
        self.dueDate = data["dueDate"] as? TimeInterval ?? 0
        self.createdDate = data["createdDate"] as? TimeInterval ?? 0
    }
}
