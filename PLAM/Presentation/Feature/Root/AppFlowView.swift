//
//  AppFlowView.swift
//  PLAM
//
//  Created by Codex on 2/5/26.
//

import SwiftUI

struct AppFlowView: View {
    private let container: DIContainerProtocol
    @State private var path: [AppRoute] = []
    @State private var onboardingPath: [OnboardingRoute] = []

    init(container: DIContainerProtocol) {
        self.container = container
    }

    var body: some View {
        NavigationStack(path: $path) {
            NavigationStack(path: $onboardingPath) {
                container.makeOnboardingCoordinator().buildTimeSet {
                    onboardingPath.append(.goalSet)
                }
                .navigationDestination(for: OnboardingRoute.self) { route in
                    switch route {
                    case .timeSet:
                        container.makeOnboardingCoordinator().buildTimeSet {
                            onboardingPath.append(.goalSet)
                        }
                    case .goalSet:
                        container.makeOnboardingCoordinator().buildGoalSet {
                            path.append(.home)
                        }
                    }
                }
            }
            .navigationDestination(for: AppRoute.self) { route in
                switch route {
                case .home:
                    container.makeTabCoordinator().build()
                }
            }
        }
    }
}

#Preview {
    AppFlowView(container: DIContainer())
}
