export type AuthCondition = (player: Player) -> boolean

export type Policy = 
    "AreAdsAllowed" |
    "ArePaidRandomItemsRestricted" |
    "AllowedExternalLinkReferences" |
    "IsContentSharingAllowed" |
    "IsEligibleToPurchaseCommerceProduct" |
    "IsEligibleToPurchaseSubscription" |
    "IsPaidItemTradingAllowed" |
    "IsPhotoToAvatarAllowed" |
    "IsSubjectToChinaPolicies"

return {}