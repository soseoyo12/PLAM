//
//  OnboardingViewModel.swift
//  PLAM
//
//  Created by Codex on 2/5/26.
//

import Foundation

final class OnboardingViewModel: ObservableObject {
    @Published var wakeTime: String = "08:00"
    @Published var sleepTime: String = "23:00"

    private let calculateAvailableTimeUseCase: CalculateAvailableTimeUseCase

    init(calculateAvailableTimeUseCase: CalculateAvailableTimeUseCase) {
        self.calculateAvailableTimeUseCase = calculateAvailableTimeUseCase
    }

    func availableMinutes() -> Int {
        let context = DayContext(
            wakeTime: wakeTime,
            sleepTime: sleepTime,
            fixedSchedulesMinutes: 0,
            existingTodoMinutes: 0
        )
        return calculateAvailableTimeUseCase.execute(dayContext: context)
    }
}
