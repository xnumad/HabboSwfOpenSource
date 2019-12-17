package com.sulake.habbo.session.handler
{
    import com.sulake.habbo.communication.messages.incoming.handshake.GenericErrorEvent;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.session.IRoomHandlerListener;
    import com.sulake.habbo.communication.messages.parser.handshake._Str_6053;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.session.events.RoomSessionErrorMessageEvent;
    import com.sulake.habbo.session.enum.GenericErrorEnum;
    import com.sulake.core.communication.messages.IMessageEvent;

    public class GenericErrorHandler extends BaseHandler 
    {
        public function GenericErrorHandler(k:IConnection, _arg_2:IRoomHandlerListener)
        {
            super(k, _arg_2);
            if (k == null)
            {
                return;
            }
            k.addMessageEvent(new GenericErrorEvent(this.onGenericError));
        }

        private function onGenericError(k:IMessageEvent):void
        {
            var _local_4:String;
            var _local_2:_Str_6053 = (k as GenericErrorEvent).getParser();
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:IRoomSession = listener.getSession(_xxxRoomId);
            if (_local_3 == null)
            {
                return;
            }
            switch (_local_2.errorCode)
            {
                case GenericErrorEnum._Str_5980:
                    _local_4 = RoomSessionErrorMessageEvent.RSEME_KICKED;
                    break;
                default:
                    return;
            }
            if (((listener) && (listener.events)))
            {
                listener.events.dispatchEvent(new RoomSessionErrorMessageEvent(_local_4, _local_3));
            }
        }
    }
}
