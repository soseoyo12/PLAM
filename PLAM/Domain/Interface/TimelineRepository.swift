//
//  TimelineRepository.swift
//  PLAM
//
//  Created by Codex on 2/5/26.
//

import Foundation

protocol TimelineRepository {
    func fetchTodayTimeline() -> [TimelineSection]
}
