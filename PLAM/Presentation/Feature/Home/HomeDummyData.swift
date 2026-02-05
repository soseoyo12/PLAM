//
//  HomeDummyData.swift
//  PLAM
//
//  Created by Codex on 2/5/26.
//

import Foundation

enum HomeDummyData {
    static func timeline() -> [TimelineSection] {
        let now = Date()
        return [
            TimelineSection(
                id: UUID(),
                title: "오전",
                items: [
                    ScheduleItem(id: UUID(), title: "고정 일정: 수업", startTime: now, durationMinutes: 60, isFixed: true),
                    ScheduleItem(id: UUID(), title: "자료 조사", startTime: now, durationMinutes: 40, isFixed: false)
                ]
            ),
            TimelineSection(
                id: UUID(),
                title: "저녁",
                items: [
                    ScheduleItem(id: UUID(), title: "운동", startTime: now, durationMinutes: 45, isFixed: false)
                ]
            )
        ]
    }

    static func unscheduled() -> [TodoItem] {
        [
            TodoItem(id: UUID(), title: "발표자료 정리", minutes: 30, dueDate: nil, isCompleted: false),
            TodoItem(id: UUID(), title: "팀 피드백 반영", minutes: 50, dueDate: nil, isCompleted: false)
        ]
    }
}
