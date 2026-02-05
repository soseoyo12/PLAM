//
//  CalendarView.swift
//  PLAM
//
//  Created by Codex on 2/5/26.
//

import SwiftUI

struct CalendarView: View {
    @StateObject private var viewModel: CalendarViewModel

    init(viewModel: CalendarViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(spacing: 16) {
            header
            weekdays
            grid
            scheduleList
            Spacer()
        }
        .padding(24)
        .navigationTitle("캘린더")
    }

    private var header: some View {
        HStack {
            Text(viewModel.monthTitle)
                .font(.title2)
                .fontWeight(.semibold)
            Spacer()
        }
    }

    private var weekdays: some View {
        HStack {
            ForEach(["일", "월", "화", "수", "목", "금", "토"], id: \._self) { day in
                Text(day)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity)
            }
        }
    }

    private var grid: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 8), count: 7), spacing: 8) {
            ForEach(viewModel.days, id: \._self) { day in
                Text("\(day)")
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, minHeight: 32)
                    .background(day == viewModel.selectedDay ? Color.blue.opacity(0.15) : Color(.systemGray6))
                    .cornerRadius(8)
                    .onTapGesture {
                        viewModel.select(day: day)
                    }
            }
        }
    }

    private var scheduleList: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("선택한 날짜 일정")
                .font(.headline)
            if viewModel.schedules.isEmpty {
                Text("일정이 없습니다.")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            } else {
                ForEach(viewModel.schedules) { item in
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
}

#Preview {
    CalendarView(viewModel: CalendarViewModel())
}
