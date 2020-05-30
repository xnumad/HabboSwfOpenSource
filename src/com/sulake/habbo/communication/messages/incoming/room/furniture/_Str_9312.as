package com.sulake.habbo.communication.messages.incoming.room.furniture
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture.RoomMessageNotificationMessageParser;

    public class _Str_9312 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9312(k:Function)
        {
            super(k, RoomMessageNotificationMessageParser);
        }

        public function getParser():RoomMessageNotificationMessageParser
        {
            return _parser as RoomMessageNotificationMessageParser;
        }
    }
}
