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
                Image(systemName: "lightbulb.max")
                Button("HINT") {
                    hintIsShow = !hintIsShow
                }
                Spacer()
                Image(systemName: "tag")
                Text("(○○ページ　大問○)")
            }
            ///答え見るボタン＆ヒントボタン
            HStack{
                Image(systemName: "lightbulb.max")
                Text("〜〜〜〜〜に気をつける")
            }
                .opacity(hintIsShow ? 1 : 0)
                .padding()
            Button("解答") {
                answerIsShow = true
            }
            .frame(width: UIScreen.main.bounds.size.width * 0.4,
                   height: UIScreen.main.bounds.size.width * 0.1)
            .background(RoundedRectangle(cornerRadius: 30)
                .fill(Color.yellow))
            
            ///答えパート
            VStack {
                Rectangle()
                    .frame(width: UIScreen.main.bounds.size.width * 0.95,
                           height: UIScreen.main.bounds.size.width * 0.5)
                Button("次へ") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                .frame(width: UIScreen.main.bounds.size.width * 0.4,
                       height: UIScreen.main.bounds.size.width * 0.1)
                .background(RoundedRectangle(cornerRadius: 30)
                    .fill(Color.yellow))
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
