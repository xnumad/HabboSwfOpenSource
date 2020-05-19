package com.sulake.habbo.communication.messages.parser.room.chat
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class RemainingMutePeriodParser implements IMessageParser 
    {
        private var _muteSecondsRemaining:int = 0;


        public function get secondsRemaining():int
        {
            return this._muteSecondsRemaining;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._muteSecondsRemaining = k.readInteger();
            return true;
        }
    }
}
