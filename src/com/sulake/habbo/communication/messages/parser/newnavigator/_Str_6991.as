package com.sulake.habbo.communication.messages.parser.newnavigator
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6991 implements IMessageParser 
    {
        private var _Str_5236:int;
        private var _Str_5029:int;
        private var _Str_4111:int;
        private var _Str_5130:int;
        private var _Str_16883:Boolean;
        private var _Str_18619:int;


        public function get _Str_17736():int
        {
            return this._Str_5236;
        }

        public function get _Str_18137():int
        {
            return this._Str_5029;
        }

        public function get _Str_4971():int
        {
            return this._Str_4111;
        }

        public function get _Str_17903():int
        {
            return this._Str_5130;
        }

        public function get _Str_25666():Boolean
        {
            return this._Str_16883;
        }

        public function get _Str_23289():int
        {
            return this._Str_18619;
        }

        public function flush():Boolean
        {
            this._Str_5236 = 0;
            this._Str_5029 = 0;
            this._Str_4111 = 0;
            this._Str_5130 = 0;
            this._Str_16883 = false;
            this._Str_18619 = 0;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_5236 = k.readInteger();
            this._Str_5029 = k.readInteger();
            this._Str_4111 = k.readInteger();
            this._Str_5130 = k.readInteger();
            this._Str_16883 = k.readBoolean();
            this._Str_18619 = k.readInteger();
            return true;
        }
    }
}
