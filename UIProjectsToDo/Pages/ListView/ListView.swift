//
//  ListView.swift
//  UIProjectsToDo
//
//  Created by batuhan on 29.03.2024.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ListView: View {
    
    @StateObject var viewModel = ToDoListViewModel()
    
    
    @FirestoreQuery var jobsQuery : [Job]
    
    init() {
        self._jobsQuery = FirestoreQuery(collectionPath: "/Users/\(AuthUser.currentUser())/Jobs")
    }
    
    var body: some View{
        NavigationStack{
            VStack{
                List(jobsQuery){ job in
                    ListJobView(job: job) {
                        Task{
                            await viewModel.jobIsDone(job, isDone: job.isDone ? false : true)
                            
                        }
                    }.swipeActions(){
                        Button(action: {
                            viewModel.deleteJob(job.id)
                        }, label: {
                            Image(systemName: "trash")
                                .tint(.red)
                        })
                    }
                    
                }
                .listStyle(.plain)
            }
            .navigationTitle("To Do list")
            .toolbar{
                Button(action: {
                    viewModel.showingNewItem = true
                }, label: {
                    Image(systemName: "plus")
                        .bold()
                        .foregroundStyle(.black)
                })
            }
            .sheet(isPresented: $viewModel.showingNewItem, content: {
                NewItemView(showedNewItem: $viewModel.showingNewItem)
                
            })
        }
        .onAppear(){
            Task{
                await viewModel.getJobs()
            }
        }
    }
}



#Preview {
    ListView()
}
