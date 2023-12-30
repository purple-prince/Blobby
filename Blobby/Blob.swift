
//test commit
import Foundation
import SwiftUI

// Main shape
struct Blob: Shape {
    
    let boo: Bool
    let sides: Double
    let height: Double
    let randomness: Double
    let density: Double
    let hollow: Double
    let circleness: Double
    
    var points: [CGPoint] = []
    
    init(boo: Bool, sides: Double, height: Double, randomness: Double, density: Double, hollow: Double, circleness: Double) {
        self.boo = boo
        self.sides = sides
        self.height = height
        self.randomness = randomness
        self.density = density
        self.hollow = hollow
        self.circleness = circleness * 100.0
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
            
            let distance = (sinCalc * 10.0 + 1.0) / circleness + 1.0 // 10.0 is the height
            
            let coords = calculateCoordinatePoint(angleInDegrees: Double(angle), distance: distance)
            
            let x = coords.x * width / 1.5
            let y = coords.y * height / 1.5
            
            points.append(CGPoint(x: x + rect.width / 2, y: y + rect.height / 2))
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
