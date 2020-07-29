//
//  ProfileRequest.swift
//  fibi
//
//  Created by Kyryl Horbushko on 28.07.2020.
//  Copyright © 2020 Kyryl Horbushko. All rights reserved.
//

import Foundation

final class ProfileRequest: FitBitRequest<FitBitProfile, FitBitError> {

  override var HTTPMethod: NetworkRequestType {
    .GET
  }

  override var endPoint: String {
    FitBitEndPoint.Resources.profile
  }
}
