//
//  NewItemView.swift
//  UIProjectsToDo
//
//  Created by batuhan on 4.04.2024.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var viewModel = NewItemModel()
    @Binding var showedNewItem : Bool
    
    var body: some View {
        VStack {
            Text("New Job")
                .bold()
                .font(.system(size: 30))
                
            
            Form {
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                DatePicker("Date", selection: $viewModel.date)
                    .datePickerStyle(.graphical)
                ButtonView(title: "Save", color: .orange) {
                    if viewModel.canSave{
                        Task{
                            await viewModel.save()
                        }
                        showedNewItem = false 
                    }else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert("Error", isPresented: $viewModel.showAlert) {
                
            }
            
        }.offset(y:20)
    }
}

#Preview {
    NewItemView(showedNewItem: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
