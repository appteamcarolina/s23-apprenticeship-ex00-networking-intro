//
//  SetTitleBlockingView.swift
//  ex00-simplenetworking
//
//  Created by Samuel Shi on 1/24/23.
//

import SwiftUI

struct SetTitleBlockingView: View {
    @State private var title: String = "0"
    let range: Range<Int> = 10_000_000 ..< 10_000_000 + 100
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(range, id: \.self) { number in
                    Button {
                        setTitle(to: number)
                    } label: {
                        Text(String(number))
                    }
                }
                .navigationTitle(title)
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
    
    func setTitle(to number: Int) {
        var sum = 0
        for _ in 0 ..< number { sum += 1 }
        self.title = number.formatted()
    }
}

struct SetTitleBlockingView_Previews: PreviewProvider {
    static var previews: some View {
        SetTitleBlockingView()
    }
}
