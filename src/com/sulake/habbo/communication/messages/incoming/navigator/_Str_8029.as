package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator.RoomEventCancelMessageParser;

    public class _Str_8029 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8029(k:Function)
        {
            super(k, RoomEventCancelMessageParser);
        }
    }
}
