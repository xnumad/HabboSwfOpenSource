package com.sulake.habbo.communication.messages.parser.navigator
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_5936 implements IMessageParser 
    {
        private var _flatId:int;
        private var _Str_17603:String;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._flatId = k.readInteger();
            this._Str_17603 = k.readString();
            Logger.log(((("FLAT CREATED: " + this._flatId) + ", ") + this._Str_17603));
            return true;
        }

        public function get flatId():int
        {
            return this._flatId;
        }

        public function get _Str_18439():String
        {
            return this._Str_17603;
        }
    }
}
