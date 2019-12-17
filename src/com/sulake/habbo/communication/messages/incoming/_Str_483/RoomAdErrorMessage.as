package com.sulake.habbo.communication.messages.incoming._Str_483
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.advertisement.RoomAdErrorMessageParser;

    public class RoomAdErrorMessage extends MessageEvent implements IMessageEvent 
    {
        public function RoomAdErrorMessage(k:Function)
        {
            super(k, RoomAdErrorMessageParser);
        }

        public function getParser():RoomAdErrorMessageParser
        {
            return this._parser as RoomAdErrorMessageParser;
        }
    }
}
