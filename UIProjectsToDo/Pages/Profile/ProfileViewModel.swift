//
//  ProfileViewModel.swift
//  UIProjectsToDo
//
//  Created by batuhan on 16.04.2024.
//

import Foundation

class ProfileViewModel : ObservableObject {
    
    @Published var errorMessage : String = ""
    @Published var onError      : Bool   = false
    @Published var user         : User?
    
    func getUserDatas()async{
        do{
            self.user = try await DatabaseManager.shared.getUserDocuments()
        }catch{
            errorMessage = "Kullanıcı bilgileri getirilemiyor"
        }
    }
    
    func signOut(){
        do {
            try AuthManager.shared.signOut()
            onError = false
        }catch{
            onError = true
            errorMessage = "Çıkış yapılamıyor"
        }
    }
    
    func resetPassword(password:String)async{
        do {
            try await AuthManager.shared.updatePassword(password)
        }catch{
            onError = true
            errorMessage = "Şifre değiştirilemiyor."
        }
       
    }
    
    func deleteAccount()async{
        do {
            try await AuthManager.shared.deleteAccount()
        }catch{
            onError = true
            errorMessage = "Hesap silinemiyor."
        }
        
    }
}
