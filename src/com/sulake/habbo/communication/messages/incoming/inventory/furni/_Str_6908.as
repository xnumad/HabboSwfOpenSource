package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.furni.FurniListRemoveParser;

    public class _Str_6908 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_6908(k:Function)
        {
            super(k, FurniListRemoveParser);
        }

        public function getParser():FurniListRemoveParser
        {
            return this._parser as FurniListRemoveParser;
        }
    }
}
