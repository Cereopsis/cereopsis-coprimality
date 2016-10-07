//
//  CoprimeTests.swift
//  CoprimeTests
//
//  Created by John Walker on 07/10/2016.
//
//

import XCTest

class CoprimeTests: XCTestCase {
    
    let seed = [Coprime(m: 2, n: 1), Coprime(m: 3, n: 1)]
    
    
    func testCoprimesLessThan100() {
        let coprimes = sequence(first: seed, next: { cp in
            if cp.isEmpty {
                return nil
            }
            return cp.flatMap{
                $0.filter{ a in a.product() < 100 && !a.isIdentity  }
            }
        })
            .flatMap({ $0 }) // flatten
            .suffix(from: 2) // drop our seed
        
        XCTAssertEqual(67, coprimes.count)
    }
    
    
}

