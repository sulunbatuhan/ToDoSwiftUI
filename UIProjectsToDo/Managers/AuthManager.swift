//
//  AuthManager.swift
//  UIProjectsToDo
//
//  Created by batuhan on 29.03.2024.
//

import Foundation
import Firebase

final class AuthManager {
    
    static let shared = AuthManager()
    private let collectionUsers = Firestore.firestore().collection("Users")
    
    
    private func userDocuments(_ userID : String)->DocumentReference{
        collectionUsers.document(userID)
    }
    
   
    
     var isSignedIn : Bool {
        return Auth.auth().currentUser != nil
    }
    
  
    
    func signIn(withEmail email : String,password : String) async throws {
        try await Auth.auth().signIn(withEmail: email, password: password)
    }
    
    func createNewUser(withEmail email : String,password : String) async throws ->AuthDataResult{
        return try await Auth.auth().createUser(withEmail: email, password: password)
    }
    
    func signOut() throws{
        try Auth.auth().signOut()
     
    }
    
    func deleteAccount()async throws{
        if let currentUser = Auth.auth().currentUser{
           try await currentUser.delete()
        }
    }
    
    func updatePassword(_ password : String)async throws{
       try await Auth.auth().currentUser?.updatePassword(to: password)
    }
    
    func sendEmailForResetPassword(withEmail email : String)async throws{
        try await Auth.auth().sendPasswordReset(withEmail: email)
    }
    
    
    
    
}


