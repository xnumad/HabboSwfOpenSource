package com.sulake.habbo.communication.messages.incoming.quest
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_2455 
    {
        private var _Str_15344:String;
        private var _Str_16809:int;
        private var _Str_17283:int;
        private var _activityPointType:int;
        private var _id:int;
        private var _accepted:Boolean;
        private var _type:String;
        private var _Str_21549:String;
        private var _Str_19127:int;
        private var _Str_16765:String;
        private var _Str_17312:int;
        private var _totalSteps:int;
        private var _Str_15970:int;
        private var _sortOrder:int;
        private var _Str_10924:String;
        private var _Str_13604:String;
        private var _easy:Boolean;
        private var _Str_16973:Date;

        public function _Str_2455(k:IMessageDataWrapper)
        {
            this._Str_16973 = new Date();
            super();
            this._Str_15344 = k.readString();
            this._Str_16809 = k.readInteger();
            this._Str_17283 = k.readInteger();
            this._activityPointType = k.readInteger();
            this._id = k.readInteger();
            this._accepted = k.readBoolean();
            this._type = k.readString();
            this._Str_21549 = k.readString();
            this._Str_19127 = k.readInteger();
            this._Str_16765 = k.readString();
            this._Str_17312 = k.readInteger();
            this._totalSteps = k.readInteger();
            this._sortOrder = k.readInteger();
            this._Str_10924 = k.readString();
            this._Str_13604 = k.readString();
            this._easy = k.readBoolean();
        }

        public static function _Str_18415(k:String):String
        {
            return "quests." + k;
        }


        public function get _Str_6549():String
        {
            return this._Str_15344;
        }

        public function get _Str_5961():String
        {
            return this._Str_16765;
        }

        public function get _Str_18579():int
        {
            return this._Str_16809;
        }

        public function get _Str_25129():int
        {
            return this._Str_17283;
        }

        public function get activityPointType():int
        {
            return this._activityPointType;
        }

        public function get accepted():Boolean
        {
            return this._accepted;
        }

        public function get id():int
        {
            return this._id;
        }

        public function get type():String
        {
            return this._type;
        }

        public function get _Str_22072():String
        {
            return this._Str_21549;
        }

        public function get _Str_12939():int
        {
            return this._Str_19127;
        }

        public function get _Str_22915():int
        {
            return this._Str_17312;
        }

        public function get _Str_22975():int
        {
            return this._totalSteps;
        }

        public function get _Str_26107():Boolean
        {
            return this._Str_17312 == this._totalSteps;
        }

        public function get _Str_3935():int
        {
            if (this._Str_15970 < 1)
            {
                return 0;
            }
            var k:Date = new Date();
            var _local_2:int = (k.getTime() - this._Str_16973.getTime());
            var _local_3:int = Math.max(0, (this._Str_15970 - Math.floor((_local_2 / 1000))));
            return _local_3;
        }

        public function _Str_9246():String
        {
            return _Str_18415(this._Str_6549);
        }

        public function _Str_5688():String
        {
            return (this._Str_9246() + ".") + this._Str_16765;
        }

        public function get _Str_6695():Boolean
        {
            return this._id < 1;
        }

        public function set id(k:int):void
        {
            this._id = k;
        }

        public function set accepted(k:Boolean):void
        {
            this._accepted = k;
        }

        public function get _Str_5132():Boolean
        {
            return this._Str_16809 >= this._Str_17283;
        }

        public function get _Str_26251():Date
        {
            return this._Str_16973;
        }

        public function set _Str_3935(k:int):void
        {
            this._Str_15970 = k;
        }

        public function get sortOrder():int
        {
            return this._sortOrder;
        }

        public function get _Str_23842():String
        {
            return this._Str_10924;
        }

        public function get _Str_19427():String
        {
            return this._Str_13604;
        }

        public function get easy():Boolean
        {
            return this._easy;
        }
    }
}
