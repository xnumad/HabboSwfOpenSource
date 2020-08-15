package com.sulake.habbo.session.handler
{
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.session.IRoomHandlerListener;
    import com.sulake.habbo.communication.messages.incoming.inventory.avatareffect.AvatarEffectsMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.avatareffect.AvatarEffectsMessageParser;
    import com.sulake.core.communication.messages.IMessageEvent;

    public class AvatarEffectsHandler extends BaseHandler 
    {
        public function AvatarEffectsHandler(k:IConnection, _arg_2:IRoomHandlerListener)
        {
            super(k, _arg_2);
            if (k == null)
            {
                return;
            }
        }

        private function onAvatarEffects(k:IMessageEvent):void
        {
            var _local_2:AvatarEffectsMessageEvent = (k as AvatarEffectsMessageEvent);
            var _local_3:AvatarEffectsMessageParser = (_local_2.getParser() as AvatarEffectsMessageParser);
            Logger.log(("Received active avatar effects: " + _local_3.effects));
            if (((listener) && (listener.events)))
            {
            }
        }
    }
}
