package com.sulake.habbo.communication.messages.incoming.roomsettings
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.roomsettings.FlatControllerRemovedMessageParser;

    public class _Str_5683 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_5683(k:Function)
        {
            super(k, FlatControllerRemovedMessageParser);
        }

        public function getParser():FlatControllerRemovedMessageParser
        {
            return this._parser as FlatControllerRemovedMessageParser;
        }
    }
}
