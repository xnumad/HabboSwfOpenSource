//com.sulake.habbo.communication.messages.incoming.inventory.furni.IFurnitureItemData

package com.sulake.habbo.communication.messages.incoming.inventory.furni{
    import com.sulake.habbo.room.IStuffData;

    public /*dynamic*/ interface IFurnitureItemData {

        function get itemId():int;
        function get itemType():String;
        function get roomItemId():int;
        function get itemTypeId():int;
        function get furniCategory():int;
        function get stuffData():IStuffData;
        function get isGroupable():Boolean;
        function get isRecyclable():Boolean;
        function get isTradeable():Boolean;
        function get isSellable():Boolean;
        function get secondsToExpiration():int;
        function get flatId():int;
        function get slotId():String;
        function get songId():int;
        function get extra():int;
        function get isRented():Boolean;
        function get isWallItem():Boolean;
        function get hasRentPeriodStarted():Boolean;
        function get expirationTimeStamp():int;
        function get creationDay():int;
        function get creationMonth():int;
        function get creationYear():int;
        function get isExternalImageFurni():Boolean;

    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.furni

