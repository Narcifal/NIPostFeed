//
//  NetworkService.swift
//  NIPostFeed
//
//  Created by Denys Niestierov on 30.08.2023.
//

import Foundation
import Alamofire

protocol NetworkServiceProtocol {
    func request<T: Codable>(
        endPoint: EndPoint,
        type: T.Type,
        completion: @escaping (Result<T?, Error>) -> Void
    )
}

final class NetworkService: NetworkServiceProtocol {
    
    //MARK: - Static Constants -
    static let shared = NetworkService()
    
    //MARK: - Life Cycle -
    private init() {}
    
    //MARK: - Internal -
    func request<T: Codable>(
        endPoint: EndPoint,
        type: T.Type,
        completion: @escaping (Result<T?, Error>) -> Void
    ) {
        guard let url = getUrl(endPoint: endPoint) else {
            completion(.failure(RequestError.invalidURL))
            return
        }
        AF.request(
            url,
            method: endPoint.method,
            encoding: endPoint.encoding
        ).responseDecodable(of: type) { response in
            guard response.data != nil else {
                completion(.failure(RequestError.invalidData))
                return
            }
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

private extension NetworkService {
    
    func getUrl(endPoint: EndPoint) -> URL? {
        let completeUrlString = endPoint.completeUrlString()
        guard let url = URL(string: completeUrlString) else {
            return nil
        }
        return url
    }
}

private enum RequestError: Error {
    case invalidURL
    case invalidData
}
