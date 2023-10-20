//
//  ExampleView1.swift
//  iExpense
//
//  Created by Martin Lienhard on 1/4/22.
//

import SwiftUI

class User: ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    let firstName: String
    let lastName: String
    
    var body: some View {
        Text("Hello \(firstName) \(lastName)!")
        Button("Dismiss") {
            dismiss()
        }
    }
}

struct ExampleView1: View {
    @StateObject var user = User()
    @State private var showingSheet = false
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName).")
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
            Button("Show sheet") {
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet) {
                SecondView(firstName: user.firstName, lastName: user.lastName)
            }
        }
    }
}

struct ExampleView1_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView1()
    }
}
