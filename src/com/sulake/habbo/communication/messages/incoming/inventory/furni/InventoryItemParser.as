package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.habbo.communication.messages.parser.room.engine._Str_4638;
    import flash.utils.getTimer;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class InventoryItemParser implements _Str_7108 
    {
        private static const WALL_ITEM:String = "I";
        private static const FLOOR_ITEM:String = "S";

        private var _rentable:Boolean;
        private var _itemId:int;
        private var _furniType:String;
        private var _ref:int;
        private var _spriteId:int;
        private var _category:int;
        private var _stuffData:IStuffData;
        private var _isGroupable:Boolean;
        private var _isRecyclable:Boolean;
        private var _tradable:Boolean;
        private var _sellable:Boolean;
        private var _secondsToExpiration:int;
        private var _Str_3182:int;
        private var _flatId:int;
        private var _isWallItem:Boolean;
        private var _hasRentPeriodStarted:Boolean;
        private var _Str_5390:int;
        private var _slotId:String = "";
        private var _Str_2808:int = -1;

        public function InventoryItemParser(k:IMessageDataWrapper)
        {
            this._itemId = k.readInteger();
            this._furniType = k.readString();
            this._ref = k.readInteger();
            this._spriteId = k.readInteger();
            this._category = k.readInteger();
            this._stuffData = _Str_4638._Str_6271(k);
            this._isRecyclable = k.readBoolean();
            this._tradable = k.readBoolean();
            this._isGroupable = k.readBoolean();
            this._sellable = k.readBoolean();
            this._secondsToExpiration = k.readInteger();
            this._Str_5390 = getTimer();
            if (this.secondsToExpiration > -1)
            {
                this._rentable = true;
            }
            else
            {
                this._rentable = false;
                this._secondsToExpiration = -1;
            }
            this._hasRentPeriodStarted = k.readBoolean();
            this._flatId = k.readInteger();
            this._isWallItem = (this._furniType == WALL_ITEM);
            if (this._furniType == FLOOR_ITEM)
            {
                this._slotId = k.readString();
                this._Str_3182 = k.readInteger();
            }
        }

        public function get itemId():int
        {
            return this._itemId;
        }

        public function get furniType():String
        {
            return this._furniType;
        }

        public function get ref():int
        {
            return this._ref;
        }

        public function get spriteId():int
        {
            return this._spriteId;
        }

        public function get category():int
        {
            return this._category;
        }

        public function get stuffData():IStuffData
        {
            return this._stuffData;
        }

        public function get isGroupable():Boolean
        {
            return this._isGroupable;
        }

        public function get isRecycleable():Boolean
        {
            return this._isRecyclable;
        }

        public function get tradable():Boolean
        {
            return this._tradable;
        }

        public function get sellable():Boolean
        {
            return this._sellable;
        }

        public function get secondsToExpiration():int
        {
            return this._secondsToExpiration;
        }

        public function get flatId():int
        {
            return this._flatId;
        }

        public function get slotId():String
        {
            return this._slotId;
        }

        public function get _Str_3951():int
        {
            return this._Str_2808;
        }

        public function get _Str_2794():int
        {
            return this._Str_3182;
        }

        public function get rentable():Boolean
        {
            return this._rentable;
        }

        public function get isWallItem():Boolean
        {
            return this._isWallItem;
        }

        public function get hasRentPeriodStarted():Boolean
        {
            return this._hasRentPeriodStarted;
        }

        public function get _Str_10616():int
        {
            return this._Str_5390;
        }

        public function get _Str_8932():int
        {
            return 0;
        }

        public function get _Str_9050():int
        {
            return 0;
        }

        public function get _Str_9408():int
        {
            return 0;
        }

        public function get _Str_19297():Boolean
        {
            return !(this._furniType.indexOf("external_image") == -1);
        }
    }
}
