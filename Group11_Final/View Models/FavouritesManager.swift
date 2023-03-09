//
//  FavouritesManager.swift
//  Group11_Final
//
//  Created by Karan Meghani on 2023-03-08.
//

import Foundation

class FavouritesManager{
    static let shared = FavouritesManager()
    private let defaults = UserDefaults.standard
    private let const = Constants()
     var userFavourites:[String:[String]]
    
    init() {
        self.userFavourites = {
            return UserDefaults.standard.dictionary(forKey: Constants().FAVOURITES_DICT) as? [String:[String]] ?? [:]
        }()
    }
    
    func getUserFavourites() -> [Activity] {
        let currentUserId:String? = AuthManager.shared.getCurrentUserId()
        if(currentUserId != nil){
            userFavourites = {
                return UserDefaults.standard.dictionary(forKey: Constants().FAVOURITES_DICT) as? [String:[String]] ?? [:]
            }()
            let favouritesListIds:[String] = userFavourites[currentUserId!] ?? []
            print(favouritesListIds)
            return convertStringToActivity(idString: favouritesListIds)
        }
        return []
    }
    
    func checkIfFavourite(activityId: String) -> Bool {
        let userFavourites = getUserFavourites()
        return userFavourites.contains{ $0.id == activityId }
    }
    
    private func convertStringToActivity(idString: [String]) -> [Activity] {
        let activitiesList = DataSource.shared.activities
        var matchedArray: [Activity] = []
        for activity in activitiesList {
            for id in idString{
                if(id == activity.id){
                    matchedArray.append(activity)
                }
            }
        }
        return matchedArray
        }
    
    func addToFavourites(actvityId:String) -> Bool {
        let currentUserId:String? = AuthManager.shared.getCurrentUserId()
        if(currentUserId != nil){
            if(checkIfFavourite(activityId: actvityId)){
                return deleteFromFavourites(activityId: actvityId)
            }else{
                var favouritesList:[String] = userFavourites[currentUserId!] ?? []
                favouritesList.append(actvityId)
                userFavourites[currentUserId!] = favouritesList
                defaults.set(userFavourites, forKey: const.FAVOURITES_DICT)
               
            }
            return true
        }
        return false
    }
    
    func deleteFromFavourites(activityId:String) -> Bool {
        let currentUserId:String? = AuthManager.shared.getCurrentUserId()
        if(currentUserId != nil){
            var favouritesList:[String] = userFavourites[currentUserId!] ?? []
            favouritesList.removeAll {$0 == activityId}
            userFavourites[currentUserId!] = favouritesList
            defaults.set(userFavourites, forKey: const.FAVOURITES_DICT)
            return true
        }
        return false
    }
    
}
