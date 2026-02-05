//
//  FetchProfileUseCase.swift
//  PLAM
//
//  Created by Codex on 2/5/26.
//

import Foundation

protocol FetchProfileUseCase {
    func execute() -> StreakInfo
}

struct DefaultFetchProfileUseCase: FetchProfileUseCase {
    private let repository: ProfileRepository

    init(repository: ProfileRepository) {
        self.repository = repository
    }

    func execute() -> StreakInfo {
        repository.fetchStreakInfo()
    }
}
