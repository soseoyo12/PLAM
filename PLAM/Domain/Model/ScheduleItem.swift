//
//  ScheduleItem.swift
//  PLAM
//
//  Created by Codex on 2/5/26.
//

import Foundation

struct ScheduleItem: Identifiable, Equatable {
    let id: UUID
    let title: String
    let startTime: Date
    let durationMinutes: Int
    let isFixed: Bool
}
