//
//  ToDoListViewModel.swift
//  UIProjectsToDo
//
//  Created by batuhan on 4.04.2024.
//

import Foundation
import FirebaseFirestoreSwift

final class ToDoListViewModel : ObservableObject{
    @Published var showingNewItem = false
    @Published var errorMessage   = ""
    @Published var jobs = [Job]()

    
    func getJobs()async{
        do{
//            self.jobs = try await DatabaseManager.shared.jobsQuery
        }catch{
            errorMessage = "Jobs çekilemedi"
        }
    }
    
    func jobIsDone(_ job : Job, isDone:Bool)async{
        do {
           try await DatabaseManager.shared.updateData(job, isDone: isDone)

            
        }catch{
            
        }
    }
    
    
    func deleteJob(_ id : String){
        Task{
            do {
                try await DatabaseManager.shared.deleteDataInDatabase(id)
//                self.jobs = jobsQuery.filter({ $0.id != id })
            }catch {
                errorMessage = "Kayıt silinemiyor."
            }
        }
    }
    
    
    
    
}
