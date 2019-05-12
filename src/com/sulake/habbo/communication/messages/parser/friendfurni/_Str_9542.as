package com.sulake.habbo.communication.messages.parser.friendfurni
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_9542 implements IMessageParser 
    {
        private var _stuffId:int;


        public function get stuffId():int
        {
            return this._stuffId;
        }

        public function flush():Boolean
        {
            this._stuffId = -1;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._stuffId = k.readInteger();
            return true;
        }
    }
}
