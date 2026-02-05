//
//  DIContainer.swift
//  PLAM
//
//  Created by Codex on 2/5/26.
//

import Foundation

protocol DIContainerProtocol {
    func makeAppCoordinator() -> AppCoordinator
    func makeOnboardingCoordinator() -> OnboardingCoordinator
    func makeOnboardingViewModel() -> OnboardingViewModel
    func makeCalculateAvailableTimeUseCase() -> CalculateAvailableTimeUseCase
    func makeScheduleRepository() -> ScheduleRepository
    func makeHomeCoordinator() -> HomeCoordinator
    func makeTabCoordinator() -> TabCoordinator
    func makeHomeViewModel() -> HomeViewModel
    func makeFetchHomeDataUseCase() -> FetchHomeDataUseCase
    func makeTimelineRepository() -> TimelineRepository
    func makeTodoRepository() -> TodoRepository
    func makeProfileCoordinator() -> ProfileCoordinator
    func makeProfileViewModel() -> ProfileViewModel
    func makeFetchProfileUseCase() -> FetchProfileUseCase
    func makeProfileRepository() -> ProfileRepository
    func makeAddFlowViewModel() -> AddFlowViewModel
    func makeDistributeTodoUseCase() -> DistributeTodoUseCase
}

final class DIContainer: DIContainerProtocol {
    func makeAppCoordinator() -> AppCoordinator {
        AppCoordinator(container: self)
    }

    func makeOnboardingCoordinator() -> OnboardingCoordinator {
        OnboardingCoordinator(container: self)
    }

    func makeOnboardingViewModel() -> OnboardingViewModel {
        OnboardingViewModel(calculateAvailableTimeUseCase: makeCalculateAvailableTimeUseCase())
    }

    func makeCalculateAvailableTimeUseCase() -> CalculateAvailableTimeUseCase {
        DefaultCalculateAvailableTimeUseCase(repository: makeScheduleRepository())
    }

    func makeScheduleRepository() -> ScheduleRepository {
        DefaultScheduleRepository()
    }

    func makeHomeCoordinator() -> HomeCoordinator {
        HomeCoordinator(container: self)
    }

    func makeTabCoordinator() -> TabCoordinator {
        TabCoordinator(container: self)
    }

    func makeHomeViewModel() -> HomeViewModel {
        HomeViewModel(fetchHomeDataUseCase: makeFetchHomeDataUseCase())
    }

    func makeFetchHomeDataUseCase() -> FetchHomeDataUseCase {
        DefaultFetchHomeDataUseCase(
            timelineRepository: makeTimelineRepository(),
            todoRepository: makeTodoRepository()
        )
    }

    func makeTimelineRepository() -> TimelineRepository {
        DefaultTimelineRepository()
    }

    func makeTodoRepository() -> TodoRepository {
        DefaultTodoRepository()
    }

    func makeProfileCoordinator() -> ProfileCoordinator {
        ProfileCoordinator(container: self)
    }

    func makeProfileViewModel() -> ProfileViewModel {
        ProfileViewModel(fetchProfileUseCase: makeFetchProfileUseCase())
    }

    func makeFetchProfileUseCase() -> FetchProfileUseCase {
        DefaultFetchProfileUseCase(repository: makeProfileRepository())
    }

    func makeProfileRepository() -> ProfileRepository {
        DefaultProfileRepository()
    }

    func makeAddFlowViewModel() -> AddFlowViewModel {
        AddFlowViewModel(distributeTodoUseCase: makeDistributeTodoUseCase())
    }

    func makeDistributeTodoUseCase() -> DistributeTodoUseCase {
        DefaultDistributeTodoUseCase(calculateAvailableTimeUseCase: makeCalculateAvailableTimeUseCase())
    }
}
