//
//  workbookList.swift
//  StudyApp
//
//  Created by 清水　佳奈音 on 2023/07/05.
//

import SwiftUI


@available(iOS 17.0, *)
struct WorkbookHome: View {
    @State var addquestion: Bool = false
    var body: some View {
        VStack{
            ScrollView(.vertical){
                VStack{
                    HStack {
                        Button{
                            addquestion.toggle()
                        }label:{
                            Text("問題を登録")
                                .foregroundColor(Color.white)
                            
                        }
                        .sheet(isPresented: $addquestion){
                            workbookaddview()
                        }
                        .frame(
                            width: UIScreen.main.bounds.size.width * 0.45,
                            height: UIScreen.main.bounds.size.width * 0.15
                        )
                        .background(RoundedRectangle(cornerRadius: 15))
                        .foregroundStyle(Color.yellow.gradient)
                        Button{
                            
                        }label:{
                            Text("問題集を登録")
                                .foregroundColor(Color.white)
                        }
                        .frame(
                            width: UIScreen.main.bounds.size.width * 0.45,
                            height: UIScreen.main.bounds.size.width * 0.15
                        )
                        .background(RoundedRectangle(cornerRadius: 15))
                        .foregroundStyle(Color.yellow.gradient)
                    }
                    
                    VStack(alignment:.leading){
                        Text("カテゴリー")
                            .padding(.leading, 2)
                        ScrollView(.horizontal){
                            workbookItem()
                        }
                    }
                    ScrollView(.horizontal){
                        workbookItem()
                    }
                    Spacer()
                }
                .padding([.leading, .bottom, .trailing])
            }
        }
        
    }
}



@available(iOS 17.0, *)
struct WorkbookHome_previews: PreviewProvider{
    static var previews: some View {
        WorkbookHome()
    }
}

enum ViewStyle: String, CaseIterable{
    case questionList
    case workbooks
}
