import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) { // flexDirection: 'column' by default
            Text("Item 1")
                .foregroundColor(.white)
            Text("Item 2")
                .foregroundColor(.white)
        }
        .frame(width: 300, height: 700, alignment: .top) // flex: 1, justifyContent: 'flex-start'
        .background(Color.blue)
    }
}
