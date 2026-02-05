//
//  TabCoordinator.swift
//  PLAM
//
//  Created by Codex on 2/5/26.
//

import SwiftUI

final class TabCoordinator: Coordinator {
    private let container: DIContainerProtocol

    init(container: DIContainerProtocol) {
        self.container = container
    }

    func build() -> some View {
        TabView {
            NavigationStack {
                container.makeHomeCoordinator().build()
            }
            .tabItem { Label("홈", systemImage: "house") }

            NavigationStack {
                CalendarView(viewModel: CalendarViewModel())
            }
            .tabItem { Label("캘린더", systemImage: "calendar") }

            NavigationStack {
                container.makeProfileCoordinator().build()
            }
            .tabItem { Label("프로필", systemImage: "person") }
        }
    }
}
