
import Foundation

class AppointmentsController {
    
    func fetchAppointments(completion: @escaping (Result<[Appointment], Error>) -> Void) {
//        let urlString = baseURL + "/Appointments"
        let urlString = "https://raw.githubusercontent.com/GuangzheWen/Mobile-Barber/main/Sample%20data/appointmentsSampleData.json"

        var urlComponents = URLComponents(string: urlString)!
//        urlComponents.queryItems = [
////           example header keys
//            "api_key": "DEMO_KEY"
//        ].map {
//            URLQueryItem(name: $0.key, value: $0.value)
//        }
        
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
    
    func pushAppointments(appointments: [Appointment], completion: @escaping (Result<[Appointment], Error>)->Void) {
        let urlString = baseURL + "pushAppointment"
        
        var urlComponents = URLComponents(string: urlString)!
//        urlComponents.queryItems = [
////           example header keys
//            "api_key": "DEMO_KEY"
//        ].map {
//            URLQueryItem(name: $0.key, value: $0.value)
//        }
        let jsonEncoder = JSONEncoder()
        let data = try? jsonEncoder.encode(appointments)
        let urlRequest = URLRequest(url: urlComponents.url!)
        let pushTask = URLSession.shared.uploadTask(with: urlRequest, from: data!)
        
        pushTask.resume()
    }
    
}
