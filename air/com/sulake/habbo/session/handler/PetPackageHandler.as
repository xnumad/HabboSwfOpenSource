//com.sulake.habbo.session.handler.PetPackageHandler

package com.sulake.habbo.session.handler{
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.session.IRoomHandlerListener;
    import com.sulake.core.communication.messages.IMessageEvent;

    public class PetPackageHandler extends BaseHandler {

        public function PetPackageHandler(k:IConnection, _arg_2:IRoomHandlerListener);

        private function onOpenPetPackageRequested(k:IMessageEvent):void;

        private function onOpenPetPackageResult(k:IMessageEvent):void;


    }
}//package com.sulake.habbo.session.handler

