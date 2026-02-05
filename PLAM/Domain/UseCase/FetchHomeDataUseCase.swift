//
//  FetchHomeDataUseCase.swift
//  PLAM
//
//  Created by Codex on 2/5/26.
//

import Foundation

struct HomeData {
    let timeline: [TimelineSection]
    let unscheduled: [TodoItem]
}

protocol FetchHomeDataUseCase {
    func execute() -> HomeData
}

struct DefaultFetchHomeDataUseCase: FetchHomeDataUseCase {
    private let timelineRepository: TimelineRepository
    private let todoRepository: TodoRepository

    init(timelineRepository: TimelineRepository, todoRepository: TodoRepository) {
        self.timelineRepository = timelineRepository
        self.todoRepository = todoRepository
    }

    func execute() -> HomeData {
        HomeData(
            timeline: timelineRepository.fetchTodayTimeline(),
            unscheduled: todoRepository.fetchUnscheduledTodos()
        )
    }
}
