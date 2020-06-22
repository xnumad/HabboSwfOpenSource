package com.sulake.habbo.communication.messages.incoming.roomsettings
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.roomsettings.FlatControllersMessageParser;

    public class _Str_5771 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_5771(k:Function)
        {
            super(k, FlatControllersMessageParser);
        }

        public function getParser():FlatControllersMessageParser
        {
            return this._parser as FlatControllersMessageParser;
        }
    }
}
