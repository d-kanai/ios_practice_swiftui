import SwiftUI
import CoreData

struct ContentView: View {
    @State private var todoTitle = ""
    @State private var items:[String] = []
    var body: some View {
        TextField("create todo", text: $todoTitle)
        Button(action: {
            self.items.append("\(todoTitle)")
            self.todoTitle = ""
            
        }) {
            Text("submit")
        }
        List {
            ForEach(items, id: \.self) { item in
                Text(item)
            }
        }
    }
}
