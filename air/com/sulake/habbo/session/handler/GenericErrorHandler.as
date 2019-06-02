//com.sulake.habbo.session.handler.GenericErrorHandler

package com.sulake.habbo.session.handler{
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.session.IRoomHandlerListener;
    import com.sulake.core.communication.messages.IMessageEvent;

    public class GenericErrorHandler extends BaseHandler {

        public function GenericErrorHandler(k:IConnection, _arg_2:IRoomHandlerListener);

        private function onGenericError(k:IMessageEvent):void;


    }
}//package com.sulake.habbo.session.handler

