//
//  DatabaseManager.swift
//  UIProjectsToDo
//
//  Created by batuhan on 29.03.2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import SwiftUI

enum ErrorType : Error {
    case authError
    case fetchError
}

final class DatabaseManager {
    
    static  let shared          = DatabaseManager()
    private let collectionUsers = Firestore.firestore().collection("Users")
    @Published var jobs         = [Job]()
//    @FirestoreQuery var jobsQuery : [Job]
    
    init() {
//        self._jobsQuery = FirestoreQuery(collectionPath: "/Users\(AuthUser.currentUser())/Jobs")
    }
    
    private func userDocuments(_ userid : String) -> DocumentReference {
        collectionUsers.document(userid)
    }
    
    func insertUser(withEmail email : String,password : String)async throws{
        let authResult   = try await AuthManager.shared.createNewUser(withEmail: email, password: password)
        let userID       = authResult.user.uid
        let user         = User(id: userID, email: email, name: "", password: password)
        try await userDocuments(userID).setData(user.asDictionary())
    }
    
    func createTodo(todos : Job)async throws{
        try await userDocuments(AuthUser.currentUser()).collection("Jobs").document(todos.id).setData(todos.asDictionary())
    }
    
    func getUserDocuments()async throws -> User{
        let documentSnapshot = try await userDocuments(AuthUser.currentUser()).getDocument()
        guard let data = documentSnapshot.data() else {throw ErrorType.fetchError }
        return User(data: data)
    }
    
    func fetchUserJobs()async throws->[Job]{
        var jobs         = [Job]()
        let querySnapshot = try await userDocuments(AuthUser.currentUser()).collection("Jobs").getDocuments()
        for documents in querySnapshot.documents {
            let job = Job(data: documents.data())
            print(job)
            jobs.append(job)
        }
        return jobs
    }
    
    func deleteDataInDatabase(_ jobId : String)async throws{
        try await userDocuments(AuthUser.currentUser()).collection("Jobs").document(jobId).delete()
    }
    
    func updateData(_ job : Job, isDone : Bool) async throws{
        let data : [String:Any] = ["isDone":isDone]
        try await userDocuments(AuthUser.currentUser()).collection("Jobs").document(job.id).updateData(data)
    }
}

final class AuthUser{
    static func currentUser()->String{
        guard let currentUser = Auth.auth().currentUser?.uid else {return ""}
        return currentUser
    }
}

