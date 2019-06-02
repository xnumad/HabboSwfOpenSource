//com.sulake.habbo.tablet.inventory.items.FurnitureItem

package com.sulake.habbo.tablet.inventory.items{
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.habbo.communication.messages.incoming.inventory.furni.IFurnitureItemData;

    public class FurnitureItem implements IFurnitureItem {

        private var _expirationTimeStamp:int;
        private var _isWallItem:Boolean;
        private var _songId:int;
        private var _locked:Boolean;
        private var _id:int;
        private var _ref:int;
        private var _furniCategory:int;
        private var _type:int;
        private var _stuffData:IStuffData;
        private var _extra:Number;
        private var _recyclable:Boolean;
        private var _tradeable:Boolean;
        private var _groupable:Boolean;
        private var _sellable:Boolean;
        private var _secondsToExpiration:int;
        private var _hasRentPeriodStarted:Boolean;
        private var _creationDay:int;
        private var _creationMonth:int;
        private var _creationYear:int;
        private var _slotId:String;
        private var _isRented:Boolean;
        private var _flatId:int;

        public function FurnitureItem(k:IFurnitureItemData);

        public function get isRented():Boolean;

        public function get id():int;

        public function get ref():int;

        public function get furniCategory():int;

        public function get type():int;

        public function get stuffData():IStuffData;

        public function set stuffData(k:IStuffData):void;

        public function get extra():Number;

        public function get recyclable():Boolean;

        public function get tradeable():Boolean;

        public function get groupable():Boolean;

        public function get sellable():Boolean;

        public function get secondsToExpiration():int;

        public function get creationDay():int;

        public function get creationMonth():int;

        public function get creationYear():int;

        public function get slotId():String;

        public function get songId():int;

        public function get locked():Boolean;

        public function set locked(k:Boolean):void;

        public function get flatId():int;

        public function get isWallItem():Boolean;

        public function get hasRentPeriodStarted():Boolean;

        public function get expirationTimeStamp():int;

        public function update(k:IFurnitureItemData):void;


    }
}//package com.sulake.habbo.tablet.inventory.items

