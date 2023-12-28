import Foundation
import SwiftUI

// Main shape
struct Blob: Shape {
    
    let boo: Bool
    let sides: Double
    let height: Double
    let randomness: Double
    let density: Double
    
    var points: [CGPoint] = []
    
    init(boo: Bool, sides: Double, height: Double, randomness: Double, density: Double) {
        self.boo = boo
        self.sides = sides
        self.height = height
        self.randomness = randomness
        self.density = density
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.width
        let height = rect.height
        
        var points: [CGPoint] = []
        
        
        for angle in stride(from: 0.0, to: 360, by: 360 / sides) {
            
            let randomFactor = Double.random(in: 1 - randomness..<1 + randomness)
            let modifier1 = sin(angle + 90)
            let modifier2 = cos(angle + 180)
            let sinCalc = (sin(Double(angle * density) + modifier1 + modifier2)  * randomFactor)
            
            points.append(CGPoint(x: 0, y: 0))
        }
        
        let first = points.removeFirst()
        path.move(to: first)
        
        
        for point in points {
            path.addLine(to: point)
        }
        
        
        return path
    }
    
    
    func calculateCoordinatePoint(angleInDegrees: Double, distance: Double) -> (x: Double, y: Double) {
        let angleInRadians = angleInDegrees * Double.pi / 180.0
        let x = distance * cos(angleInRadians)
        let y = distance * sin(angleInRadians)
        return (x, y)
    }
}





