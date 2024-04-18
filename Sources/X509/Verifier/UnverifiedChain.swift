//===----------------------------------------------------------------------===//
//
// This source file is part of the SwiftCertificates open source project
//
// Copyright (c) 2022 Apple Inc. and the SwiftCertificates project authors
// Licensed under Apache License v2.0
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of SwiftCertificates project authors
//
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//

@frozen public struct UnverifiedCertificateChain: Sendable, Hashable {
    @usableFromInline
    var certificates: [Certificate]

    init(_ certificates: [Certificate]) {
        precondition(!certificates.isEmpty)
        self.certificates = certificates
    }

    @inlinable
    public var leaf: Certificate {
        self.certificates.first!
    }
}

extension UnverifiedCertificateChain: RandomAccessCollection {
    @inlinable
    public var startIndex: Int {
        self.certificates.startIndex
    }

    @inlinable
    public var endIndex: Int {
        self.certificates.endIndex
    }

    @inlinable
    public subscript(position: Int) -> Certificate {
        get {
            self.certificates[position]
        }
    }
}
