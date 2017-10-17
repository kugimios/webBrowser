import UIKit

func verifyUrl (_ urlString: String?) -> Bool {
    let fixedUrlString = urlString
    
    if let urlString = fixedUrlString {
        if let url = URL(string: urlString) {
            return UIApplication.shared.canOpenURL(url)
        }
    }
    return false
}


func goOrSearchURL(
        checkURL: String!,
        searchURLField: String,
        isSearchable: Bool
    ) -> (url: String, isGoing: Bool) {
    
    let isURL = verifyUrl(checkURL)
    
    if isURL == true {
        return (url: checkURL, isGoing: true)
    }
    if isSearchable == true {
        let addedPlus = checkURL.replacingOccurrences(of: " ", with: "+")
        let searchedURL = searchURLField + addedPlus
        return (url: searchedURL, isGoing: true)
    }
    return (url: checkURL, isGoing: false)
}
