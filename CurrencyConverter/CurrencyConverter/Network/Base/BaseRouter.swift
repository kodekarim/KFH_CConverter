//
//  BaseRouter.swift
//  CurrencyConverter
//
//  Created by abdul karim on 20/08/23.
//

import Foundation
import Alamofire

enum BaseRouter: URLRequestConvertible {
    
    case baseRouterManager(APIRouter)
    
    func asURLRequest() throws -> URLRequest {
        switch self {
        case .baseRouterManager(let request):
            let mutableURLRequest = configureRequest(request)
            return mutableURLRequest
        }
    }
    
    /**
     Configuring Request for each of the cases.
     
     - parameter requestObj: An Object of the Router Protocol.
     - Contains Path of the Request.
     - Contains Method GET, POST, PUT
     - Contains Request Parameters
     - Contains Request Body
     
     - returns: <#return value description#>
     */
    
    func configureRequest(_ requestObj: BaseRouterProtocol, urlString : String? = nil) -> URLRequest {
        
        let url = URL(string: APIConstants.baseURL)!
        
        /// Set Request Path
        var mutableURLRequest = URLRequest(url: url.appendingPathComponent(requestObj.path))
        
        /**
         *  Set Request Method
         */
        mutableURLRequest.httpMethod = requestObj.method.rawValue
        
        //Specific headers
        if let headers = requestObj.headers {
            for (key, value) in headers {
                mutableURLRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
        mutableURLRequest.setValue(APIKeys.API_LAYER_KEY, forHTTPHeaderField: "apikey" )
        mutableURLRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        /**
         *  Set Request Body if Method is POST or PUT
         */
//        if requestObj.method == Alamofire.HTTPMethod.post || requestObj.method == Alamofire.HTTPMethod.get || requestObj.method == Alamofire.HTTPMethod.put {
//            if let body = requestObj.body {
//                if let mappableBody = body as? Mappable {
//                    mutableURLRequest.httpBody = mappableBody.toJSONString()?.data(using: String.Encoding.utf8)
//                } else {
//                    if JSONSerialization.isValidJSONObject(body) {
//                        do {
//                            mutableURLRequest.httpBody =
//                                try JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
//                        } catch {
//                        }
//                    }
//                }
//            }
//        }
        //// Set Request Parameters.
        if let parameters: Alamofire.Parameters = requestObj.parameters {
            do {
                return try Alamofire.URLEncoding.queryString.encode(mutableURLRequest as URLRequestConvertible, with: parameters)
            } catch {
            }
        }
        return mutableURLRequest
    }
}
