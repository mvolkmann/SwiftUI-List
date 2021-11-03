import SwiftUI

struct Dog {
    var name: String
    var breed: String
}

let dogs = [
    Dog(name: "Maisey", breed: "Treeing Walker Coonhound"),
    Dog(name: "Ramsay", breed: "Native American Indian Dog"),
    Dog(name: "Oscar", breed: "German Shorthaired Pointer"),
    Dog(name: "Comet", breed: "Whippet")
]

struct DogRow: View {
    var dog: Dog
    var selected: Bool

    var body: some View {
        // TODO: How can you control the column widths?
        HStack {
            Text(dog.name).foregroundColor(selected ? .green : .black)
            Spacer()
            Text(String(dog.name.count))
            Spacer()
            Text(dog.breed)
        }
    }
}

struct ContentView: View {
    // @State private var selection: String? // single selection
    @State private var selection = Set<String>() // multiple selection

    func deleteDog() {
        print("in deleteDog")
    }

    var body: some View {
        NavigationView {
            VStack {
                List(dogs, id: \.name, selection: $selection) { dog in
                    DogRow(dog: dog, selected: selection.contains(dog.name))
                }
                // .onDelete(perform: deleteDog)
                .listStyle(.grouped)
                .toolbar {
                    EditButton()
                }
                if !selection.isEmpty {
                    Text("You selected \(selection.joined(separator: ", "))")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
