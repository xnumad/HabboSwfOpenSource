//com.sulake.habbo.session.handler.RoomDimmerPresetsHandler

package com.sulake.habbo.session.handler{
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.session.IRoomHandlerListener;
    import com.sulake.core.communication.messages.IMessageEvent;

    public class RoomDimmerPresetsHandler extends BaseHandler {

        public function RoomDimmerPresetsHandler(k:IConnection, _arg_2:IRoomHandlerListener);

        private function onRoomDimmerPresets(k:IMessageEvent):void;


    }
}//package com.sulake.habbo.session.handler

