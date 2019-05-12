package com.sulake.habbo.communication.messages.parser.navigator
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_5654 implements IMessageParser 
    {
        private var _Str_18318:String;
        private var _Str_21920:int;


        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_18318 = k.readString();
            this._Str_21920 = k.readInteger();
            return true;
        }

        public function flush():Boolean
        {
            this._Str_18318 = null;
            return true;
        }

        public function get _Str_17914():String
        {
            return this._Str_18318;
        }

        public function get _Str_12434():int
        {
            return this._Str_21920;
        }
    }
}
