//
//  ApprenticeshipService.swift
//  ex00-simplenetworking
//
//  Created by Samuel Shi on 1/25/23.
//

import Foundation

struct ApprenticeshipService {
    /// Used to connect to the internet via HTTPS
    private let session = URLSession.shared

    /// Used to decode the data we receive from `JSON`
    private let decoder = JSONDecoder()

    /// Fetch the name of a random iOS Apprenticeship member from `learning.appteamcarolina.com`
    /// - Returns: A string containing an apprentice's name.
    public func fetchSingleApprentice() async throws -> String {
        // Build the URL we'll make a request to
        let components = URLComponents(string: "https://learning.appteamcarolina.com/networking-demo/apprentice")
        guard let url = components?.url else { fatalError("Invalid URL") }
        
        // Begin fetching the data and wait for the response to come back
        let (data, _) = try await session.data(from: url)
        
        // Decode the name from the `Data` type using our `JSONDecoder`
        let name = try decoder.decode(String.self, from: data)
        
        // Return the decoded name
        return name
    }
    
    public func fetchManyApprentices(count: Int?) async throws -> [String] {
        // TODO: Implement this method
        return []
    }
}
