package com.sulake.habbo.communication.messages.parser.moderation
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7250 implements IMessageParser 
    {
        private var _Str_6036:int;


        public function get _Str_2869():int
        {
            return this._Str_6036;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_6036 = parseInt(k.readString());
            return true;
        }
    }
}
