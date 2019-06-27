# Gausswift

Gausswift provides gaussian (or normal) sampling functions for `Float`, `Double`, `Float80`

Currently it supports two methods.
- [Box–Muller transform](https://en.wikipedia.org/wiki/Box%E2%80%93Muller_transform)
- [Marsaglia polar method](https://en.wikipedia.org/wiki/Marsaglia_polar_method)

## Interface 

```swift
// Default Box-Muller transform & SystemRandomNumberGenerator
Float.randomNormal(mu: mu, sigma: sigma)

// You can use other RNGs
Double.randomNormal(mu: mu, sigma: sigma, using: &yourRNG)

// Specify method
Float80.randomNormal(mu: mu, sigma: sigma, method: .marsagliaPolarMethod)
```