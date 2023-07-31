import SwiftUI
import CoreData

struct ContentView: View {
    @State private var todoTitle = ""
    @State var buttonText = "Button"
    @State var items:[String] = []
    
    var body: some View {
        TextField("create todo", text: $todoTitle)
        Button(action: {
            self.items.append("\(todoTitle)")
            self.todoTitle = ""
        }){
            Text("submit")
        }
        List {
            ForEach($items, id: \.self) { $item in
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
