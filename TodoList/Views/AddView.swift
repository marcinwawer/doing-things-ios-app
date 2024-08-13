//
//  AddView.swift
//  TodoList
//
//  Created by Marcin Wawer on 29-07-2024.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText = ""
    
    @State var alertTitle = ""
    @State var showAlert = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Button(action: saveButtonPressed, label: {
                    Text("SAVE")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                })
            }
            .padding(14)
        }
        .navigationTitle("Add an Item ✏️")
        .alert(alertTitle, isPresented: $showAlert) {}
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            dismiss.callAsFunction()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new todo item must be at least 3 characters long! 😨"
            showAlert.toggle()
            return false
        }
        
        return true
    }
}

#Preview {
    NavigationStack {
        AddView()
    }
    .environmentObject(ListViewModel())
}

#Preview {
    NavigationStack {
        AddView()
    }
    .preferredColorScheme(.dark)
    .environmentObject(ListViewModel())
}
