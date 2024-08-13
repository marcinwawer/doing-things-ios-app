//
//  ListRowView.swift
//  TodoList
//
//  Created by Marcin Wawer on 29-07-2024.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isCompleted ? .green : .red)
            
            Text(item.title)
            
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    Group {
        ListRowView(item: ItemModel(title: "first item", isCompleted: false))
        ListRowView(item: ItemModel(title: "second item", isCompleted: true))
    }
}
