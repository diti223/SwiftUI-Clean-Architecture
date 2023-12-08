//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 10.06.2023.
//

import Foundation

public typealias AsyncFetcher<Output> = AsyncUseCase<Void, Output>
public typealias AsyncSender<Input> = AsyncUseCase<Input, Void>
public typealias AsyncVoid = AsyncUseCase<Void, Void>

extension AsyncUseCase where Input == Void {
    
    public init(_ block: @escaping () async throws -> Output) {
        self.block = { _ in try await block() }
    }
    
    @discardableResult
    public func execute() async throws -> Output {
        try await block(Void())
    }
}

public struct AsyncUseCase<Input, Output> {
    let block: (Input) async throws -> Output
    
    public init(_ block: @escaping (Input) async throws -> Output) {
        self.block = block
    }
    
    @discardableResult
    public func execute(_ input: Input) async throws -> Output {
        try await block(input)
    }
}

extension AsyncUseCase {
    public func makeFetcher(input: Input) -> AsyncFetcher<Output> {
        .init {
            try await execute(input)
        }
    }
}
