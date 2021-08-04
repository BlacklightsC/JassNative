library JAPIItemState
static if REFORGED_MODE then
//Exist: constant native GetItemName takes item whichItem returns string
    native BlzSetItemName takes item whichItem, string name returns nothing
    native BlzSetItemDescription takes item whichItem, string description returns nothing
    native BlzGetItemDescription takes item whichItem returns string
    native BlzSetItemTooltip takes item whichItem, string tooltip returns nothing
    native BlzGetItemTooltip takes item whichItem returns string
    native BlzSetItemExtendedTooltip takes item whichItem, string extendedTooltip returns nothing
    native BlzGetItemExtendedTooltip takes item whichItem returns string
    native BlzSetItemIconPath takes item whichItem, string iconPath returns nothing
    native BlzGetItemIconPath takes item whichItem returns string
else
    native EXGetItemDataString takes integer itemcode, integer data_type returns string
    native EXSetItemDataString takes integer itemcode, integer data_type, string value returns boolean
endif

function JNGetItemName takes item whichItem returns string
    return GetItemName(whichItem)
endfunction

function JNSetItemName takes item whichItem, string name returns nothing
static if REFORGED_MODE then
    call BlzSetItemName(whichItem, name)
else
    call EXSetItemDataString(GetItemTypeId(whichItem), 4, name)
endif
endfunction

function JNSetItemDescription takes item whichItem, string description returns nothing
static if REFORGED_MODE then
    call BlzSetItemDescription(whichItem, description)
else
    call EXSetItemDataString(GetItemTypeId(whichItem), 5, description)
endif
endfunction

function JNGetItemDescription takes item whichItem returns string
static if REFORGED_MODE then
    return BlzGetItemDescription(whichItem)
else
    return EXGetItemDataString(GetItemTypeId(whichItem), 5)
endif
endfunction

function JNSetItemTooltip takes item whichItem, string tooltip returns nothing
static if REFORGED_MODE then
    call BlzSetItemDescription(whichItem, tooltip)
else
    call EXSetItemDataString(GetItemTypeId(whichItem), 2, tooltip)
endif
endfunction

function JNGetItemTooltip takes item whichItem returns string
static if REFORGED_MODE then
    return BlzGetItemDescription(whichItem)
else
    return EXGetItemDataString(GetItemTypeId(whichItem), 2)
endif
endfunction

function JNSetItemExtendedTooltip takes item whichItem, string extendedTooltip returns nothing
static if REFORGED_MODE then
    call BlzSetItemDescription(whichItem, extendedTooltip)
else
    call EXSetItemDataString(GetItemTypeId(whichItem), 3, extendedTooltip)
endif
endfunction

function JNGetItemExtendedTooltip takes item whichItem returns string
static if REFORGED_MODE then
    return BlzGetItemDescription(whichItem)
else
    return EXGetItemDataString(GetItemTypeId(whichItem), 3)
endif
endfunction

function JNSetItemIconPath takes item whichItem, string iconPath returns nothing
static if REFORGED_MODE then
    call BlzSetItemIconPath(whichItem, iconPath)
else
    call EXSetItemDataString(GetItemTypeId(whichItem), 1, iconPath)
endif
endfunction

function JNGetItemIconPath takes item whichItem returns string
static if REFORGED_MODE then
    return BlzGetItemIconPath(whichItem)
else
    return EXGetItemDataString(GetItemTypeId(whichItem), 1)
endif
endfunction

static if not REFORGED_MODE then
    function JNGetItemNameById takes integer itemId returns string
        return GetObjectName(itemId)
    endfunction
    
    function JNSetItemNameById takes integer itemId, string name returns nothing
        call EXSetItemDataString(itemId, 4, name)
    endfunction
    
    function JNSetItemDescriptionById takes integer itemId, string description returns nothing
        call EXSetItemDataString(itemId, 5, description)
    endfunction
    
    function JNGetItemDescriptionById takes integer itemId returns string
        return EXGetItemDataString(itemId, 5)
    endfunction
    
    function JNSetItemTooltipById takes integer itemId, string tooltip returns nothing
        call EXSetItemDataString(itemId, 2, tooltip)
    endfunction
    
    function JNGetItemTooltipById takes integer itemId returns string
        return EXGetItemDataString(itemId, 2)
    endfunction
    
    function JNSetItemExtendedTooltipById takes integer itemId, string extendedTooltip returns nothing
        call EXSetItemDataString(itemId, 3, extendedTooltip)
    endfunction
    
    function JNGetItemExtendedTooltipById takes integer itemId returns string
        return EXGetItemDataString(itemId, 3)
    endfunction
    
    function JNSetItemIconPathById takes integer itemId, string iconPath returns nothing
        call EXSetItemDataString(itemId, 1, iconPath)
    endfunction
    
    function JNGetItemIconPathById takes integer itemId returns string
        return EXGetItemDataString(itemId, 1)
    endfunction
endif
endlibrary