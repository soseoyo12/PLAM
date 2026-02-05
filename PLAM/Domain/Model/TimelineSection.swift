//
//  TimelineSection.swift
//  PLAM
//
//  Created by Codex on 2/5/26.
//

import Foundation

struct TimelineSection: Identifiable, Equatable {
    let id: UUID
    let title: String
    let items: [ScheduleItem]
}
