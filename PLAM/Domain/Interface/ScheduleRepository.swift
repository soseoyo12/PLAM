//
//  ScheduleRepository.swift
//  PLAM
//
//  Created by Codex on 2/5/26.
//

import Foundation

protocol ScheduleRepository {
    func fetchFixedSchedulesMinutes() -> Int
    func fetchExistingTodoMinutes() -> Int
}
