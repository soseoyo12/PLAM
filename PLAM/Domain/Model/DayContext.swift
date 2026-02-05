//
//  DayContext.swift
//  PLAM
//
//  Created by Codex on 2/5/26.
//

import Foundation

struct DayContext: Equatable {
    let wakeTime: String
    let sleepTime: String
    let fixedSchedulesMinutes: Int
    let existingTodoMinutes: Int
}
