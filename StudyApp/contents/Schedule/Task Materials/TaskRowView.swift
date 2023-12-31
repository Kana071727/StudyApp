//
//  TaskRowView.swift
//  StudyApp
//
//  Created by 清水　佳奈音 on 2023/08/24.
//

import SwiftUI

@available(iOS 17.0, *)
struct TaskRowView: View {
    @Bindable var task: Task
    @Environment(\.modelContext) private var context
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            Circle()
                .fill(indicaterColor)
                .frame(width: 10, height: 10)
                .padding(4)
                .background(.white.shadow(.drop(color: .black.opacity(0.1), radius: 3)),in: Circle())
            ///押される場所を大きくすることで利便性UP だから透明で見えない
                .overlay {
                    Circle()
                        .foregroundStyle(.clear)
                        .contentShape(.circle)
                        .frame(width: 50,height: 50)
                        .onTapGesture {
                            withAnimation(.snappy) {
                                task.isCompleted.toggle()
                            }
                        }
                }
            VStack(alignment: .leading, spacing: 8, content: {
                Text(task.taskTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                
                Label(task.creationDate.format("hh:mm a"), systemImage: "clock")
                    .font(.caption)
                    .foregroundStyle(.black)
                
            })
            .padding(15)
            .hSpacing(.leading)
            .background(task.tintColor.opacity(0.5), in: .rect(topLeadingRadius: 15, bottomLeadingRadius: 15))
            .strikethrough(task.isCompleted, pattern: .solid, color: .black)
            .contentShape(.contextMenuPreview, .rect(cornerRadius: 15))
            .contextMenu {
                Button("Delete Task",role: .destructive) {
                    //MARK: Deleting Task
                    context.delete(task)
                    try? context.save()
                    
                }
            .offset(y: -8)
            
            }
        }

    }
    var indicaterColor: Color {
        if task.isCompleted {
            return .green
        }
        return task.creationDate.isSameHour ? .blue : (task.creationDate.isPast ? .red : .black)
    }
}

@available(iOS 17.0, *)
struct TaskRowView_Previews: PreviewProvider {
    static var previews: some View {
        Scheduleview()
    }
}
