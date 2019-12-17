package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.HeightMapMessageParser;

    public class _Str_7242 extends MessageEvent 
    {
        public function _Str_7242(k:Function)
        {
            super(k, HeightMapMessageParser);
        }

        public function getParser():HeightMapMessageParser
        {
            return _parser as HeightMapMessageParser;
        }
    }
}
