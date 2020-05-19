package com.sulake.habbo.communication.messages.incoming.room.action
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.action.DanceMessageParser;

    public class _Str_5619 extends MessageEvent 
    {
        public function _Str_5619(k:Function)
        {
            super(k, DanceMessageParser);
        }

        public function getParser():DanceMessageParser
        {
            return _parser as DanceMessageParser;
        }
    }
}
