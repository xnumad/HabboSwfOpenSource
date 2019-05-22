package com.sulake.habbo.communication.messages.incoming.notifications
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6768 
    {
        private var _type:int;
        private var _level:int;
        private var _points:int;
        private var _Str_10280:int;
        private var _Str_12282:int;
        private var _Str_20597:int;
        private var _badgeId:int;
        private var _Str_2722:String = "";
        private var _Str_20961:String = "";
        private var _Str_20188:int;
        private var _category:String;
        private var _Str_20333:Boolean;

        public function _Str_6768(k:IMessageDataWrapper)
        {
            this._type = k.readInteger();
            this._level = k.readInteger();
            this._badgeId = k.readInteger();
            this._Str_2722 = k.readString();
            this._points = k.readInteger();
            this._Str_10280 = k.readInteger();
            this._Str_12282 = k.readInteger();
            this._Str_20597 = k.readInteger();
            this._Str_20188 = k.readInteger();
            this._Str_20961 = k.readString();
            this._category = k.readString();
            this._Str_20333 = k.readBoolean();
        }

        public function get type():int
        {
            return this._type;
        }

        public function get level():int
        {
            return this._level;
        }

        public function get points():int
        {
            return this._points;
        }

        public function get _Str_20874():int
        {
            return this._Str_10280;
        }

        public function get _Str_21187():int
        {
            return this._Str_12282;
        }

        public function get _Str_26357():int
        {
            return this._Str_20597;
        }

        public function get badgeId():int
        {
            return this._badgeId;
        }

        public function get badgeCode():String
        {
            return this._Str_2722;
        }

        public function get _Str_24720():String
        {
            return this._Str_20961;
        }

        public function get _Str_26165():int
        {
            return this._Str_20188;
        }

        public function get category():String
        {
            return this._category;
        }

        public function get _Str_26275():Boolean
        {
            return this._Str_20333;
        }
    }
}
