//
//  GetRandomFoodTenantIntentHandler.swift
//  Pick a Bite Watch Intent
//
//  Created by Abimanyu Damarjati on 19/05/25.
//

import Foundation

class GetRandomFoodTenantIntentHandler: NSObject, GetRandomFoodTenantIntentHandling {
    func handle(intent: GetRandomFoodTenantIntent, completion: @escaping (GetRandomFoodTenantIntentResponse) -> Void) {
        let response = GetRandomFoodTenantIntentResponse(code: .continueInApp, userActivity: nil)

        print("YAK")
        completion(response)
    }
}
