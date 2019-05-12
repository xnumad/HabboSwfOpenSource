package com.sulake.habbo.communication.messages.parser.room.furniture
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6716 implements IMessageParser 
    {
        private var _Str_2319:int;
        private var _Str_2994:int;
        private var _Str_18836:String;
        private var _Str_8815:int;
        private var _Str_7536:Boolean;
        private var _Str_9506:Boolean;


        public function get _Str_1577():int
        {
            return this._Str_2319;
        }

        public function get _Str_3916():int
        {
            return this._Str_2994;
        }

        public function get _Str_24570():String
        {
            return this._Str_18836;
        }

        public function get _Str_25076():int
        {
            return this._Str_8815;
        }

        public function get _Str_24832():Boolean
        {
            return this._Str_7536;
        }

        public function get _Str_24908():Boolean
        {
            return this._Str_9506;
        }

        public function flush():Boolean
        {
            this._Str_2319 = -1;
            this._Str_2994 = -1;
            this._Str_18836 = "";
            this._Str_8815 = -1;
            this._Str_7536 = false;
            this._Str_9506 = false;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            if (k == null)
            {
                return false;
            }
            this._Str_2319 = k.readInteger();
            this._Str_2994 = k.readInteger();
            this._Str_18836 = k.readString();
            this._Str_8815 = k.readInteger();
            this._Str_7536 = k.readBoolean();
            this._Str_9506 = k.readBoolean();
            return true;
        }
    }
}
