//
//  OnboardingTimeSetView.swift
//  PLAM
//
//  Created by Codex on 2/5/26.
//

import SwiftUI

struct OnboardingTimeSetView: View {
    @StateObject private var viewModel: OnboardingViewModel
    private let onNext: () -> Void

    init(viewModel: OnboardingViewModel, onNext: @escaping () -> Void) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.onNext = onNext
    }

    var body: some View {
        VStack(spacing: 16) {
            Text("기상 & 취침 시간 설정")
                .font(.title2)
                .fontWeight(.semibold)

            Text("실제 가용 시간 계산의 기준이 됩니다.")
                .font(.subheadline)
                .foregroundColor(.secondary)

            VStack(spacing: 12) {
                HStack {
                    Text("기상 시간")
                    Spacer()
                    TextField("08:00", text: $viewModel.wakeTime)
                        .multilineTextAlignment(.trailing)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 120)
                }

                HStack {
                    Text("취침 시간")
                    Spacer()
                    TextField("23:00", text: $viewModel.sleepTime)
                        .multilineTextAlignment(.trailing)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 120)
                }
            }
            .padding(.top, 8)

            Text("가용 시간: \(viewModel.availableMinutes())분")
                .font(.footnote)
                .foregroundColor(.secondary)

            Button("다음 →", action: onNext)
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .padding(.top, 8)
        }
        .padding(24)
    }
}

#Preview {
    OnboardingTimeSetView(
        viewModel: OnboardingViewModel(calculateAvailableTimeUseCase: DefaultCalculateAvailableTimeUseCase(repository: DefaultScheduleRepository())),
        onNext: {}
    )
}
