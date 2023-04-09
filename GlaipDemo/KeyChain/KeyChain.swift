import Security
import Foundation
func saveStringToKeychain(value: String, key: String) -> Bool {
    if let valueData = value.data(using: .utf8) {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecValueData as String: valueData
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        return status == errSecSuccess
    }
    
    return false
}

func getStringFromKeychain(key: String) -> String? {
    let query: [String: Any] = [
        kSecClass as String: kSecClassGenericPassword,
        kSecAttrAccount as String: key,
        kSecReturnData as String: kCFBooleanTrue!,
        kSecMatchLimit as String: kSecMatchLimitOne
    ]

    var result: AnyObject?
    let status = SecItemCopyMatching(query as CFDictionary, &result)

    if status == errSecSuccess {
        if let data = result as? Data {
            return String(data: data, encoding: .utf8)
        }
    }

    return nil
}

func deleteStringFromKeychain(key: String) -> Bool? {
    let query: [String: Any] = [
        kSecClass as String: kSecClassGenericPassword,
        kSecAttrAccount as String: key
    ]
    let status = SecItemDelete(query as CFDictionary)
    return status == errSecSuccess
}
