//
//  TodoItem.swift
//  PLAM
//
//  Created by Codex on 2/5/26.
//

import Foundation

struct TodoItem: Identifiable, Equatable {
    let id: UUID
    let title: String
    let minutes: Int
    let dueDate: Date?
    let isCompleted: Bool
}
