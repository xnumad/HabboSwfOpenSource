//com.sulake.habbo.session.handler.RoomPermissionsHandler

package com.sulake.habbo.session.handler{
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.session.IRoomHandlerListener;
    import com.sulake.core.communication.messages.IMessageEvent;

    public class RoomPermissionsHandler extends BaseHandler {

        public function RoomPermissionsHandler(k:IConnection, _arg_2:IRoomHandlerListener);

        private function onYouAreController(k:IMessageEvent):void;

        private function onYouAreNotController(k:IMessageEvent):void;

        private function onYouAreOwner(k:IMessageEvent):void;


    }
}//package com.sulake.habbo.session.handler

