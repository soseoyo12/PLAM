//
//  ProfileView.swift
//  PLAM
//
//  Created by Codex on 2/5/26.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel: ProfileViewModel

    init(viewModel: ProfileViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(spacing: 20) {
            header
            streakCard
            statsSection
            Spacer()
        }
        .padding(24)
        .navigationTitle("프로필")
    }

    private var header: some View {
        HStack {
            Text("프로필")
                .font(.title2)
                .fontWeight(.semibold)
            Spacer()
        }
    }

    private var streakCard: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("현재 스트릭")
                .font(.headline)
            Text("\(viewModel.streakInfo.currentStreak)일 연속 진행 중")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background(Color(.systemGray6))
        .cornerRadius(16)
    }

    private var statsSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("통계")
                .font(.headline)
            HStack {
                statCard(title: "최고 스트릭", value: "\(viewModel.streakInfo.bestStreak)일")
                statCard(title: "완료한 TODO", value: "\(viewModel.streakInfo.totalCompleted)개")
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private func statCard(title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
            Text(value)
                .font(.headline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(12)
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

#Preview {
    ProfileView(viewModel: ProfileViewModel(fetchProfileUseCase: DefaultFetchProfileUseCase(repository: DefaultProfileRepository())))
}
