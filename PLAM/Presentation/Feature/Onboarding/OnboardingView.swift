//
//  OnboardingView.swift
//  PLAM
//
//  Created by Codex on 2/5/26.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        OnboardingTimeSetView(
            viewModel: OnboardingViewModel(calculateAvailableTimeUseCase: DefaultCalculateAvailableTimeUseCase(repository: DefaultScheduleRepository())),
            onNext: {}
        )
    }
}

#Preview {
    OnboardingView()
}
