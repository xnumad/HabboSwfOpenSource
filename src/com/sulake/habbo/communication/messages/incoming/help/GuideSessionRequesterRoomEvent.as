package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.GuideSessionRequesterRoomMessageParser;

    public class GuideSessionRequesterRoomEvent extends MessageEvent implements IMessageEvent 
    {
        public function GuideSessionRequesterRoomEvent(k:Function)
        {
            super(k, GuideSessionRequesterRoomMessageParser);
        }

        public function _Str_2273():GuideSessionRequesterRoomMessageParser
        {
            return _parser as GuideSessionRequesterRoomMessageParser;
        }
    }
}
