package com.sulake.habbo.session.handler
{
    import com.sulake.habbo.communication.messages.incoming.room.permissions.YouAreControllerMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.permissions.YouAreNotControllerMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.permissions.YouAreOwnerMessageEvent;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.session.IRoomHandlerListener;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.session.enum.RoomControllerLevel;

    public class RoomPermissionsHandler extends BaseHandler 
    {
        public function RoomPermissionsHandler(k:IConnection, _arg_2:IRoomHandlerListener)
        {
            super(k, _arg_2);
            if (k == null)
            {
                return;
            }
            k.addMessageEvent(new YouAreControllerMessageEvent(this.onYouAreController));
            k.addMessageEvent(new YouAreNotControllerMessageEvent(this.onYouAreNotController));
            k.addMessageEvent(new YouAreOwnerMessageEvent(this.onYouAreOwner));
        }

        private function onYouAreController(k:IMessageEvent):void
        {
            var _local_2:YouAreControllerMessageEvent = (k as YouAreControllerMessageEvent);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:IRoomSession = listener.getSession(_xxxRoomId);
            if (_local_3 == null)
            {
                return;
            }
            _local_3.roomControllerLevel = _local_2.getParser().roomControllerLevel;
        }

        private function onYouAreNotController(k:IMessageEvent):void
        {
            var _local_2:YouAreNotControllerMessageEvent = (k as YouAreNotControllerMessageEvent);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:IRoomSession = listener.getSession(_xxxRoomId);
            if (_local_3 == null)
            {
                return;
            }
            _local_3.roomControllerLevel = RoomControllerLevel.NONE;
        }

        private function onYouAreOwner(k:IMessageEvent):void
        {
            var _local_2:YouAreOwnerMessageEvent = (k as YouAreOwnerMessageEvent);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:IRoomSession = listener.getSession(_xxxRoomId);
            if (_local_3 == null)
            {
                return;
            }
            _local_3.isRoomOwner = true;
        }
    }
}
