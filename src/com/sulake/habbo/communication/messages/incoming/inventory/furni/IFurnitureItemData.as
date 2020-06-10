package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
    import com.sulake.habbo.room.IStuffData;

    public interface IFurnitureItemData 
    {
        function get itemId():int;
        function get furniType():String;
        function get ref():int;
        function get spriteId():int;
        function get category():int;
        function get stuffData():IStuffData;
        function get isGroupable():Boolean;
        function get isRecycleable():Boolean;
        function get tradable():Boolean;
        function get sellable():Boolean;
        function get secondsToExpiration():int;
        function get flatId():int;
        function get slotId():String;
        function get songId():int;
        function get _Str_2794():int;
        function get rentable():Boolean;
        function get isWallItem():Boolean;
        function get hasRentPeriodStarted():Boolean;
        function get expirationTimeStamp():int;
        function get creationDay():int;
        function get creationMonth():int;
        function get creationYear():int;
        function get isExternalImageFurni():Boolean;
    }
}
