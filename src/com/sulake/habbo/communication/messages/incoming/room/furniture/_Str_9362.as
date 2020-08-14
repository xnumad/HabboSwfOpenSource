package com.sulake.habbo.communication.messages.incoming.room.furniture
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture.CustomStackingHeightUpdateMessageParser;

    public class _Str_9362 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9362(k:Function)
        {
            super(k, CustomStackingHeightUpdateMessageParser);
        }

        public function getParser():CustomStackingHeightUpdateMessageParser
        {
            return _parser as CustomStackingHeightUpdateMessageParser;
        }
    }
}
