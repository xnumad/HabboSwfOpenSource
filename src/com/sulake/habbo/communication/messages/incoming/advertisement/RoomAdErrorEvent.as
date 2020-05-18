package com.sulake.habbo.communication.messages.incoming.advertisement
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.advertisement.RoomAdErrorMessageParser;

    public class RoomAdErrorEvent extends MessageEvent implements IMessageEvent 
    {
        public function RoomAdErrorEvent(k:Function)
        {
            super(k, RoomAdErrorMessageParser);
        }

        public function getParser():RoomAdErrorMessageParser
        {
            return this._parser as RoomAdErrorMessageParser;
        }
    }
}
