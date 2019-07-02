import Foundation

public enum GaussianSamplingMethod {
    case boxMullerTransform
    case marsagliaPolarMethod
}

// TODO: Replace with `ElementaryFunctions`
// https://github.com/apple/swift-evolution/blob/master/proposals/0246-mathable.md
@usableFromInline
protocol GaussianSamplingFloatingPoint: BinaryFloatingPoint {
    static func log(_ x: Self) -> Self
    static func cos(_ x: Self) -> Self
}

extension Float: GaussianSamplingFloatingPoint {
    @inlinable
    static func log(_ x: Float) -> Float {
        return logf(x)
    }
    
    @inlinable
    static func cos(_ x: Float) -> Float {
        return cosf(x)
    }
}

extension Double: GaussianSamplingFloatingPoint {
    @inlinable
    static func log(_ x: Double) -> Double {
        return Foundation.log(x)
    }
    
    @inlinable
    static func cos(_ x: Double) -> Double {
        return Foundation.cos(x)
    }
}

extension CGFloat: GaussianSamplingFloatingPoint {
    @inlinable
    static func log(_ x: CGFloat) -> CGFloat {
        return Foundation.log(x)
    }
    
    @inlinable
    static func cos(_ x: CGFloat) -> CGFloat {
        return Foundation.cos(x)
    }
}

extension Float80: GaussianSamplingFloatingPoint {
    @inlinable
    static func log(_ x: Float80) -> Float80 {
        return Foundation.log(x)
    }
    
    @inlinable
    static func cos(_ x: Float80) -> Float80 {
        return Foundation.cos(x)
    }
}

extension GaussianSamplingFloatingPoint where RawSignificand: FixedWidthInteger {
    @inlinable
    static func _randomNormal<RNG: RandomNumberGenerator>(mu: Self,
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
            
            let gauss = (-2 * log(x)).squareRoot() * Self.cos(.pi * y)
            
            return sigma * gauss + mu
        case .marsagliaPolarMethod:
            var (x, y, s): (Self, Self, Self)
            
            repeat {
                x = .random(in: -1..<1, using: &generator)
                y = .random(in: -1..<1, using: &generator)
                s = x*x + y*y
            } while s == 0 || 1 <= s
            
            let gauss = x * (-2 * log(s) / s).squareRoot()
            
            return sigma * gauss + mu
        }
    }
    
    @inlinable
    static func _randomNormal(mu: Self,
                              sigma: Self,
                              method: GaussianSamplingMethod = .boxMullerTransform) -> Self {
        var rng = SystemRandomNumberGenerator()
        return _randomNormal(mu: mu, sigma: sigma, using: &rng, method: method)
    }
}

extension Float {
    @inlinable
    public static func randomNormal<RNG: RandomNumberGenerator>(mu: Float,
                                                                sigma: Float,
                                                                using generator: inout RNG,
                                                                method: GaussianSamplingMethod = .boxMullerTransform) -> Float {
        return _randomNormal(mu: mu, sigma: sigma, using: &generator, method: method)
    }
    
    @inlinable
    static func randomNormal(mu: Float,
                             sigma: Float,
                             method: GaussianSamplingMethod = .boxMullerTransform) -> Float {
        var rng = SystemRandomNumberGenerator()
        return _randomNormal(mu: mu, sigma: sigma, using: &rng, method: method)
    }
}

extension Double {
    @inlinable
    public static func randomNormal<RNG: RandomNumberGenerator>(mu: Double,
                                                                sigma: Double,
                                                                using generator: inout RNG,
                                                                method: GaussianSamplingMethod = .boxMullerTransform) -> Double {
        return _randomNormal(mu: mu, sigma: sigma, using: &generator, method: method)
    }
    
    @inlinable
    static func randomNormal(mu: Double,
                             sigma: Double,
                             method: GaussianSamplingMethod = .boxMullerTransform) -> Double {
        var rng = SystemRandomNumberGenerator()
        return _randomNormal(mu: mu, sigma: sigma, using: &rng, method: method)
    }
}

extension CGFloat {
    @inlinable
    public static func randomNormal<RNG: RandomNumberGenerator>(mu: CGFloat,
                                                                sigma: CGFloat,
                                                                using generator: inout RNG,
                                                                method: GaussianSamplingMethod = .boxMullerTransform) -> CGFloat {
        return _randomNormal(mu: mu, sigma: sigma, using: &generator, method: method)
    }
    
    @inlinable
    static func randomNormal(mu: CGFloat,
                             sigma: CGFloat,
                             method: GaussianSamplingMethod = .boxMullerTransform) -> CGFloat {
        var rng = SystemRandomNumberGenerator()
        return _randomNormal(mu: mu, sigma: sigma, using: &rng, method: method)
    }
}

extension Float80 {
    @inlinable
    public static func randomNormal<RNG: RandomNumberGenerator>(mu: Float80,
                                                                sigma: Float80,
                                                                using generator: inout RNG,
                                                                method: GaussianSamplingMethod = .boxMullerTransform) -> Float80 {
        return _randomNormal(mu: mu, sigma: sigma, using: &generator, method: method)
    }
    
    @inlinable
    static func randomNormal(mu: Float80,
                             sigma: Float80,
                             method: GaussianSamplingMethod = .boxMullerTransform) -> Float80 {
        var rng = SystemRandomNumberGenerator()
        return _randomNormal(mu: mu, sigma: sigma, using: &rng, method: method)
    }
}
