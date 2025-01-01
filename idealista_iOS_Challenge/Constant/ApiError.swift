//
//  ApiError.swift
//  idealista_iOS_Challenge
//
//  Created by Manuel Cazalla Colmenero on 1/1/25.
//

import Foundation

public enum APIError: Error {
    case malformedURL
    case noData
    case decodingFailed
    case unknown
}
