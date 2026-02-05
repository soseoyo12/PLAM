//
//  HomeViewModel.swift
//  PLAM
//
//  Created by Codex on 2/5/26.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published private(set) var timeline: [TimelineSection] = []
    @Published private(set) var unscheduled: [TodoItem] = []

    private let fetchHomeDataUseCase: FetchHomeDataUseCase

    init(fetchHomeDataUseCase: FetchHomeDataUseCase) {
        self.fetchHomeDataUseCase = fetchHomeDataUseCase
        load()
    }

    func load() {
        let data = fetchHomeDataUseCase.execute()
        timeline = data.timeline
        unscheduled = data.unscheduled
    }
}
