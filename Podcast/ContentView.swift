// This is a demo of @Binding to an @State variable

import SwiftUI

// This is the main view, that calls a child view (PlayButton) below.
struct ContentView : View {
    
    // isPlaying is a private state variable that is declared in the parent view. It causes the foreground color of a view to change color conditionally.
    @State private var isPlaying: Bool = false
    
    let episode = Episode(name: "Serial", track: "Season 2: US Legal System")
    
    var body: some View {
        VStack {
            // The text view below reads the state variable and displays green or black foreground color.
            Text(episode.name)
            .font(.title)
                .foregroundColor(self.isPlaying ? .green : .black)
            
            Text(episode.track)
            .foregroundColor(.secondary)
            
            // PlayButton view below is the child view, that is called within the main view. When user clicks on the playbutton, we need the state in the parent view to change. But there is no need for the playbutton itself to have any state. So in this case, we pass playbutton the state variable as a bound variable. It doesn't have to be called isPlaying. Could be (isOn: $isPlaying) for instance. This now allows a UI interaction in playbutton to pass back into the parent view and mutate state.
            PlayButton(isPlaying: $isPlaying)
        }
        
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
