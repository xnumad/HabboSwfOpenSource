package com.sulake.habbo.communication.messages.parser.landingview.votes
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class CommunityVoteReceivedParser implements IMessageParser
    {
        private var _Str_19446:Boolean;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_19446 = k.readBoolean();
            return true;
        }

        public function get _Str_23568():Boolean
        {
            return this._Str_19446;
        }
    }
}
