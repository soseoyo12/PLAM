//
//  RootView.swift
//  PLAM
//
//  Created by Codex on 2/5/26.
//

import SwiftUI

struct RootView: View {
    private let container: DIContainerProtocol

    init(container: DIContainerProtocol) {
        self.container = container
    }

    var body: some View {
        AppFlowView(container: container)
    }
}

#Preview {
    RootView(container: DIContainer())
}
