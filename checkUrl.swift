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


func goOrSearchURL(_ checkURL: String!) -> String {
    let isURL = verifyUrl(checkURL)
    if isURL == true {
        return checkURL
    }
    let addedPlus = checkURL.replacingOccurrences(of: " ", with: "+")
    let searchedURL = "https://www.google.com.tr/search?q=\(addedPlus)"
    return searchedURL
}
