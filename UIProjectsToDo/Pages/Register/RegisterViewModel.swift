//
//  RegisterViewModel.swift
//  UIProjectsToDo
//
//  Created by batuhan on 1.04.2024.
//

import Foundation
final class RegisterViewModel : ObservableObject {
    
    @Published var email        = ""
    @Published var password     = ""
    @Published var errorMessage = ""
    @Published var onError      = false
    
    
    func isCorrect(){
        guard !email.isEmpty && email.contains(".") && email.contains("@") && !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
                !password.isEmpty && password.count >= 6
        else {
            errorMessage = "Email ve/veya şifreyi eksik ve/veya yanlış girdiniz."
            onError = true
            return
        }
        
        onError = false
        errorMessage = ""
        createUser()
    }

    func createUser(){
        Task{
            do{
                try await DatabaseManager.shared.insertUser(withEmail: email, password: password)
            }catch{
                errorMessage = "Kullanıcı oluşturulamıyor"
            }
        }
    }
}
