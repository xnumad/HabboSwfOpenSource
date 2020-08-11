package com.sulake.habbo.communication.messages.parser.landingview.votes
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class CommunityVoteReceivedParser implements IMessageParser
    {
        private var _acknowledged:Boolean;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._acknowledged = k.readBoolean();
            return true;
        }

        public function get acknowledged():Boolean
        {
            return this._acknowledged;
        }
    }
}
