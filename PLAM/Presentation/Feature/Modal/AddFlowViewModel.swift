//
//  AddFlowViewModel.swift
//  PLAM
//
//  Created by Codex on 2/5/26.
//

import Foundation

final class AddFlowViewModel: ObservableObject {
    @Published var step: AddFlowStep = .type
    @Published var todoTitle: String = ""
    @Published var durationMinutes: Int = 30
    @Published var selectedDate: Date = Date()
    @Published var selectedTime: Date = Date()
    @Published var warnings: [String] = []

    private let distributeTodoUseCase: DistributeTodoUseCase

    init(distributeTodoUseCase: DistributeTodoUseCase) {
        self.distributeTodoUseCase = distributeTodoUseCase
    }

    func moveToTodoInput() {
        step = .todoInput
    }

    func moveToAIResult() {
        step = .aiResult
        runDistribution()
    }

    func moveToScheduleInput() {
        step = .scheduleInput
    }

    func reset() {
        step = .type
        todoTitle = ""
        durationMinutes = 30
        warnings = []
    }

    private func runDistribution() {
        let todo = TodoItem(id: UUID(), title: todoTitle, minutes: durationMinutes, dueDate: nil, isCompleted: false)
        let context = DayContext(
            wakeTime: "08:00",
            sleepTime: "23:00",
            fixedSchedulesMinutes: 180,
            existingTodoMinutes: 240
        )
        let request = DistributionRequest(todo: todo, dayContext: context, dueDate: nil)
        let result = distributeTodoUseCase.execute(request: request)
        warnings = result.warnings
    }
}
