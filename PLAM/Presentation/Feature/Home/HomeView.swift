//
//  HomeView.swift
//  PLAM
//
//  Created by Codex on 2/5/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel: HomeViewModel
    @State private var showAddFlow = false
    private let addFlowViewModel: AddFlowViewModel

    init(viewModel: HomeViewModel, addFlowViewModel: AddFlowViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.addFlowViewModel = addFlowViewModel
    }

    var body: some View {
        VStack(spacing: 16) {
            header
            timelineSection
            unscheduledSection
            Spacer()
        }
        .padding(24)
        .navigationTitle("홈")
        .toolbar {
            Button {
                showAddFlow = true
            } label: {
                Image(systemName: "plus")
            }
        }
        .sheet(isPresented: $showAddFlow) {
            AddFlowView(viewModel: addFlowViewModel) {
                showAddFlow = false
            }
        }
    }

    private var header: some View {
        HStack {
            Text("오늘의 일정")
                .font(.title3)
                .fontWeight(.semibold)
            Spacer()
        }
    }

    private var timelineSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            ForEach(viewModel.timeline) { section in
                Text(section.title)
                    .font(.headline)
                ForEach(section.items) { item in
                    HStack {
                        Text(item.title)
                            .font(.subheadline)
                        Spacer()
                        Text("\(item.durationMinutes)분")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical, 6)
                    Divider()
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var unscheduledSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("미배치 TODO")
                .font(.headline)
            if viewModel.unscheduled.isEmpty {
                Text("아직 미배치된 TODO가 없어요.")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            } else {
                ForEach(viewModel.unscheduled) { item in
                    Text(item.title)
                        .font(.subheadline)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    HomeView(
        viewModel: HomeViewModel(fetchHomeDataUseCase: DefaultFetchHomeDataUseCase(timelineRepository: DefaultTimelineRepository(), todoRepository: DefaultTodoRepository())),
        addFlowViewModel: AddFlowViewModel(
            distributeTodoUseCase: DefaultDistributeTodoUseCase(
                calculateAvailableTimeUseCase: DefaultCalculateAvailableTimeUseCase(repository: DefaultScheduleRepository())
            )
        )
    )
}
