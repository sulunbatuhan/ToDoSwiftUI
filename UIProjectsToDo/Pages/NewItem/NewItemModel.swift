//
//  NewItemModel.swift
//  UIProjectsToDo
//
//  Created by batuhan on 4.04.2024.
//

import Foundation


final class NewItemModel : ObservableObject{
    
    @Published var title        = ""
    @Published var date         = Date()
    @Published var showAlert    = false
    @Published var errorMessage = ""
    
    var canSave : Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {return false}
        guard date >= Date().addingTimeInterval(-86400) else {return false }
        
        return true
    }
    
    func save()async{
        let newJobId = UUID().uuidString
        let newJob   = Job(id: newJobId, title: title, dueDate: date.timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false)
        do{
            try await DatabaseManager.shared.createTodo(todos: newJob)
        }catch{
            showAlert = true
            errorMessage = "Job oluşturulamadı."
        }
    }
    
    
}
