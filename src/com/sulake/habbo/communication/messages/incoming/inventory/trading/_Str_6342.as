package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
    import com.sulake.habbo.communication.messages.incoming.inventory.furni._Str_7108;
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.habbo.communication.messages.parser.room.engine._Str_4638;
    import flash.utils.getTimer;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6342 implements _Str_7108 
    {
        private var _Str_5390:int;
        private var _isWallItem:Boolean;
        private var _itemId:int;
        private var _furniType:String;
        private var _ref:int;
        private var _spriteId:int;
        private var _category:int;
        private var _stuffData:IStuffData;
        private var _Str_3182:int;
        private var _secondsToExpiration:int;
        private var _Str_9291:int;
        private var _Str_8744:int;
        private var _Str_9700:int;
        private var _isGroupable:Boolean;
        private var _Str_2808:int;
        private var _flatId:int;
        private var _rentable:Boolean;
        private var _hasRentPeriodStarted:Boolean;

        public function _Str_6342(k:IMessageDataWrapper)
        {
            this._itemId = k.readInteger();
            this._furniType = k.readString().toUpperCase();
            this._ref = k.readInteger();
            this._spriteId = k.readInteger();
            this._category = k.readInteger();
            this._isGroupable = k.readBoolean();
            this._stuffData = _Str_4638._Str_6271(k);
            this._secondsToExpiration = -1;
            this._Str_5390 = getTimer();
            this._hasRentPeriodStarted = false;
            this._Str_9291 = k.readInteger();
            this._Str_8744 = k.readInteger();
            this._Str_9700 = k.readInteger();
            this._Str_3182 = ((this.furniType == "S") ? k.readInteger() : -1);
            this._flatId = -1;
            this._rentable = false;
            this._isWallItem = (this._furniType == "I");
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

        public function get _Str_2794():int
        {
            return this._Str_3182;
        }

        public function get secondsToExpiration():int
        {
            return this._secondsToExpiration;
        }

        public function get _Str_8932():int
        {
            return this._Str_9291;
        }

        public function get _Str_9050():int
        {
            return this._Str_8744;
        }

        public function get _Str_9408():int
        {
            return this._Str_9700;
        }

        public function get isGroupable():Boolean
        {
            return this._isGroupable;
        }

        public function get _Str_3951():int
        {
            return this._Str_3182;
        }

        public function get flatId():int
        {
            return this._flatId;
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

        public function get isRecycleable():Boolean
        {
            return true;
        }

        public function get tradable():Boolean
        {
            return true;
        }

        public function get sellable():Boolean
        {
            return true;
        }

        public function get slotId():String
        {
            return null;
        }

        public function get _Str_19297():Boolean
        {
            return !(this._furniType.indexOf("external_image") == -1);
        }
    }
}
