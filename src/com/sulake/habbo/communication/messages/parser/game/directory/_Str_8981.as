package com.sulake.habbo.communication.messages.parser.game.directory
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8981 implements IMessageParser 
    {
        private var _Str_19201:int;


        public function flush():Boolean
        {
            return false;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_19201 = k.readInteger();
            return true;
        }

        public function get _Str_26145():int
        {
            return this._Str_19201;
        }
    }
}
