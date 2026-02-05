//
//  DefaultTodoRepository.swift
//  PLAM
//
//  Created by Codex on 2/5/26.
//

import Foundation

final class DefaultTodoRepository: TodoRepository {
    func fetchUnscheduledTodos() -> [TodoItem] {
        HomeDummyData.unscheduled()
    }
}
