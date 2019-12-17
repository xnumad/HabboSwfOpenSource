package com.sulake.habbo.communication.messages.incoming.inventory.clothes
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.clothing._Str_9021;

    public class _Str_17532 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_17532(k:Function)
        {
            super(k, _Str_9021);
        }

        public function getParser():_Str_9021
        {
            return _parser as _Str_9021;
        }
    }
}
