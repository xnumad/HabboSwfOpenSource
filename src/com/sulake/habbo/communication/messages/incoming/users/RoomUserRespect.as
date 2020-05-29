package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.RespectNotificationMessageParser;

    public class RoomUserRespect extends MessageEvent implements IMessageEvent 
    {
        public function RoomUserRespect(k:Function)
        {
            super(k, RespectNotificationMessageParser);
        }

        public function get userId():int
        {
            return (_parser as RespectNotificationMessageParser).userId;
        }

        public function get _Str_10295():int
        {
            return (_parser as RespectNotificationMessageParser)._Str_10295;
        }
    }
}
