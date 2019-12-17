package com.sulake.habbo.communication.messages.incoming._Str_329
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.recycler.RecyclerPrizesMessageParser;

    public class _Str_7079 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7079(k:Function)
        {
            super(k, RecyclerPrizesMessageParser);
        }

        public function getParser():RecyclerPrizesMessageParser
        {
            return _parser as RecyclerPrizesMessageParser;
        }
    }
}
