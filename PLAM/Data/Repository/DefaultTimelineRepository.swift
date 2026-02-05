//
//  DefaultTimelineRepository.swift
//  PLAM
//
//  Created by Codex on 2/5/26.
//

import Foundation

final class DefaultTimelineRepository: TimelineRepository {
    func fetchTodayTimeline() -> [TimelineSection] {
        HomeDummyData.timeline()
    }
}
