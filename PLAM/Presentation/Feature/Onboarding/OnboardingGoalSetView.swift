//
//  OnboardingGoalSetView.swift
//  PLAM
//
//  Created by Codex on 2/5/26.
//

import SwiftUI

struct OnboardingGoalSetView: View {
    private let onStart: () -> Void

    init(onStart: @escaping () -> Void) {
        self.onStart = onStart
    }

    var body: some View {
        VStack(spacing: 16) {
            Text("캘린더 연동")
                .font(.title2)
                .fontWeight(.semibold)

            Text("기존 일정을 가져와 시작하세요.")
                .font(.subheadline)
                .foregroundColor(.secondary)

            VStack(spacing: 12) {
                Button("Apple 캘린더 연결") {}
                    .buttonStyle(.bordered)
                Button("Google 캘린더 연결") {}
                    .buttonStyle(.bordered)
            }
            .padding(.top, 8)

            Spacer()

            Button("시작하기", action: onStart)
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
        }
        .padding(24)
    }
}

#Preview {
    OnboardingGoalSetView(onStart: {})
}
