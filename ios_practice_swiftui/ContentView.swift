import SwiftUI
import CoreData

struct ContentView: View {
    @State private var todoTitle = ""
    @State private var filterKeyword = ""
    @State var buttonText = "Button"
    @State var items:[String] = []
    
    private var filteredTodoList: [String] {
        if(filterKeyword == ""){
           return items 
        }
        return items.filter { $0.contains(filterKeyword)}
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
