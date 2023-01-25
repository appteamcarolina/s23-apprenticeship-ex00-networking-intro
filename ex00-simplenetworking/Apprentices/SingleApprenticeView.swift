//
//  SingleApprenticeView.swift
//  ex00-simplenetworking
//
//  Created by Samuel Shi on 1/25/23.
//

import SwiftUI

struct SingleApprenticeView: View {
    @StateObject private var vm = ApprenticeshipViewModel()
    
    var body: some View {
        Form {
            Button("Fetch Apprentice Name") {
                vm.fetchSingleApprentice()
            }
            
            if let name = vm.singleApprentice {
                Section("Apprentice Name") {
                    Text(name)
                }
            }
            
            if let error = vm.errorMessage {
                Section("Error Message") {
                    Text(error)
                }
            }
        }
        .navigationTitle("Single Apprentice")
    }
}

struct SingleApprenticeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SingleApprenticeView()
        }
    }
}
