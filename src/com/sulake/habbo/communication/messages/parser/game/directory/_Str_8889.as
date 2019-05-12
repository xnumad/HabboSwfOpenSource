package com.sulake.habbo.communication.messages.parser.game.directory
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8889 implements IMessageParser 
    {
        private var _Str_16950:int;


        public function flush():Boolean
        {
            this._Str_16950 = 0;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_16950 = k.readInteger();
            return true;
        }

        public function get _Str_26420():int
        {
            return this._Str_16950;
        }
    }
}
