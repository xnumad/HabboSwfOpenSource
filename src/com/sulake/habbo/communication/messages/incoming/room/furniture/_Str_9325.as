package com.sulake.habbo.communication.messages.incoming.room.furniture
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture.YoutubeControlVideoMessageParser;

    public class _Str_9325 extends MessageEvent 
    {
        public function _Str_9325(k:Function)
        {
            super(k, YoutubeControlVideoMessageParser);
        }

        public function getParser():YoutubeControlVideoMessageParser
        {
            return parser as YoutubeControlVideoMessageParser;
        }
    }
}
