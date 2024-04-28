//
//  ListJobView.swift
//  UIProjectsToDo
//
//  Created by batuhan on 7.04.2024.
//

import SwiftUI

struct ListJobView: View {
    let job    : Job
    let action : ()->Void
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(job.title)
                    .font(.title)
                Text("\(Date(timeIntervalSince1970: job.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundStyle(Color.secondary)
            }
            Spacer()
            Button(action: {
                action()
            }, label: {
                Image(systemName: job.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle(job.isDone ? .green : .red)
            })
            
        }.padding()
    }
}

#Preview {
    ListJobView(job: Job(id: "1", title: "Yukseklisans", dueDate: 212323, createdDate: 123232, isDone: true)) {
        
    }
}
