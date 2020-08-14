package com.sulake.habbo.communication.messages.incoming.room.furniture
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture.OneWayDoorStatusMessageParser;

    public class _Str_7657 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7657(k:Function)
        {
            super(k, OneWayDoorStatusMessageParser);
        }

        public function getParser():OneWayDoorStatusMessageParser
        {
            return _parser as OneWayDoorStatusMessageParser;
        }
    }
}
