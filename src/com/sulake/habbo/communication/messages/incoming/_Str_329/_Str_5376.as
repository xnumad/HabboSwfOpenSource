package com.sulake.habbo.communication.messages.incoming._Str_329
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.recycler.RecyclerStatusMessageParser;

    public class _Str_5376 extends MessageEvent implements IMessageEvent 
    {
        public static const _Str_16635:int = 1;
        public static const _Str_14635:int = 2;
        public static const _Str_16908:int = 3;

        public function _Str_5376(k:Function)
        {
            super(k, RecyclerStatusMessageParser);
        }

        public function getParser():RecyclerStatusMessageParser
        {
            return _parser as RecyclerStatusMessageParser;
        }
    }
}
