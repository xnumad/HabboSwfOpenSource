package com.sulake.habbo.inventory.items
{
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.habbo.communication.messages.incoming.inventory.furni.IFurnitureItemData;
    import flash.utils.getTimer;

    public class FurnitureItem implements IFurnitureItem 
    {
        private var _expirationTimeStamp:int;
        private var _isWallItem:Boolean;
        private var _songId:int;
        private var _locked:Boolean;
        private var _id:int;
        private var _ref:int;
        private var _category:int;
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

        public function FurnitureItem(k:IFurnitureItemData)
        {
            this._id = k.itemId;
            this._type = k.spriteId;
            this._ref = k.ref;
            this._category = k.category;
            this._groupable = ((k.isGroupable) && (!(k.rentable)));
            this._tradeable = k.tradable;
            this._recyclable = k.isRecycleable;
            this._sellable = k.sellable;
            this._stuffData = k.stuffData;
            this._extra = k._Str_2794;
            this._secondsToExpiration = k.secondsToExpiration;
            this._expirationTimeStamp = k.expirationTimeStamp;
            this._hasRentPeriodStarted = k.hasRentPeriodStarted;
            this._creationDay = k.creationDay;
            this._creationMonth = k.creationMonth;
            this._creationYear = k.creationYear;
            this._slotId = k.slotId;
            this._songId = k.songId;
            this._flatId = k.flatId;
            this._isRented = k.rentable;
            this._isWallItem = k.isWallItem;
        }

        public function get rentable():Boolean
        {
            return this._isRented;
        }

        public function get id():int
        {
            return this._id;
        }

        public function get ref():int
        {
            return this._ref;
        }

        public function get category():int
        {
            return this._category;
        }

        public function get type():int
        {
            return this._type;
        }

        public function get stuffData():IStuffData
        {
            return this._stuffData;
        }

        public function set stuffData(k:IStuffData):void
        {
            this._stuffData = k;
        }

        public function get _Str_2794():Number
        {
            return this._extra;
        }

        public function get recyclable():Boolean
        {
            return this._recyclable;
        }

        public function get tradeable():Boolean
        {
            return this._tradeable;
        }

        public function get groupable():Boolean
        {
            return this._groupable;
        }

        public function get sellable():Boolean
        {
            return this._sellable;
        }

        public function get secondsToExpiration():int
        {
            if (this._secondsToExpiration == -1)
            {
                return -1;
            }
            var k:int = -1;
            if (this._hasRentPeriodStarted)
            {
                k = (this._secondsToExpiration - ((getTimer() - this._expirationTimeStamp) / 1000));
                if (k < 0)
                {
                    k = 0;
                }
            }
            else
            {
                k = this._secondsToExpiration;
            }
            return k;
        }

        public function get creationDay():int
        {
            return this._creationDay;
        }

        public function get creationMonth():int
        {
            return this._creationMonth;
        }

        public function get creationYear():int
        {
            return this._creationYear;
        }

        public function get slotId():String
        {
            return this._slotId;
        }

        public function get songId():int
        {
            return this._songId;
        }

        public function get locked():Boolean
        {
            return this._locked;
        }

        public function set locked(k:Boolean):void
        {
            this._locked = k;
        }

        public function get flatId():int
        {
            return this._flatId;
        }

        public function get isWallItem():Boolean
        {
            return this._isWallItem;
        }

        public function get hasRentPeriodStarted():Boolean
        {
            return this._hasRentPeriodStarted;
        }

        public function get expirationTimeStamp():int
        {
            return this._expirationTimeStamp;
        }

        public function update(k:IFurnitureItemData):void
        {
            this._type = k.spriteId;
            this._ref = k.ref;
            this._category = k.category;
            this._groupable = ((k.isGroupable) && (!(k.rentable)));
            this._tradeable = k.tradable;
            this._recyclable = k.isRecycleable;
            this._sellable = k.sellable;
            this._stuffData = k.stuffData;
            this._extra = k._Str_2794;
            this._secondsToExpiration = k.secondsToExpiration;
            this._expirationTimeStamp = k.expirationTimeStamp;
            this._hasRentPeriodStarted = k.hasRentPeriodStarted;
            this._creationDay = k.creationDay;
            this._creationMonth = k.creationMonth;
            this._creationYear = k.creationYear;
            this._slotId = k.slotId;
            this._songId = k.songId;
            this._flatId = k.flatId;
            this._isRented = k.rentable;
            this._isWallItem = k.isWallItem;
        }
    }
}
