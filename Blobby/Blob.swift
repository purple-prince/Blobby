import Foundation
import SwiftUI

// Main shape
struct Blob: Shape {
    
    let boo: Bool
    let sides: Double
    let height: Double
    
    init(boo: Bool, sides: Double, height: Double) {
        self.boo = boo
        self.sides = sides
        self.height = height
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.width
        let height = rect.height
        
        var points: [CGPoint] = []
        
        return path
    }
    
    
    func calculateCoordinatePoint(angleInDegrees: Double, distance: Double) -> (x: Double, y: Double) {
        let angleInRadians = angleInDegrees * Double.pi / 180.0
        let x = distance * cos(angleInRadians)
        let y = distance * sin(angleInRadians)
        return (x, y)
    }
}



