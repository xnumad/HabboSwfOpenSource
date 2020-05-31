package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.FavouriteMembershipUpdateMessageParser;

    public class _Str_7839 extends MessageEvent 
    {
        public function _Str_7839(k:Function)
        {
            super(k, FavouriteMembershipUpdateMessageParser);
        }

        public function getParser():FavouriteMembershipUpdateMessageParser
        {
            return _parser as FavouriteMembershipUpdateMessageParser;
        }
    }
}
