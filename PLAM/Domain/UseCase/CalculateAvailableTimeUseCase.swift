//
//  CalculateAvailableTimeUseCase.swift
//  PLAM
//
//  Created by Codex on 2/5/26.
//

import Foundation

protocol CalculateAvailableTimeUseCase {
    func execute(dayContext: DayContext) -> Int
}

struct DefaultCalculateAvailableTimeUseCase: CalculateAvailableTimeUseCase {
    private let repository: ScheduleRepository

    init(repository: ScheduleRepository) {
        self.repository = repository
    }

    func execute(dayContext: DayContext) -> Int {
        let total = minutesBetween(start: dayContext.wakeTime, end: dayContext.sleepTime)
        let fixed = repository.fetchFixedSchedulesMinutes()
        let existing = repository.fetchExistingTodoMinutes()
        return max(0, total - fixed - existing)
    }

    private func minutesBetween(start: String, end: String) -> Int {
        let startMinutes = parseMinutes(start)
        let endMinutes = parseMinutes(end)
        if endMinutes >= startMinutes {
            return endMinutes - startMinutes
        }
        // Fallback for overnight: treat as 24h wrap.
        return (24 * 60 - startMinutes) + endMinutes
    }

    private func parseMinutes(_ time: String) -> Int {
        let parts = time.split(separator: ":")
        guard parts.count == 2,
              let hour = Int(parts[0]),
              let minute = Int(parts[1]) else {
            return 0
        }
        return max(0, min(23, hour)) * 60 + max(0, min(59, minute))
    }
}
