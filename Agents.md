# Agent Guidelines (Cherrish iOS)

## Architecture
- Use Clean Architecture layering: `Presentation` → `Domain` → `Data` → `Core`.
- Apply the Coordinator pattern for navigation and flow composition.
- Use a DI Container to resolve dependencies (no global singletons).
- Build the UI with SwiftUI.

## Folder Structure (Required)
```
Cherrish-iOS/
└── Cherrish-iOS/
    ├── Info/
    ├── App/
    ├── Core/
    ├── Data/
    │   ├── Persistence/
    │   └── Repository/
    ├── Domain/
    │   ├── Interface/
    │   ├── Model/
    │   └── UseCase/
    ├── Presentation/
    │   ├── Feature/
    │   └── Global/
    ├── Resource/
    └── Assets/
```

## Conventions
- Keep dependency direction inward only (Domain has no Data/Presentation references).
- Use protocols in `Domain/Interface` and implement them in `Data/Repository`.
- Keep UI state and view models in `Presentation/Feature`.
- Share common UI components and styles in `Presentation/Global`.
- Keep app entry wiring in `App` and base configuration in `Info`.
