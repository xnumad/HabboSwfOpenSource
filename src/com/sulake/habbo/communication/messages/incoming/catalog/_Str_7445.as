package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog._Str_6581;

    public class _Str_7445 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7445(k:Function)
        {
            super(k, _Str_6581);
        }

        public function get offer():CatalogPageMessageOfferData
        {
            return _Str_6581(parser)._Str_17889;
        }

        public function get pageId():int
        {
            return _Str_6581(parser).pageId;
        }
    }
}
