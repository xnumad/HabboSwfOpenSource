package com.sulake.habbo.communication.messages.incoming.avatar
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.avatar.WardrobeMessageParser;

    public class WardrobeMessageEvent extends MessageEvent implements IMessageEvent
    {
        public static const _Str_19210:int = 0;
        public static const _Str_19183:int = 1;

        public function WardrobeMessageEvent(k:Function)
        {
            super(k, WardrobeMessageParser);
        }

        private function getParser():WardrobeMessageParser
        {
            return this._parser as WardrobeMessageParser;
        }

        public function get _Str_17746():Array
        {
            return this.getParser().outfits;
        }

        public function get state():int
        {
            return this.getParser().state;
        }
    }
}
