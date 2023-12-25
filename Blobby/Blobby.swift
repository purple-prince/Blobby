import SwiftUI

struct Blobby: View {
    
    @State var boo: Bool = false
    let segments: Double = 360
    let height: Double = 1.0 // 1.0 gives normal height, heigher height = more amlitude
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
                .brightness(-0.1)
            
            Blob(boo: boo, sides: segments, height: height)
        }
        .onTapGesture { boo.toggle() }
        
    }
}
