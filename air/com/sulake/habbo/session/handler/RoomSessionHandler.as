//com.sulake.habbo.session.handler.RoomSessionHandler

package com.sulake.habbo.session.handler{
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.session.IRoomHandlerListener;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.session.FlatAccessibleMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator.FlatAccessDeniedMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.session.RoomQueueStatusMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.session.YouAreSpectatorMessageEvent;

    public class RoomSessionHandler extends BaseHandler {

        public static const SESSION_CONNECTED:String;
        public static const SESSION_READY:String;
        public static const SESSION_DISCONNECTED:String;

        public function RoomSessionHandler(k:IConnection, _arg_2:IRoomHandlerListener);

        private function onRoomConnected(k:IMessageEvent):void;

        private function onFlatAccessible(k:FlatAccessibleMessageEvent):void;

        private function onRoomReady(k:IMessageEvent):void;

        private function onFlatAccessDenied(k:FlatAccessDeniedMessageEvent):void;

        private function onRoomDisconnected(k:IMessageEvent):void;

        private function onRoomQueueStatus(k:RoomQueueStatusMessageEvent):void;

        private function onYouAreSpectator(k:YouAreSpectatorMessageEvent):void;


    }
}//package com.sulake.habbo.session.handler

