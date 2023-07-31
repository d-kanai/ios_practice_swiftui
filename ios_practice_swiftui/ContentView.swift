import SwiftUI
import CoreData

struct ContentView: View {
    @State private var todoTitle = ""
    var body: some View {
        TextField("create todo", text: $todoTitle)
        Text("Hello")
    }
}
