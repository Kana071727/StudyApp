//
//  TodoList.swift
//  StudyApp
//
//  Created by 清水　佳奈音 on 2023/08/02.
//

import SwiftUI

struct TodoList: View {
    @EnvironmentObject var tabenvironment: TabEnvironment
    var body: some View {
        VStack{
            Button(){
                
            } label: {
                Image(systemName: "plus")
                    .aspectRatio(contentMode: .fill)
                    .foregroundColor(.white)
                    .background(Circle()
                        .frame(width: 30,height: 30)
                        .foregroundStyle(Color.cyan.gradient))
            }
            Spacer()
            ScrollView(){
                LazyVGrid(columns: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Columns@*/[GridItem(.fixed(200))]/*@END_MENU_TOKEN@*/) {
                    
                    TodoItem()
                    TodoItem()
                    }
                }
            Button(){
                tabenvironment.tabname = "Home"
                tabenvironment.tabnumber = 0
                tabenvironment.tabPresent = true
            } label: {
                Text("To Home")
            }
            Spacer()
            
        }
        
    }
}

struct TodoList_Previews: PreviewProvider {
    static var previews: some View {
        TodoList()
    }
}
