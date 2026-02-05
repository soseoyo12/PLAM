//
//  DefaultProfileRepository.swift
//  PLAM
//
//  Created by Codex on 2/5/26.
//

import Foundation

final class DefaultProfileRepository: ProfileRepository {
    func fetchStreakInfo() -> StreakInfo {
        StreakInfo(currentStreak: 7, bestStreak: 14, totalCompleted: 128)
    }
}
