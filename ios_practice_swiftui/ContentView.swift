import SwiftUI
import CoreData

class TodoFilter {
    
    var items: [String]
    
    init(items: [String]) {
        self.items = items
    }
    
    func filter(keyword: String) -> [String] {
        return items
    }
    
}

struct ContentView: View {
    @State private var todoTitle = ""
    @State private var filterKeyword = ""
    @State private var items:[String] = []
    var filteredItems: [String] {
        return TodoFilter(items:items).filter(keyword: filterKeyword)
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
