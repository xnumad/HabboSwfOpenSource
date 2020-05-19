package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.furni.FurniListParser;

    public class _Str_5581 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_5581(k:Function)
        {
            super(k, FurniListParser);
        }

        public function getParser():FurniListParser
        {
            return this._parser as FurniListParser;
        }
    }
}
