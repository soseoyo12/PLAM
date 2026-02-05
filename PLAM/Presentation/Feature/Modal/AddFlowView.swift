//
//  AddFlowView.swift
//  PLAM
//
//  Created by Codex on 2/5/26.
//

import SwiftUI

struct AddFlowView: View {
    @StateObject private var viewModel: AddFlowViewModel
    @State private var showWarning = false

    private let onClose: () -> Void

    init(viewModel: AddFlowViewModel, onClose: @escaping () -> Void) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.onClose = onClose
    }

    var body: some View {
        VStack(spacing: 20) {
            switch viewModel.step {
            case .type:
                typeSelect
            case .todoInput:
                todoInput
            case .aiResult:
                aiResult
            case .scheduleInput:
                scheduleInput
            }
        }
        .padding(24)
        .presentationDetents([.medium, .large])
        .alert("새벽 배치 경고", isPresented: $showWarning) {
            Button("확인") {
                viewModel.moveToScheduleInput()
            }
        } message: {
            Text("해당 TODO는 새벽 시간에 배치됐어요. 수면에 영향을 줄 수 있습니다.")
        }
    }

    private var typeSelect: some View {
        VStack(spacing: 16) {
            Text("새로운 항목 추가")
                .font(.title3)
                .fontWeight(.semibold)

            Text("어떤 종류의 항목을 추가할까요?")
                .font(.subheadline)
                .foregroundColor(.secondary)

            Button("TODO 추가") {
                viewModel.moveToTodoInput()
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)

            Button("일정 추가") {
                viewModel.moveToScheduleInput()
            }
            .buttonStyle(.bordered)
            .controlSize(.large)
        }
    }

    private var todoInput: some View {
        VStack(spacing: 16) {
            Text("TODO 입력")
                .font(.title3)
                .fontWeight(.semibold)

            TextField("할 일을 입력하세요", text: $viewModel.todoTitle)
                .textFieldStyle(.roundedBorder)

            Stepper("예상 소요 시간: \(viewModel.durationMinutes)분", value: $viewModel.durationMinutes, in: 10...240, step: 10)

            Button("AI 분해 결과 보기") {
                viewModel.moveToAIResult()
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
        }
    }

    private var aiResult: some View {
        VStack(spacing: 16) {
            Text("AI 분해 결과")
                .font(.title3)
                .fontWeight(.semibold)

            VStack(alignment: .leading, spacing: 8) {
                Text("• 자료 조사")
                Text("• 슬라이드 구성")
                Text("• 발표 리허설")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(12)

            Button("배치 확인") {
                if viewModel.warnings.isEmpty {
                    viewModel.moveToScheduleInput()
                } else {
                    showWarning = true
                }
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
        }
    }

    private var scheduleInput: some View {
        VStack(spacing: 16) {
            Text("일정 설정")
                .font(.title3)
                .fontWeight(.semibold)

            DatePicker("날짜", selection: $viewModel.selectedDate, displayedComponents: .date)
            DatePicker("시작 시간", selection: $viewModel.selectedTime, displayedComponents: .hourAndMinute)

            Stepper("소요 시간: \(viewModel.durationMinutes)분", value: $viewModel.durationMinutes, in: 10...240, step: 10)

            Button("일정 저장") {
                viewModel.reset()
                onClose()
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
        }
    }
}

#Preview {
    AddFlowView(
        viewModel: AddFlowViewModel(
            distributeTodoUseCase: DefaultDistributeTodoUseCase(
                calculateAvailableTimeUseCase: DefaultCalculateAvailableTimeUseCase(repository: DefaultScheduleRepository())
            )
        ),
        onClose: {}
    )
}
