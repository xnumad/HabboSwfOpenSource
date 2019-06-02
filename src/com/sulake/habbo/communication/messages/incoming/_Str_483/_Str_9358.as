package com.sulake.habbo.communication.messages.incoming._Str_483
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.advertisement.RoomAdErrorMessageParser;

    public class _Str_9358 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9358(k:Function)
        {
            super(k, RoomAdErrorMessageParser);
        }

        public function _Str_2273():RoomAdErrorMessageParser
        {
            return this._parser as RoomAdErrorMessageParser;
        }
    }
}
