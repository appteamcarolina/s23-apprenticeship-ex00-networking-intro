//
//  ApprenticeshipViewModel.swift
//  ex00-simplenetworking
//
//  Created by Samuel Shi on 1/25/23.
//

import Foundation

@MainActor class ApprenticeshipViewModel: ObservableObject {
    private let service = ApprenticeshipService()
    
    // Single Apprentice
    @Published var singleApprentice: String? = nil
    
    // Many Apprentices
    @Published var apprentices: [String] = []
    @Published var count: Int? = nil
    
    @Published var errorMessage: String? = nil
    
    func fetchSingleApprentice() {
        Task {
            do {
                let name = try await service.fetchSingleApprentice()
                self.singleApprentice = name
            } catch {
                self.errorMessage = String(describing: error)
            }
        }
    }
    
    func fetchManyApprentices() {
        // TODO: Implement this method
    }
}
