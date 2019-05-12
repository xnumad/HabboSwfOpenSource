package com.sulake.habbo.communication.messages.parser.roomsettings
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7422 implements IMessageParser 
    {
        private var _Str_21617:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_21617 = k.readInteger();
            return true;
        }

        public function get _Str_24716():int
        {
            return this._Str_21617;
        }
    }
}
