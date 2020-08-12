package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;

    public class _Str_6109 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_6109(k:Function)
        {
            super(k, FavouritesMessageParser);
        }

        public function getParser():FavouritesMessageParser
        {
            return this._parser as FavouritesMessageParser;
        }
    }
}
