package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator.CanCreateRoomEventMessageParser;

    public class _Str_5212 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_5212(k:Function)
        {
            super(k, CanCreateRoomEventMessageParser);
        }

        public function getParser():CanCreateRoomEventMessageParser
        {
            return this._parser as CanCreateRoomEventMessageParser;
        }
    }
}
