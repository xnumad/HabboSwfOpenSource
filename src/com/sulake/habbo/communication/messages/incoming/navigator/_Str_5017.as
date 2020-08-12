package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator.PopularRoomTagsResultMessageParser;

    public class _Str_5017 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_5017(k:Function)
        {
            super(k, PopularRoomTagsResultMessageParser);
        }

        public function getParser():PopularRoomTagsResultMessageParser
        {
            return this._parser as PopularRoomTagsResultMessageParser;
        }
    }
}
