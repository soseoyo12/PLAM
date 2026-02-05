//
//  TodoRepository.swift
//  PLAM
//
//  Created by Codex on 2/5/26.
//

import Foundation

protocol TodoRepository {
    func fetchUnscheduledTodos() -> [TodoItem]
}
