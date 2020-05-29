package com.sulake.habbo.communication.messages.parser.handshake
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class NoobnessLevelMessageParser implements IMessageParser 
    {
        private var _noobnessLevel:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._noobnessLevel = k.readInteger();
            return true;
        }

        public function get noobnessLevel():int
        {
            return this._noobnessLevel;
        }
    }
}
