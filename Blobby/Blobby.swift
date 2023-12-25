import SwiftUI

struct Blobby: View {
    var body: some View {
        Blob()
    }
}

func calculateCoordinatePoint(angleInDegrees: Double, distance: Double) -> (x: Double, y: Double) {
    let angleInRadians = angleInDegrees * Double.pi / 180.0
    let x = distance * cos(angleInRadians)
    let y = distance * sin(angleInRadians)
    return (x, y)
}



