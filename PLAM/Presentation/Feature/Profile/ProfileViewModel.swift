//
//  ProfileViewModel.swift
//  PLAM
//
//  Created by Codex on 2/5/26.
//

import Foundation

final class ProfileViewModel: ObservableObject {
    @Published private(set) var streakInfo: StreakInfo

    private let fetchProfileUseCase: FetchProfileUseCase

    init(fetchProfileUseCase: FetchProfileUseCase) {
        self.fetchProfileUseCase = fetchProfileUseCase
        self.streakInfo = fetchProfileUseCase.execute()
    }
}
