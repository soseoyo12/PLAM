//
//  DistributeTodoUseCase.swift
//  PLAM
//
//  Created by Codex on 2/5/26.
//

import Foundation

struct DistributionResult {
    let scheduled: [ScheduleItem]
    let warnings: [String]
}

struct DistributionRequest {
    let todo: TodoItem
    let dayContext: DayContext
    let dueDate: Date?
}

protocol DistributeTodoUseCase {
    func execute(request: DistributionRequest) -> DistributionResult
}

struct DefaultDistributeTodoUseCase: DistributeTodoUseCase {
    private let calculateAvailableTimeUseCase: CalculateAvailableTimeUseCase

    init(calculateAvailableTimeUseCase: CalculateAvailableTimeUseCase) {
        self.calculateAvailableTimeUseCase = calculateAvailableTimeUseCase
    }

    func execute(request: DistributionRequest) -> DistributionResult {
        let available = calculateAvailableTimeUseCase.execute(dayContext: request.dayContext)
        var warnings: [String] = []

        if available <= 0 {
            warnings.append("가용 시간이 없습니다.")
        } else if request.todo.minutes > available {
            warnings.append("가용 시간을 초과했습니다.")
        }

        if request.dayContext.wakeTime < "03:00" {
            warnings.append("새벽 시간 배치 경고")
        }

        return DistributionResult(scheduled: [], warnings: warnings)
    }
}
