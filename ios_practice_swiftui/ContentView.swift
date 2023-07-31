import SwiftUI
import CoreData

struct ContentView: View {
    @State private var todoTitle = ""
    @State private var filterKeyword = ""
    @State private var items:[String] = []
    var filteredItems: [String] {
        return items
    }
    var body: some View {
        TextField("create todo", text: $todoTitle)
        Button(action: {
            self.items.append("\(todoTitle)")
            self.todoTitle = ""
            
        }) {
            Text("submit")
        }
        TextField("filter todo", text: $filterKeyword)
        List {
            ForEach(filteredItems, id: \.self) { item in
                Text(item)
            }
        }
    }
}
