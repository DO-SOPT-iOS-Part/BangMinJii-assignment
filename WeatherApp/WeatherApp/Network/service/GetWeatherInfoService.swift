//
//  GetWeatherInfoService.swift
//  WeatherApp
//
//  Created by 방민지 on 11/15/23.
//
import UIKit

class GetWeatherInfoService {
    static let shared = GetWeatherInfoService()
    private init() {}
     
        func makeRequest(name: String) -> URLRequest {
            let baseURL = Bundle.main.object(forInfoDictionaryKey: Config.Keys.Plist.baseURL) as? String ?? ""
            let myAPI = Bundle.main.object(forInfoDictionaryKey: Config.Keys.Plist.myAPI) as? String ?? ""
            
            let url = URL(string: baseURL + "/data/2.5/weather?q=\(name)&units=metric&lang=kr&&appid=" + myAPI)!
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            let header = ["Content-Type": "application/json"]
            header.forEach {
                request.addValue($0.value, forHTTPHeaderField: $0.key)
            }
            return request
        }
    
        func GetWeatherData(name: String) async throws -> WeatherInfoDataModel? {
            do {
                let request = self.makeRequest(name: name)
                let (data, response) = try await URLSession.shared.data(for: request)
                dump(request)
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw NetworkError.responseError
                }
                dump(response)
                return parseWeatherInfoData(data: data)
            } catch {
                throw error
            }
        }
    
        private func parseWeatherInfoData(data: Data) -> WeatherInfoDataModel? {
            do {
                let jsonDecoder = JSONDecoder()
                let result = try jsonDecoder.decode(WeatherInfoDataModel.self, from: data)
                return result
            } catch {
                print(error)
                return nil
            }
        }
    
        private func configureHTTPError(errorCode: Int) -> Error {
            return NetworkError(rawValue: errorCode)
            ?? NetworkError.unknownError
        }
}
