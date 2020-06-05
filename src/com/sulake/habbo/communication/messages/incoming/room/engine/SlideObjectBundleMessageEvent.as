package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.SlideObjectBundleMessageParser;

    public class SlideObjectBundleMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function SlideObjectBundleMessageEvent(k:Function)
        {
            super(k, SlideObjectBundleMessageParser);
        }

        public function getParser():SlideObjectBundleMessageParser
        {
            return _parser as SlideObjectBundleMessageParser;
        }
    }
}
