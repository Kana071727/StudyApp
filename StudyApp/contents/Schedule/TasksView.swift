//
//  TasksView.swift
//  StudyApp
//
//  Created by 清水　佳奈音 on 2023/08/25.
//

import SwiftUI
import SwiftData

@available(iOS 17, *)
struct TasksView: View {
    @Binding var currentDate: Date
    //MARK: SwiftData Dynamic Query
    @Query private var tasks: [Task]
    init(currentDate: Binding<Date>) {
        self._currentDate = currentDate
        //MARK: Predicate
        let calendar = Calendar.current
        let startOfDate = calendar.startOfDay(for: currentDate.wrappedValue)
        let endOfDate = calendar.date(byAdding: .day, value: 1, to: startOfDate)!
        let predicate = #Predicate<Task> {
            return $0.creationDate >= startOfDate && $0.creationDate < endOfDate
        }
        //MARK: Sorting
        let sortDescriptor = [
            SortDescriptor(\Task.creationDate, order: .forward)
        ]
        self._tasks = Query(filter: predicate, sort: sortDescriptor, animation: .snappy)
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 35) {
            ForEach(tasks) { task in
                TaskRowView(task: task)
                    .background(alignment: .leading) {
                        if tasks.last?.id != task.id {
                            Rectangle()
                                .frame(width: 1)
                                .offset(x: 8)
                                .padding(.bottom, -35)
                        }
                    }
            }
        }
        .padding([.vertical, .leading], 15)
        .overlay {
            if tasks.isEmpty {
                Text("No Task's Found")
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .frame(width:150)
            }
        }
    }
}


