//com.sulake.habbo.session.handler.RoomDataHandler

package com.sulake.habbo.session.handler{
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.session.IRoomHandlerListener;
    import com.sulake.core.communication.messages.IMessageEvent;

    public class RoomDataHandler extends BaseHandler {

        public function RoomDataHandler(k:IConnection, _arg_2:IRoomHandlerListener);

        private function onRoomResult(k:IMessageEvent):void;


    }
}//package com.sulake.habbo.session.handler

