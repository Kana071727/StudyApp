//
//  workbookaddview.swift
//  StudyApp
//
//  Created by 清水　佳奈音 on 2023/08/21.
//

import SwiftUI

@available(iOS 17.0, *)
struct workbookaddview: View {
    @Environment(\.dismiss) private var dismiss
    @State var questiontype = false
    @State var addtag = false
    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title)
                    .tint(Color.customred)
            })
            .hSpacing(.leading)
            
            VStack(alignment: .leading,spacing: 8, content: {
                Text("問題")
                    .font(.title3)
                    
                Text("名前")
                    .font(.caption)
                    .foregroundStyle(.gray)
                TextField("名前", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 15)
                    .background(.white.shadow(.drop(color: .black.opacity(0.25), radius: 2)), in: .rect(cornerRadius: 10))
                Text("問題文")
                    .font(.caption)
                    .foregroundStyle(.gray)
                TextField("問題文", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 15)
                    .background(.white.shadow(.drop(color: .black.opacity(0.25), radius: 2)), in: .rect(cornerRadius: 10))
                Text("詳細情報")
                    .font(.caption)
                    .foregroundStyle(.gray)
                TextField("０ページ　第０問", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 15)
                    .background(.white.shadow(.drop(color: .black.opacity(0.25), radius: 2)), in: .rect(cornerRadius: 10))
                Text("解答")
                    .font(.title3)
                    
                Text("解答")
                    .font(.caption)
                    .foregroundStyle(.gray)
                TextField("解答", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 15)
                    .background(.white.shadow(.drop(color: .black.opacity(0.25), radius: 2)), in: .rect(cornerRadius: 10))
                Text("ヒント")
                    .font(.caption)
                    .foregroundStyle(.gray)
                TextField("００に注目！", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 15)
                    .background(.white.shadow(.drop(color: .black.opacity(0.25), radius: 2)), in: .rect(cornerRadius: 10))
                Text("その他")
                    .font(.title3)
                Text("タグ")
                    .font(.caption)
                    .foregroundStyle(.gray)
//                Text("")
//                    .background(.white.shadow(.drop(color: .black.opacity(0.25), radius: 2)), in: .rect(cornerRadius: 10))
                Button{
                    addtag.toggle()
                } label:{
                    Text("タグを追加する")
                }
                .sheet(isPresented: $addtag){
                    TagView()
                }
            })
            .padding(.top, 5)
            
            Spacer()
        })
        .padding()
    }
        
}

@available(iOS 17.0, *)
struct workbookaddview_Previews: PreviewProvider {
    static var previews: some View {
        workbookaddview()
    }
}
