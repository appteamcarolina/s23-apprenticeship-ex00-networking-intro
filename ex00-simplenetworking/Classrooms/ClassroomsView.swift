//
//  ClassroomsView.swift
//  ex00-simplenetworking
//
//  Created by Samuel Shi on 1/25/23.
//

import SwiftUI

struct ClassroomsView: View {
    @StateObject private var vm = ClassroomsViewModel()
    
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
                vm.fetchClassrooms()
            }
            
            if !vm.classrooms.isEmpty {
                Section("Apprentice Name") {
                    ForEach(vm.classrooms) { classroom in
                        VStack(alignment: .leading) {
                            Text("\(classroom.building) \(classroom.number)")
                            
                            if let description = classroom.description {
                                Text(description)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
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
        .animation(.default, value: vm.count)
        .animation(.default, value: canChangeCount.wrappedValue)
    }
    
    private var canChangeCount: Binding<Bool> {
        Binding {
            vm.count != nil
        } set: { canChangeCount in
            vm.count = canChangeCount ? 2 : nil
        }
    }
}

struct ClassroomsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ClassroomsView()
        }
    }
    
}
