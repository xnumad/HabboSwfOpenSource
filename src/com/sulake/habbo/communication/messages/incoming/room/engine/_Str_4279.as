package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.FloorHeightMapMessageParser;

    public class _Str_4279 extends MessageEvent 
    {
        public function _Str_4279(k:Function)
        {
            super(k, FloorHeightMapMessageParser);
        }

        public function getParser():FloorHeightMapMessageParser
        {
            return _parser as FloorHeightMapMessageParser;
        }
    }
}
