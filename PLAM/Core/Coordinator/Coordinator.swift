//
//  Coordinator.swift
//  PLAM
//
//  Created by Codex on 2/5/26.
//

import SwiftUI

protocol Coordinator {
    associatedtype RootView: View
    func build() -> RootView
}
