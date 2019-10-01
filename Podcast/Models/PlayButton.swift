import SwiftUI

struct PlayButton : View {
    
    // The @Binding notation in the child view indicates that it received this variable from a parent and can change the variable. The variable can be named anything. For instance, if we passed it in from the parent as (isOn: $isPlaying), then in the child view, it would be declared as @Binding var isOn: Bool
    @Binding var isPlaying: Bool
    
    var body: some View {
        Button(action: {
            // The toggle action sets the value of the isPlaying variable, which in turn sends it up to the parent since it's a bound variable.
            self.isPlaying.toggle()
        }) {
            Text(isPlaying ? "Pause" : "Play")
        }.padding(12)
    }
}

#if DEBUG
struct PlayButton_Previews : PreviewProvider {
    static var previews: some View {
        PlayButton(isPlaying: .constant(true))
    }
}
#endif
