//dont want to get the size of function over and over
import simd//very optimized math library used by mtl
protocol sizable{//have hte size and the stride of primitive we are using
    static func size(_ count: Int)->Int
    static func stride(_ count: Int)->Int
}
extension sizable{
    static func size()->Int{//return size of 1
        return MemoryLayout<Self>.size
    }
    static func stride()->Int{
        return MemoryLayout<Self>.stride
    }
    static func size(_ count: Int)->Int{//return the size of multiple (input count)
        return MemoryLayout<Self>.size*count
    }
    static func stride(_ count: Int)->Int{
        return MemoryLayout<Self>.stride*count
    }
    //want to make vertex and entension of sizable
  
}
struct Vertex: sizable{//vertex is a sizable object - polymorphism
    var position: SIMD3<Float>
    var color: SIMD4<Float>
}
//will extend on simd3 - does not work
extension SIMD3:sizable{}

