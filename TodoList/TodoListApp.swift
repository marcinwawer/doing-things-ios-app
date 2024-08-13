//
//  TodoListApp.swift
//  TodoList
//
//  Created by Marcin Wawer on 29-07-2024.
//

import SwiftUI

/*
 MVVM Architecutre
 
 Model - data point
 View - UI
 ViewModel - manages Models for View
 */

@main
struct TodoListApp: App {
    
    @StateObject var listViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
