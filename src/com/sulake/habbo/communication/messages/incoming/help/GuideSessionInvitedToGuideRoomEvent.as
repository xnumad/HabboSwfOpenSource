package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.GuideSessionInvitedToGuideRoomMessageParser;

    public class GuideSessionInvitedToGuideRoomEvent extends MessageEvent implements IMessageEvent 
    {
        public function GuideSessionInvitedToGuideRoomEvent(k:Function)
        {
            super(k, GuideSessionInvitedToGuideRoomMessageParser);
        }
    }
}
