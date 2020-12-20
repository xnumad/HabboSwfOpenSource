package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.GuideSessionRequesterRoomMessageParser;

    public class GuideSessionRequesterRoomMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function GuideSessionRequesterRoomMessageEvent(k:Function)
        {
            super(k, GuideSessionRequesterRoomMessageParser);
        }

        public function getParser():GuideSessionRequesterRoomMessageParser
        {
            return _parser as GuideSessionRequesterRoomMessageParser;
        }
    }
}
