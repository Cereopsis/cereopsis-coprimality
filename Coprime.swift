/*
MIT License

Copyright (c) 2016 Cereopsis

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

struct Coprime {
    
    let m: Int
    let n: Int
    
    init(m: Int, n: Int) {
        self.m = m
        self.n = n
    }
    
    /// Returns product of `m` * `n`
    func product() -> Int {
        return m * n
    }
    
    /// Returns true iff m == 1 || n == 1
    var isIdentity: Bool {
        return m == 1 || n == 1
    }
    
    /// Returns branch 1 (See https://en.wikipedia.org/wiki/Coprime_integers)
    ///
    /// This branch increases less rapidly than 2 and less montonically than 3
    var b0: Coprime {
        return Coprime(m: 2 * m - n, n: m)
        
    }
    
    /// Returns branch 2
    ///
    /// This branch increases rapidly
    var b1: Coprime {
        return Coprime(m: 2 * m + n, n: m)
    }
    
    /// Branch 3
    ///
    /// This branch increases typically by (m + 2 or 3, n), so rather monotonically
    var b2: Coprime {
        return Coprime(m: m + 2 * n, n: n)
    }
    
    func filter(_ predicate: (Coprime) -> Bool) -> [Coprime] {
        return [b0, b1, b2].filter(predicate)
    }
}

extension Coprime: CustomPlaygroundQuickLookable {
    var customPlaygroundQuickLook: PlaygroundQuickLook {
        return PlaygroundQuickLook.text(debugDescription)
    }
}

extension Coprime: CustomDebugStringConvertible {
    var debugDescription: String {
        return "(\(m), \(n))"
    }
}
