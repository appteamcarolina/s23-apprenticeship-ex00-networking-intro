//
//  ClassroomService.swift
//  ex00-simplenetworking
//
//  Created by Samuel Shi on 1/25/23.
//

import Foundation

struct ClassroomService {
    private let session = URLSession.shared
    private let decoder = JSONDecoder()
    
    public func fetchClassrooms(count: Int?) async throws -> Classroom {
        // TODO: Implement this method
        return Classroom(id: UUID())
    }
}
