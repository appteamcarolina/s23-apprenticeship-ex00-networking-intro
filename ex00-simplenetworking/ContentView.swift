//
//  ContentView.swift
//  ex00-simplenetworking
//
//  Created by Samuel Shi on 1/24/23.
//

import SwiftUI

struct ContentView: View {
    @State private var title: String = "0"
    let range: Range<Int> = 10_000_000 ..< 10_000_000 + 100
    
    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    SetTitleBlockingView()
                } label: {
                    Text("Set Title Blocking View")
                }
                
                NavigationLink {
                    SingleApprenticeView()
                } label: {
                    Text("Single Apprentice Name")
                }
                
                NavigationLink {
                    ManyApprenticesView()
                } label: {
                    Text("Many Apprentice Names")
                }
                
                NavigationLink {
                    ClassroomsView()
                } label: {
                    Text("Classrooms List")
                }

            }
            .navigationTitle("Simple Networking")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
