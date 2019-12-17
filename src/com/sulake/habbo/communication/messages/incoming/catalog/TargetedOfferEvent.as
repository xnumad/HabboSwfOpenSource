package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog._Str_7335;

    public class TargetedOfferEvent extends MessageEvent implements IMessageEvent 
    {
        public function TargetedOfferEvent(k:Function)
        {
            super(k, _Str_7335);
        }

        public function getParser():_Str_7335
        {
            return this._parser as _Str_7335;
        }
    }
}
