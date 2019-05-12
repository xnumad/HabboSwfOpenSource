package com.sulake.habbo.communication.messages.incoming.room.pets
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_3763 
    {
        private var _Str_7992:int;
        private var _name:String;
        private var _level:int;
        private var _figure:String;
        private var _owner:String;

        public function _Str_3763(k:IMessageDataWrapper)
        {
            this._Str_7992 = k.readInteger();
            this._name = k.readString();
            this._level = k.readInteger();
            this._figure = k.readString();
            this._owner = k.readString();
        }

        public function dispose():void
        {
            this._Str_7992 = 0;
            this._name = "";
            this._level = 0;
            this._figure = "";
            this._owner = "";
        }

        public function get _Str_5277():int
        {
            return this._Str_7992;
        }

        public function get name():String
        {
            return this._name;
        }

        public function get level():int
        {
            return this._level;
        }

        public function get figure():String
        {
            return this._figure;
        }

        public function get owner():String
        {
            return this._owner;
        }
    }
}
