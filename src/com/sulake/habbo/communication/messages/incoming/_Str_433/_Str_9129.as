package com.sulake.habbo.communication.messages.incoming._Str_433
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.bots._Str_7631;

    public class _Str_9129 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9129(k:Function)
        {
            super(k, _Str_7631);
        }

        public function getParser():_Str_7631
        {
            return _parser as _Str_7631;
        }
    }
}
