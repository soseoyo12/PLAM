//
//  CalendarViewModel.swift
//  PLAM
//
//  Created by Codex on 2/5/26.
//

import Foundation

final class CalendarViewModel: ObservableObject {
    @Published private(set) var monthTitle: String
    @Published private(set) var days: [Int]
    @Published var selectedDay: Int?
    @Published private(set) var schedules: [ScheduleItem] = []

    private let scheduleMap: [Int: [ScheduleItem]]

    init(calendar: Calendar = .current, date: Date = Date()) {
        let formatter = DateFormatter()
        formatter.dateFormat = "LLLL"
        monthTitle = formatter.string(from: date)
        let range = calendar.range(of: .day, in: .month, for: date) ?? 1..<29
        days = Array(range)
        selectedDay = days.first
        scheduleMap = CalendarViewModel.makeDummySchedule(date: date)
        updateSchedules()
    }

    func select(day: Int) {
        selectedDay = day
        updateSchedules()
    }

    private func updateSchedules() {
        schedules = scheduleMap[selectedDay ?? 0] ?? []
    }

    private static func makeDummySchedule(date: Date) -> [Int: [ScheduleItem]] {
        let now = date
        return [
            1: [
                ScheduleItem(id: UUID(), title: "팀 회의", startTime: now, durationMinutes: 60, isFixed: true),
                ScheduleItem(id: UUID(), title: "자료 조사", startTime: now, durationMinutes: 40, isFixed: false)
            ],
            2: [
                ScheduleItem(id: UUID(), title: "운동", startTime: now, durationMinutes: 45, isFixed: false)
            ]
        ]
    }
}
