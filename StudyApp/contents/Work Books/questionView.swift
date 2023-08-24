//
//  questionView.swift
//  StudyApp
//
//  Created by 清水　佳奈音 on 2023/07/05.
//

import SwiftUI

struct questionView: View {
    @State var hintIsShow: Bool = false
    @State var answerIsShow: Bool = false
    var body: some View {
       
        VStack(alignment: .center){
            ///上の時間表示
            HStack{
                Spacer()
                Image(systemName: "timer")
                Text("00:00")
            }
            ///問題表示
            VStack(alignment: .leading){
                Text("次の問いに答えよ")
                Rectangle()
                    .frame(width: UIScreen.main.bounds.size.width * 0.95,
                           height: UIScreen.main.bounds.size.width * 0.5)
            }
            ///出典表示
            HStack{
                Image(systemName: "lightbulb")
                Button("HINT") {
                    hintIsShow = !hintIsShow
                }
                Spacer()
                Text("(○○ページ　大問○)")
            }
            ///答え見るボタン＆ヒントボタン
            HStack{
                Image(systemName: "lightbulb.max")
                Text("〜〜〜〜〜に気をつける")
            }
                .opacity(hintIsShow ? 1 : 0)
                .padding()
            Button {
                answerIsShow = true
            }label:{
                Text("解答")
                    .foregroundColor(Color.black)
            }
            .frame(width: UIScreen.main.bounds.size.width * 0.4,
                   height: UIScreen.main.bounds.size.width * 0.1)
            .background(RoundedRectangle(cornerRadius: 30)
                .fill(Color.yellow.gradient))
            
            ///答えパート
            VStack {
                Rectangle()
                    .frame(width: UIScreen.main.bounds.size.width * 0.95,
                           height: UIScreen.main.bounds.size.width * 0.5)
                Button {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }label:{
                    Text("次へ")
                        .foregroundColor(Color.black)
                }
                .frame(width: UIScreen.main.bounds.size.width * 0.4,
                       height: UIScreen.main.bounds.size.width * 0.1)
                .background(RoundedRectangle(cornerRadius: 30)
                    .fill(Color.yellow.gradient))
                .padding()

            }
            .opacity(answerIsShow ? 1 : 0)
            .padding()
           
            
            
            
            Spacer()
        }
        .padding()
    }
}

struct questionView_Previews: PreviewProvider {
    static var previews: some View {
        questionView()
    }
}
