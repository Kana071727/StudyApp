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
    @State private var tags: [String] = ["国語","数学","英語","化学","物理","地理"]
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
                        .background(Color.customyellow, in: .rect(cornerRadius: 10))
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
                            ForEach(tags, id: \.self) { tag in
                                WorkbookItem(Color.customyellow, tag)
                                    
                            }
                        }
                    }
                    ScrollView(.horizontal){
                        ForEach(tags, id: \.self) { tag in
                            WorkbookItem(Color.customyellow, tag)
                                .frame(width: 50, height: 80)
                        }
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

@ViewBuilder
func WorkbookItem( _ color: Color, _ title: String) -> some View {
    VStack(alignment:.leading){
        ZStack(alignment:.bottom){
            RoundedRectangle(cornerRadius: 15)
                .frame(width:UIScreen.main.bounds.size.width * 0.45, height: UIScreen.main.bounds.size.width * 0.3)
                .foregroundStyle(.gray.opacity(0.6))
            RoundedRectangle(cornerRadius: 15)
                .frame(width:UIScreen.main.bounds.size.width * 0.3, height: UIScreen.main.bounds.size.width * 0.4)
                .foregroundColor(color)
                .padding()
        }
        VStack(alignment:.leading){
            Text(title)
            Text("問題数")
        }
    }
}
