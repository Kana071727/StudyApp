//
//  TagView.swift
//  StudyApp
//
//  Created by 清水　佳奈音 on 2023/09/04.
//

import SwiftUI

@available(iOS 17.0, *)
struct TagView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var tags: [String] = ["国語","数学","英語","化学","物理","地理"]
    @State private var selectedTags: [String] = []
    @Namespace private var animation
    var body: some View {
        VStack(spacing: 0) {
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title)
                    .tint(Color.customred)
            })
            .hSpacing(.leading)
            
            ScrollView(.horizontal) {
                HStack(spacing: 12){
                    ForEach(selectedTags, id: \.self) { tag in
                        TagItem(tag, .pink, "checkmark")
                            .matchedGeometryEffect(id: tag, in: animation)
                            .onTapGesture {
                                withAnimation(.snappy) {
                                    selectedTags.removeAll(where: { $0 == tag})
                                }
                            }
                    }
                }
                .padding(.horizontal, 15)
                .frame(height: 35)
                .padding(.vertical, 15)
            }
            .scrollClipDisabled(true)
            .scrollIndicators(.hidden)
            .overlay(content: {
                if selectedTags.isEmpty {
                    Text("選択されているタグがありません")
                        .font(.callout)
                        .foregroundStyle(.gray)
                }
            })
            .background(.white)
            .zIndex(1)
            
            ScrollView(.vertical) {
                TagLayout(alignment: .leading, spacing: 10) {
                    ForEach(tags.filter { !selectedTags.contains($0)}, id: \.self) { tag in
                        TagItem(tag, Color.customblue, "plus")
                            .matchedGeometryEffect(id: tag, in: animation)
                            .onTapGesture {
                                withAnimation(.snappy) {
                                    selectedTags.insert(tag, at:0)
                                }
                            }
                    }
                }
                .padding(15)
            }
            .scrollClipDisabled(true)
            .scrollIndicators(.hidden)
            .background(.black.opacity(0.05))
            .zIndex(0)
            
            ZStack {
                Button(action: {}, label: {
                    Text("Continue")
                        .fontWeight(.semibold)
                        .padding(.vertical, 15)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.white)
                        .background {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(.pink.gradient)
                        }
                })
                .disabled(selectedTags.count < 1)
                .opacity(selectedTags.count < 1 ? 0.5 : 1)
                .padding()
            }
            .background(.white)
        }
        .padding(.top, 5)
        .padding()
    }
}

@ViewBuilder
func TagItem(_ tag: String, _ color: Color, _ icon: String) -> some View {
    HStack(spacing: 10){
        Text(tag)
            .font(.callout)
            .fontWeight(.semibold)
        
        Image(systemName: icon)
    }
    .frame(width: 80, height: 35)
    .foregroundStyle(.white)
    .padding(.horizontal, 15)
    .background{
        Capsule()
            .fill(color.gradient)
    }
}

@available(iOS 17.0, *)
struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView()
    }
}

