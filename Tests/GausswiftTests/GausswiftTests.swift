import XCTest
@testable import Gausswift

final class GausswiftTests: XCTestCase {
    func testDistribution_float_box_muller() {
        typealias T = Float
        let method = GaussianSamplingMethod.boxMullerTransform
        
        do {
            let mu: T = 0
            let sigma: T = 1
            
            var array = [T]()
            
            for _ in 0..<1_000_000 {
                array.append(T.randomNormal(mu: mu, sigma: sigma, method: method))
            }
            
            let sum = array.reduce(0, +)
            let sum2 = array.reduce(0) { acc, v in acc + v*v }
            let mean = sum / T(array.count)
            let std = sqrt(sum2 / T(array.count) - mean*mean)
            
            XCTAssertEqual(mean, mu, accuracy: 1e-2)
            XCTAssertEqual(std, sigma, accuracy: 1e-2)
        }
        do {
            let mu: T = 3
            let sigma: T = 4
            
            var array = [T]()
            
            for _ in 0..<1_000_000 {
                array.append(T.randomNormal(mu: mu, sigma: sigma, method: method))
            }
            
            let sum = array.reduce(0, +)
            let sum2 = array.reduce(0) { acc, v in acc + v*v }
            let mean = sum / T(array.count)
            let std = sqrt(sum2 / T(array.count) - mean*mean)
            
            XCTAssertEqual(mean, mu, accuracy: 1e-2)
            XCTAssertEqual(std, sigma, accuracy: 1e-2)
        }
    }
    
    func testDistribution_float_marsaglia() {
        typealias T = Float
        let method = GaussianSamplingMethod.marsagliaPolarMethod
        
        do {
            let mu: T = 0
            let sigma: T = 1
            
            var array = [T]()
            
            for _ in 0..<1_000_000 {
                array.append(T.randomNormal(mu: mu, sigma: sigma, method: method))
            }
            
            let sum = array.reduce(0, +)
            let sum2 = array.reduce(0) { acc, v in acc + v*v }
            let mean = sum / T(array.count)
            let std = sqrt(sum2 / T(array.count) - mean*mean)
            
            XCTAssertEqual(mean, mu, accuracy: 1e-2)
            XCTAssertEqual(std, sigma, accuracy: 1e-2)
        }
        do {
            let mu: T = 3
            let sigma: T = 4
            
            var array = [T]()
            
            for _ in 0..<1_000_000 {
                array.append(T.randomNormal(mu: mu, sigma: sigma, method: method))
            }
            
            let sum = array.reduce(0, +)
            let sum2 = array.reduce(0) { acc, v in acc + v*v }
            let mean = sum / T(array.count)
            let std = sqrt(sum2 / T(array.count) - mean*mean)
            
            XCTAssertEqual(mean, mu, accuracy: 1e-2)
            XCTAssertEqual(std, sigma, accuracy: 1e-2)
        }
    }
    
    func testDistribution_double_box_muller() {
        typealias T = Double
        let method = GaussianSamplingMethod.boxMullerTransform
        
        do {
            let mu: T = 0
            let sigma: T = 1
            
            var array = [T]()
            
            for _ in 0..<1_000_000 {
                array.append(T.randomNormal(mu: mu, sigma: sigma, method: method))
            }
            
            let sum = array.reduce(0, +)
            let sum2 = array.reduce(0) { acc, v in acc + v*v }
            let mean = sum / T(array.count)
            let std = sqrt(sum2 / T(array.count) - mean*mean)
            
            XCTAssertEqual(mean, mu, accuracy: 1e-2)
            XCTAssertEqual(std, sigma, accuracy: 1e-2)
        }
        do {
            let mu: T = 3
            let sigma: T = 4
            
            var array = [T]()
            
            for _ in 0..<1_000_000 {
                array.append(T.randomNormal(mu: mu, sigma: sigma, method: method))
            }
            
            let sum = array.reduce(0, +)
            let sum2 = array.reduce(0) { acc, v in acc + v*v }
            let mean = sum / T(array.count)
            let std = sqrt(sum2 / T(array.count) - mean*mean)
            
            XCTAssertEqual(mean, mu, accuracy: 1e-2)
            XCTAssertEqual(std, sigma, accuracy: 1e-2)
        }
    }
    
    func testDistribution_double_marsaglia() {
        typealias T = Double
        let method = GaussianSamplingMethod.marsagliaPolarMethod
        
        do {
            let mu: T = 0
            let sigma: T = 1
            
            var array = [T]()
            
            for _ in 0..<1_000_000 {
                array.append(T.randomNormal(mu: mu, sigma: sigma, method: method))
            }
            
            let sum = array.reduce(0, +)
            let sum2 = array.reduce(0) { acc, v in acc + v*v }
            let mean = sum / T(array.count)
            let std = sqrt(sum2 / T(array.count) - mean*mean)
            
            XCTAssertEqual(mean, mu, accuracy: 1e-2)
            XCTAssertEqual(std, sigma, accuracy: 1e-2)
        }
        do {
            let mu: T = 3
            let sigma: T = 4
            
            var array = [T]()
            
            for _ in 0..<1_000_000 {
                array.append(T.randomNormal(mu: mu, sigma: sigma, method: method))
            }
            
            let sum = array.reduce(0, +)
            let sum2 = array.reduce(0) { acc, v in acc + v*v }
            let mean = sum / T(array.count)
            let std = sqrt(sum2 / T(array.count) - mean*mean)
            
            XCTAssertEqual(mean, mu, accuracy: 1e-2)
            XCTAssertEqual(std, sigma, accuracy: 1e-2)
        }
    }
    
    func testDistribution_cgfloat_box_muller() {
        typealias T = CGFloat
        let method = GaussianSamplingMethod.boxMullerTransform
        
        do {
            let mu: T = 0
            let sigma: T = 1
            
            var array = [T]()
            
            for _ in 0..<1_000_000 {
                array.append(T.randomNormal(mu: mu, sigma: sigma, method: method))
            }
            
            let sum = array.reduce(0, +)
            let sum2 = array.reduce(0) { acc, v in acc + v*v }
            let mean = sum / T(array.count)
            let std = sqrt(sum2 / T(array.count) - mean*mean)
            
            XCTAssertEqual(mean, mu, accuracy: 1e-2)
            XCTAssertEqual(std, sigma, accuracy: 1e-2)
        }
        do {
            let mu: T = 3
            let sigma: T = 4
            
            var array = [T]()
            
            for _ in 0..<1_000_000 {
                array.append(T.randomNormal(mu: mu, sigma: sigma, method: method))
            }
            
            let sum = array.reduce(0, +)
            let sum2 = array.reduce(0) { acc, v in acc + v*v }
            let mean = sum / T(array.count)
            let std = sqrt(sum2 / T(array.count) - mean*mean)
            
            XCTAssertEqual(mean, mu, accuracy: 1e-2)
            XCTAssertEqual(std, sigma, accuracy: 1e-2)
        }
    }
    
    func testDistribution_cgfloat_marsaglia() {
        typealias T = CGFloat
        let method = GaussianSamplingMethod.marsagliaPolarMethod
        
        do {
            let mu: T = 0
            let sigma: T = 1
            
            var array = [T]()
            
            for _ in 0..<1_000_000 {
                array.append(T.randomNormal(mu: mu, sigma: sigma, method: method))
            }
            
            let sum = array.reduce(0, +)
            let sum2 = array.reduce(0) { acc, v in acc + v*v }
            let mean = sum / T(array.count)
            let std = sqrt(sum2 / T(array.count) - mean*mean)
            
            XCTAssertEqual(mean, mu, accuracy: 1e-2)
            XCTAssertEqual(std, sigma, accuracy: 1e-2)
        }
        do {
            let mu: T = 3
            let sigma: T = 4
            
            var array = [T]()
            
            for _ in 0..<1_000_000 {
                array.append(T.randomNormal(mu: mu, sigma: sigma, method: method))
            }
            
            let sum = array.reduce(0, +)
            let sum2 = array.reduce(0) { acc, v in acc + v*v }
            let mean = sum / T(array.count)
            let std = sqrt(sum2 / T(array.count) - mean*mean)
            
            XCTAssertEqual(mean, mu, accuracy: 1e-2)
            XCTAssertEqual(std, sigma, accuracy: 1e-2)
        }
    }
    
    func testBoxMullerPerformance() {
        measure {
            var sum: Double = 0
            for _ in 0..<1_000_000 {
                sum += Double.randomNormal(mu: 0, sigma: 1, method: .boxMullerTransform)
            }
            XCTAssertTrue(sum != 0)
        }
    }
    
    func testMarsagliaPerformance() {
        measure {
            var sum: Double = 0
            for _ in 0..<1_000_000 {
                sum += Double.randomNormal(mu: 0, sigma: 1, method: .marsagliaPolarMethod)
            }
            XCTAssertTrue(sum != 0)
        }
    }
    
    static var allTests = [
        ("testDistribution_float_box_muller", testDistribution_float_box_muller),
        ("testDistribution_float_marsaglia", testDistribution_float_marsaglia),
        ("testDistribution_double_box_muller", testDistribution_double_box_muller),
        ("testDistribution_double_marsaglia", testDistribution_double_marsaglia),
        ("testDistribution_cgfloat_box_muller", testDistribution_cgfloat_box_muller),
        ("testDistribution_cgfloat_marsaglia", testDistribution_cgfloat_marsaglia),
    ]
}
