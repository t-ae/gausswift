import Foundation

public enum GaussianSamplingMethod {
    case boxMullerTransform
    case marsagliaPolarMethod
    
}

public protocol GaussianSamplingFloatingPoint: BinaryFloatingPoint {
    static func log(_ x: Self) -> Self
    static func cos(_ x: Self) -> Self
}

extension Float: GaussianSamplingFloatingPoint {
    public static func log(_ x: Float) -> Float {
        return logf(x)
    }
    
    public static func cos(_ x: Float) -> Float {
        return cosf(x)
    }
}

extension Double: GaussianSamplingFloatingPoint {
    public static func log(_ x: Double) -> Double {
        return Foundation.log(x)
    }
    
    public static func cos(_ x: Double) -> Double {
        return Foundation.cos(x)
    }
}

extension Float80: GaussianSamplingFloatingPoint {
    public static func log(_ x: Float80) -> Float80 {
        return Foundation.log(x)
    }
    
    public static func cos(_ x: Float80) -> Float80 {
        return Foundation.cos(x)
    }
}

extension GaussianSamplingFloatingPoint where RawSignificand: FixedWidthInteger {
    @inlinable
    public static func randomNormal<RNG: RandomNumberGenerator>(mu: Self,
                                                                sigma: Self,
                                                                using generator: inout RNG,
                                                                method: GaussianSamplingMethod = .boxMullerTransform) -> Self {
        switch method {
        case .boxMullerTransform:
            var (x, y): (Self, Self)
            repeat {
                x = .random(in: 0..<1, using: &generator)
                y = .random(in: 0..<2, using: &generator)
            } while x == 0 || y == 0
            
            let gauss = (-2 * Self.log(x)).squareRoot() * Self.cos(.pi * y)
            
            return sigma * gauss + mu
        case .marsagliaPolarMethod:
            var (x, y, s): (Self, Self, Self)
            
            repeat {
                x = .random(in: -1..<1)
                y = .random(in: -1..<1)
                s = x*x + y*y
            } while s > 1
            
            let gauss = x * (-2 * log(s) / s).squareRoot()
            
            return sigma * gauss + mu
        }
    }
    
    @inlinable
    public static func randomNormal(mu: Self,
                                    sigma: Self,
                                    method: GaussianSamplingMethod = .boxMullerTransform) -> Self {
        var rng = SystemRandomNumberGenerator()
        return randomNormal(mu: mu, sigma: sigma, using: &rng, method: method)
    }
}
