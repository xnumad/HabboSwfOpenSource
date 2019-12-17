package com.sulake.habbo.session.handler
{
    import com.sulake.habbo.communication.messages.incoming.room.furniture._Str_8382;
    import com.sulake.habbo.communication.messages.incoming.room.furniture._Str_8241;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.session.IRoomHandlerListener;
    import com.sulake.habbo.communication.messages.parser.room.furniture._Str_7736;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.session.events.RoomSessionPetPackageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture._Str_8050;

    public class PetPackageHandler extends BaseHandler 
    {
        public function PetPackageHandler(k:IConnection, _arg_2:IRoomHandlerListener)
        {
            super(k, _arg_2);
            if (k == null)
            {
                return;
            }
            k.addMessageEvent(new _Str_8382(this.onOpenPetPackageRequested));
            k.addMessageEvent(new _Str_8241(this.onOpenPetPackageResult));
        }

        private function onOpenPetPackageRequested(k:IMessageEvent):void
        {
            var _local_2:_Str_7736 = (k as _Str_8382).getParser();
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:IRoomSession = listener.getSession(_xxxRoomId);
            if (_local_3 == null)
            {
                return;
            }
            if (((listener) && (listener.events)))
            {
                listener.events.dispatchEvent(new RoomSessionPetPackageEvent(RoomSessionPetPackageEvent.RSOPPE_OPEN_PET_PACKAGE_REQUESTED, _local_3, _local_2._Str_1577, _local_2.figureData, 0, null));
            }
        }

        private function onOpenPetPackageResult(k:IMessageEvent):void
        {
            var _local_2:_Str_8050 = (k as _Str_8241).getParser();
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:IRoomSession = listener.getSession(_xxxRoomId);
            if (_local_3 == null)
            {
                return;
            }
            if (((listener) && (listener.events)))
            {
                listener.events.dispatchEvent(new RoomSessionPetPackageEvent(RoomSessionPetPackageEvent.RSOPPE_OPEN_PET_PACKAGE_RESULT, _local_3, _local_2._Str_1577, null, _local_2.nameValidationStatus, _local_2.nameValidationInfo));
            }
        }
    }
}
