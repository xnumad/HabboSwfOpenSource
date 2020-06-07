package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.SellablePetPalettesParser;

    public class _Str_8784 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8784(k:Function)
        {
            super(k, SellablePetPalettesParser);
        }

        public function getParser():SellablePetPalettesParser
        {
            return this._parser as SellablePetPalettesParser;
        }
    }
}
