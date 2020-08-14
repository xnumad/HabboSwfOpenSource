package com.sulake.habbo.communication.messages.incoming.roomsettings
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.roomsettings.FlatControllerAddedMessageParser;

    public class _Str_6213 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_6213(k:Function)
        {
            super(k, FlatControllerAddedMessageParser);
        }

        public function getParser():FlatControllerAddedMessageParser
        {
            return this._parser as FlatControllerAddedMessageParser;
        }
    }
}
