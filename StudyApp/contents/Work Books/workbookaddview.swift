//
//  workbookaddview.swift
//  StudyApp
//
//  Created by 清水　佳奈音 on 2023/08/21.
//

import SwiftUI

struct workbookaddview: View {
    @State var questiontype = false
    var body: some View {
        VStack{
            List{
                Toggle(isOn: $questiontype) {
                    if questiontype == false {
                        Text("テキストで保存")
                    } else {
                        Text("画像で保存")
                    }
                }
                .foregroundStyle(Color.black)
                Section(header: Text("問題").font(.title).foregroundColor(Color.black)){
                    VStack{
                        HStack{
                            Text("名前")
                            TextField("名前", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                        }
                        Divider()
                        if questiontype == false{
                            HStack{
                                Text("問題文")
                                TextField("問題文", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                            }
                        }else {
                            Button{
                                
                            } label: {
                                Image(systemName: "photo")
                                    .font(.system(size: 35))
                                    .foregroundStyle(Color.black
                                        .shadow(.drop(radius: 1)))
                            }
                            .buttonStyle(.bordered)
                        }
                        Divider()
                        HStack{
                            Text("詳細")
                            TextField("００ページ第０問", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                        }
                    }
                }
                .foregroundStyle(Color.black)
                Section(header: Text("解答").font(.title)
                    .foregroundColor(Color.black)){
                        VStack{
                            if questiontype == false{
                                HStack{
                                    Text("解答")
                                    TextField("解答", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                                }
                            } else {
                                Button{
                                    
                                } label: {
                                    Image(systemName: "photo")
                                        .font(.system(size: 35))
                                        .foregroundStyle(Color.black
                                            .shadow(.drop(radius: 1)))
                                }
                                .buttonStyle(.bordered)
                            }
                            Divider()
                            HStack{
                                Text("ヒント")
                                TextField("００に注目する！", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                            }
                        }
                    }
                    .foregroundStyle(Color.black)
                Section(header: Text("詳細").font(.title).foregroundColor(Color.black)){
                    HStack{
                        Text("タグ")
                        TextField("解答", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    }
                    HStack{
                        Text("問題集")
                        TextField("解答", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    }
                }
                .foregroundColor(Color.black)
            }
            HStack{
                Button("キャンセル") {
                    
                }
                .buttonStyle(.bordered)
                Button("保存する") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                .buttonStyle(.bordered)
            }
            .foregroundColor(Color.blue)
        }
    }
}

struct workbookaddview_Previews: PreviewProvider {
    static var previews: some View {
        workbookaddview()
    }
}
