//com.sulake.habbo.session.handler.AvatarEffectsHandler

package com.sulake.habbo.session.handler{
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.session.IRoomHandlerListener;
    import com.sulake.core.communication.messages.IMessageEvent;

    public class AvatarEffectsHandler extends BaseHandler {

        public function AvatarEffectsHandler(k:IConnection, _arg_2:IRoomHandlerListener);

        private function onAvatarEffects(k:IMessageEvent):void;


    }
}//package com.sulake.habbo.session.handler

