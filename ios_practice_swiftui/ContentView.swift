import SwiftUI
import CoreData

class TodoFilter {
    var items: [String]
    
    init(items:[String]){
        self.items = items
    }
    func filter(keyword: String)->[String]{
        if(keyword == ""){
            return self.items
        }
        return self.items.filter { $0.contains(keyword)}
    }
    
    
}

struct ContentView: View {
    @State private var todoTitle = ""
    @State private var filterKeyword = ""
    @State var buttonText = "Button"
    @State public var items:[String] = []
    
    var filteredTodoList: [String] {
        return TodoFilter(items:items).filter(keyword: filterKeyword)
    }
    
    var body: some View {
        TextField("create todo", text: $todoTitle)
        Button(action: {
            self.items.append("\(todoTitle)")
            self.todoTitle = ""
        }){
            Text("submit")
        }
        TextField("filter todo", text: $filterKeyword)
        List {
            ForEach(filteredTodoList, id: \.self) { item in
                Text("\(item)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
