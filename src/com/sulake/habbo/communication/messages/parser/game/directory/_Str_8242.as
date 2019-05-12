package com.sulake.habbo.communication.messages.parser.game.directory
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8242 implements IMessageParser 
    {
        public static const _Str_20239:int = 1;
        public static const _Str_21493:int = 2;

        private var _reason:int;


        public function get reason():int
        {
            return this._reason;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._reason = k.readInteger();
            return true;
        }
    }
}
