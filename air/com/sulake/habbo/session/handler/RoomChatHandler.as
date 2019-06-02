//com.sulake.habbo.session.handler.RoomChatHandler

package com.sulake.habbo.session.handler{
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.session.IRoomHandlerListener;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.users.PetRespectNotificationEvent;
    import com.sulake.habbo.communication.messages.incoming.users.PetSupplementedNotificationEvent;
    import com.sulake.habbo.communication.messages.incoming.users.HandItemReceivedMessageEvent;

    public class RoomChatHandler extends BaseHandler {

        public function RoomChatHandler(k:IConnection, _arg_2:IRoomHandlerListener);

        private function onRoomChat(k:IMessageEvent):void;

        private function onRespectNotification(k:IMessageEvent):void;

        private function onPetRespectNotification(k:PetRespectNotificationEvent):void;

        private function onPetSupplementedNotification(k:PetSupplementedNotificationEvent):void;

        private function onHandItemNotification(k:HandItemReceivedMessageEvent):void;

        private function onRoomWhisper(k:IMessageEvent):void;

        private function onRoomShout(k:IMessageEvent):void;

        private function onFloodControl(k:IMessageEvent):void;


    }
}//package com.sulake.habbo.session.handler

