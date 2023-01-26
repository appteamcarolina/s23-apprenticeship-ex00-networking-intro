//
//  ClassroomsViewModel.swift
//  ex00-simplenetworking
//
//  Created by Samuel Shi on 1/25/23.
//

import Foundation

@MainActor
class ClassroomsViewModel: ObservableObject {
    private let service = ClassroomService()
    
    @Published var classrooms: [Classroom] = []
    @Published var count: Int? = nil
    @Published var errorMessage: String? = nil
    
    func fetchClassrooms() {
        // TODO: Implement this method
    }
}
