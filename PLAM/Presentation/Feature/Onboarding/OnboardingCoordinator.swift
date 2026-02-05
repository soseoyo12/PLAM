//
//  OnboardingCoordinator.swift
//  PLAM
//
//  Created by Codex on 2/5/26.
//

import SwiftUI

final class OnboardingCoordinator: Coordinator {
    private let container: DIContainerProtocol

    init(container: DIContainerProtocol) {
        self.container = container
    }

    func build() -> some View {
        OnboardingTimeSetView(viewModel: container.makeOnboardingViewModel(), onNext: {})
    }

    func buildTimeSet(onNext: @escaping () -> Void) -> some View {
        OnboardingTimeSetView(viewModel: container.makeOnboardingViewModel(), onNext: onNext)
    }

    func buildGoalSet(onStart: @escaping () -> Void) -> some View {
        OnboardingGoalSetView(onStart: onStart)
    }
}
