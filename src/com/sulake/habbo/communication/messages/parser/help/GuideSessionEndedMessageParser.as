package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GuideSessionEndedMessageParser implements IMessageParser 
    {
        private var _endReason:int = 0;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._endReason = k.readInteger();
            return true;
        }

        public function get endReason():int
        {
            return this._endReason;
        }
    }
}
