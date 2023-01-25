//
//  ManyApprenticesView.swift
//  ex00-simplenetworking
//
//  Created by Samuel Shi on 1/25/23.
//

import SwiftUI

struct ManyApprenticesView: View {
    @StateObject private var vm = ApprenticeshipViewModel()
    
    var body: some View {
        Form {
            Section("Configuration") {
                Toggle("Limit Responses", isOn: canChangeCount)
                
                if let count = vm.count {
                    Stepper("Count: \(count)") {
                        vm.count = (vm.count ?? 0) + 1
                    } onDecrement: {
                        vm.count = (vm.count ?? 1) - 1
                    }
                }
            }
                
            Button("Fetch Apprentices") {
                vm.fetchManyApprentices()
            }
            
            if !vm.apprentices.isEmpty {
                Section("Apprentice Name") {
                    ForEach(vm.apprentices, id: \.self) { name in
                        Text(name)
                    }
                }
            }
            
            if let error = vm.errorMessage {
                Section("Error Message") {
                    Text(error)
                }
            }
        }
        .navigationTitle("Many Apprentices")
        .animation(.default, value: vm.apprentices)
        .animation(.default, value: canChangeCount.wrappedValue)
    }
    
    private var canChangeCount: Binding<Bool> {
        Binding {
            vm.count != nil
        } set: { canChangeCount in
            vm.count = canChangeCount ? 10 : nil
        }
    }
}

struct ManyApprenticesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ManyApprenticesView()
        }
    }
}
