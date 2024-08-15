//
//  SearchByCriteriaModel.swift
//  iOSProjectShaadi
//
//  Created by Supriya Gunda on 15/08/24.
//

import Foundation

enum Criteria: CaseIterable {
    case ageGroup
    case lookingFor
    case height
    case maritalStatus
    case children
    case religion
    case motherTongue
    case annualIncome
    case country
    case residentialStatus
    case showMe
    
    var title: String {
        switch self {
        case .ageGroup:
            return "Looking for Age Group"
        case .lookingFor:
            return "Looking For"
        case .height:
            return "Height"
        case .maritalStatus:
            return "Marital Status"
        case .children:
            return "Have Children's"
        case .religion:
            return "Religion"
        case .motherTongue:
            return "Mother Tongue"
        case .annualIncome:
            return "Annual Income"
        case .country:
            return "Country"
        case .residentialStatus:
            return "Residential Status"
        case .showMe:
            return "Show Me"
        }
    }
    
    var tags: [String] {
        switch self {
        case .ageGroup, .height, .annualIncome, .motherTongue, .country:
            return []
        case .lookingFor:
            return ["Bride", "Groom"]
        case .maritalStatus:
            return ["Never Married", "Awaiting Divorce", "Divorced",  "Married", "Widowed", "Annulled"]
        case .children:
            return ["Doesn’t Matter", "No"," Living Seperately", "Yes", "Living Together"]
        case .religion:
            return ["Hindu", "Muslim", "Sikh", "Christian", "Buddhist", "Jain", "Parsi", "Jewish", "Bahai"]
        case .residentialStatus:
            return ["Citizen","Permanent Resident","Work Permit", "Student Visa", "Temporary Visa"]
        case .showMe:
            return ["All Profiles", "Profile with Photos"]
        }
    }
    
    var value: String {
        switch self {
        case .ageGroup:
            return "18 Years - 35 Years"
        case .height:
            return "4’0’’ - 7’"
        case .annualIncome:
            return "Rs. 0 - and Above"
        case .motherTongue:
            return "Doesn’t Matter"
        case .country:
            return "India"
        default:
            return ""
        }
        
    }
}
