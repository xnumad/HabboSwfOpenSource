package com.sulake.habbo.communication.messages.incoming.newnavigator
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.newnavigator.NavigatorLiftedRoomsParser;

    public class _Str_8469 extends MessageEvent 
    {
        public function _Str_8469(k:Function)
        {
            super(k, NavigatorLiftedRoomsParser);
        }

        public function getParser():NavigatorLiftedRoomsParser
        {
            return parser as NavigatorLiftedRoomsParser;
        }
    }
}
