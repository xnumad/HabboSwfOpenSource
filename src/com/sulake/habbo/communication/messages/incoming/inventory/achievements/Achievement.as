package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class Achievement 
    {
        public static const _Str_21736:int = -1;
        public static const _Str_21318:int = 0;
        public static const _Str_15908:int = 1;
        public static const _Str_20384:int = 2;

        private var _achievementId:int;
        private var _level:int;
        private var _badgeId:String;
        private var _Str_6791:int;
        private var _Str_18274:int;
        private var _Str_10280:int;
        private var _Str_12282:int;
        private var _Str_19007:int;
        private var _Str_16081:Boolean;
        private var _category:String;
        private var _Str_21707:String;
        private var _Str_20339:int;
        private var _Str_19099:int;

        public function Achievement(k:IMessageDataWrapper)
        {
            this._achievementId = k.readInteger();
            this._level = k.readInteger();
            this._badgeId = k.readString();
            this._Str_6791 = k.readInteger();
            this._Str_18274 = Math.max(1, k.readInteger());
            this._Str_10280 = k.readInteger();
            this._Str_12282 = k.readInteger();
            this._Str_19007 = k.readInteger();
            this._Str_16081 = k.readBoolean();
            this._category = k.readString();
            this._Str_21707 = k.readString();
            this._Str_20339 = k.readInteger();
            this._Str_19099 = k.readInteger();
        }

        public function get achievementId():int
        {
            return this._achievementId;
        }

        public function get badgeId():String
        {
            return this._badgeId;
        }

        public function get level():int
        {
            return this._level;
        }

        public function get _Str_25209():int
        {
            return this._Str_6791;
        }

        public function get _Str_24142():int
        {
            return this._Str_18274 - this._Str_6791;
        }

        public function get _Str_20874():int
        {
            return this._Str_10280;
        }

        public function get _Str_21187():int
        {
            return this._Str_12282;
        }

        public function get _Str_22939():int
        {
            return this._Str_19007 - this._Str_6791;
        }

        public function get _Str_7518():Boolean
        {
            return this._Str_16081;
        }

        public function get category():String
        {
            return this._category;
        }

        public function get _Str_25896():String
        {
            return this._Str_21707;
        }

        public function get _Str_20475():int
        {
            return this._Str_20339;
        }

        public function get _Str_10438():Boolean
        {
            return (this._level > 1) || (this._Str_16081);
        }

        public function _Str_24410():void
        {
            this._Str_19007 = this._Str_18274;
        }

        public function get _Str_24874():int
        {
            return this._Str_19099;
        }
    }
}
