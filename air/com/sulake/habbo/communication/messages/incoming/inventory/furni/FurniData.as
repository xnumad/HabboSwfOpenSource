//com.sulake.habbo.communication.messages.incoming.inventory.furni.FurniData

package com.sulake.habbo.communication.messages.incoming.inventory.furni{
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class FurniData implements IFurnitureItemData {

        private static const STRIP_TYPE_WALLITEM:String;
        private static const STRIP_TYPE_ROOMITEM:String;

        private var _isRented:Boolean;
        private var _itemId:int;
        private var _itemType:String;
        private var _roomItemId:int;
        private var _itemTypeId:int;
        private var _furniCategory:int;
        private var _stuffData:IStuffData;
        private var _isGroupable:Boolean;
        private var _isRecyclable:Boolean;
        private var _isTradeable:Boolean;
        private var _isSellable:Boolean;
        private var _secondsToExpiration:int;
        private var _extra:int;
        private var _flatId:int;
        private var _isWallItem:Boolean;
        private var _hasRentPeriodStarted:Boolean;
        private var _expirationTimeStamp:int;
        private var _slotId:String;
        private var _songId:int;

        public function FurniData(k:IMessageDataWrapper);

        public function get itemId():int;

        public function get itemType():String;

        public function get roomItemId():int;

        public function get itemTypeId():int;

        public function get furniCategory():int;

        public function get stuffData():IStuffData;

        public function get isGroupable():Boolean;

        public function get isRecyclable():Boolean;

        public function get isTradeable():Boolean;

        public function get isSellable():Boolean;

        public function get secondsToExpiration():int;

        public function get flatId():int;

        public function get slotId():String;

        public function get songId():int;

        public function get extra():int;

        public function get isRented():Boolean;

        public function get isWallItem():Boolean;

        public function get hasRentPeriodStarted():Boolean;

        public function get expirationTimeStamp():int;

        public function get creationDay():int;

        public function get creationMonth():int;

        public function get creationYear():int;

        public function get isExternalImageFurni():Boolean;


    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.furni

