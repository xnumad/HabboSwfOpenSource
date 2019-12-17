package com.sulake.habbo.session.handler
{
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.session.IRoomHandlerListener;
    import com.sulake.habbo.communication.messages.incoming.inventory.avatareffect._Str_6450;
    import com.sulake.habbo.communication.messages.parser.inventory.avatareffect._Str_5747;
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
            var _local_2:_Str_6450 = (k as _Str_6450);
            var _local_3:_Str_5747 = (_local_2.getParser() as _Str_5747);
            Logger.log(("Received active avatar effects: " + _local_3.effects));
            if (((listener) && (listener.events)))
            {
            }
        }
    }
}
