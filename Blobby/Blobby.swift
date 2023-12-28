import SwiftUI

struct Blobby: View {
    
    @State var boo: Bool = false
    let segments: Double = 360
    let height: Double = 1.0 // 1.0 gives normal height, heigher height = more amplitude
    let randomness: Double = 0.0000001//1.0 // 0.001
    let density: Double = 0.245 // 1.0 gives normal density, lower value gives less density
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
                .brightness(-0.1)
            
            Blob(boo: boo, sides: segments, height: height, randomness: randomness, density: density)
                .stroke(Color.red, lineWidth: 1.25)
                    .drawingGroup()
                    .frame(width: 200, height: 200)
        }
        .onTapGesture { boo.toggle() }
        
    }
}
