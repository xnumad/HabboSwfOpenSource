package com.sulake.habbo.communication.messages.parser.room.furniture
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8190 implements IMessageParser 
    {
        private var _Str_16670:Boolean;
        private var _renterId:int;
        private var _Str_18360:String;
        private var _Str_20575:Boolean;
        private var _Str_16491:int;
        private var _Str_22009:int;
        private var _price:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_16670 = k.readBoolean();
            this._Str_16491 = k.readInteger();
            this._Str_20575 = (this._Str_16491 === 0);
            this._renterId = k.readInteger();
            this._Str_18360 = k.readString();
            this._Str_22009 = k.readInteger();
            this._price = k.readInteger();
            if (!this._Str_16670)
            {
                this._renterId = -1;
                this._Str_18360 = "";
            }
            return true;
        }

        public function get _Str_22736():Boolean
        {
            return this._Str_16670;
        }

        public function get renterId():int
        {
            return this._renterId;
        }

        public function get _Str_23275():String
        {
            return this._Str_18360;
        }

        public function get _Str_23603():Boolean
        {
            return this._Str_20575;
        }

        public function get price():int
        {
            return this._price;
        }

        public function get _Str_24083():int
        {
            return this._Str_22009;
        }

        public function get _Str_25070():int
        {
            return this._Str_16491;
        }
    }
}
