//
//  ProfileView.swift
//  UIProjectsToDo
//
//  Created by batuhan on 29.03.2024.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewModel()
  
    
    var body: some View {
        List{
            Section{
                HStack{
                    Text("BS")
                        .fontWeight(.heavy)
                        .frame(width: 72,height: 72)
                        .background(Color(.systemGray6))
                        .clipShape(.circle)
                    
                    VStack(alignment:.leading,spacing: 4){
                        Text("\(viewModel.user?.name ?? "")")
                            .fontWeight(.heavy)
                           
                        
                        Text("\(String(describing: viewModel.user?.email ?? ""))")
                            .font(.footnote)
                            .foregroundStyle(.red)
                            
                    } .padding(.top,4)
                }
            }
            
            Section{
                
            }
            
            Section("Account"){
                SettingsCellView(title: "Sign Out", imageName: "rectangle.portrait.and.arrow.right", tintColor: .red){
                    viewModel.signOut()
                    if !viewModel.onError{
                        
                    }
                }
                SettingsCellView(title: "Delete Account", imageName: "xmark", tintColor: .red){
                 
                }
                
            
                
            }.alert(viewModel.errorMessage, isPresented: $viewModel.onError) {
               
            }
        }
        .onAppear(){
            Task{
                await viewModel.getUserDatas()
            }
        }
    }
}

#Preview {
    ProfileView()
}
