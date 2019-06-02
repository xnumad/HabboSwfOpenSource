//com.sulake.habbo.communication.messages.incoming.inventory.trading.ItemDataStructure

package com.sulake.habbo.communication.messages.incoming.inventory.trading{
    import com.sulake.habbo.communication.messages.incoming.inventory.furni.IFurnitureItemData;
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class ItemDataStructure implements IFurnitureItemData {

        private var _expirationTimeStamp:int;
        private var _isWallItem:Boolean;
        private var _itemId:int;
        private var _itemType:String;
        private var _roomItemId:int;
        private var _itemTypeId:int;
        private var _furniCategory:int;
        private var _stuffData:IStuffData;
        private var _extra:int;
        private var _secondsToExpiration:int;
        private var _creationDay:int;
        private var _creationMonth:int;
        private var _creationYear:int;
        private var _isGroupable:Boolean;
        private var _songId:int;
        private var _flatId:int;
        private var _isRented:Boolean;
        private var _hasRentPeriodStarted:Boolean;

        public function ItemDataStructure(k:IMessageDataWrapper);

        public function get itemId():int;

        public function get itemType():String;

        public function get roomItemId():int;

        public function get itemTypeId():int;

        public function get furniCategory():int;

        public function get stuffData():IStuffData;

        public function get extra():int;

        public function get secondsToExpiration():int;

        public function get creationDay():int;

        public function get creationMonth():int;

        public function get creationYear():int;

        public function get isGroupable():Boolean;

        public function get songId():int;

        public function get flatId():int;

        public function get isRented():Boolean;

        public function get isWallItem():Boolean;

        public function get hasRentPeriodStarted():Boolean;

        public function get expirationTimeStamp():int;

        public function get isRecyclable():Boolean;

        public function get isTradeable():Boolean;

        public function get isSellable():Boolean;

        public function get slotId():String;

        public function get isExternalImageFurni():Boolean;


    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.trading

