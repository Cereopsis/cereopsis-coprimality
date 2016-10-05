// Add license here

struct Coprime {
    
    let m: Int
    let n: Int
    
    init(m: Int, n: Int) {
        self.m = m
        self.n = n
    }
    
    func magnitude() -> Int {
        return m * n
    }
    
    var a: Coprime {
        return Coprime(m: 2 * m + n, n: m)
    }
    
    var b: Coprime {
        return Coprime(m: 2 * m - n, n: m)
    }
    
    // Actually, this one isn't very useful; n is always 1 (at least when passed a properly coprime seed)
    // We could always infer that any number and 1 are coprime
    var c: Coprime {
        return Coprime(m: m + 2 * n, n: n)
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
