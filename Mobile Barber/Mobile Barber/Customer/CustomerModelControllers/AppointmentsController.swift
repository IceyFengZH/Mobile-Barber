
import Foundation

class AppointmentsController {
    
    func fetchAppointments(completion: @escaping (Result<[Appointment], Error>) -> Void) {
        let url = baseURL + "/Appointments"
        var urlComponents = URLComponents(string: url)!
        urlComponents.queryItems = [
//           example header keys
            "api_key": "DEMO_KEY"
        ].map {
            URLQueryItem(name: $0.key, value: $0.value)
        }
         
        let task = URLSession.shared.dataTask(with: urlComponents.url!) {
            data, response, error in
            let jsonDecoder = JSONDecoder()
            if let data = data {
                do {
                    let appointments = try jsonDecoder.decode(Array<Appointment>.self, from: data)
                    completion(.success(appointments))
                } catch  {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
}