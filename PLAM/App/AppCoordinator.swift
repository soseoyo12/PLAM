//
//  AppCoordinator.swift
//  PLAM
//
//  Created by Codex on 2/5/26.
//

import SwiftUI

final class AppCoordinator: Coordinator {
    private let container: DIContainerProtocol

    init(container: DIContainerProtocol) {
        self.container = container
    }

    func build() -> some View {
        RootView(container: container)
    }
}
