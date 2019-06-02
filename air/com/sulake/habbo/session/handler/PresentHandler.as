//com.sulake.habbo.session.handler.PresentHandler

package com.sulake.habbo.session.handler{
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.session.IRoomHandlerListener;
    import com.sulake.core.communication.messages.IMessageEvent;

    public class PresentHandler extends BaseHandler {

        public function PresentHandler(k:IConnection, _arg_2:IRoomHandlerListener);

        private function onPresentOpened(k:IMessageEvent):void;


    }
}//package com.sulake.habbo.session.handler

