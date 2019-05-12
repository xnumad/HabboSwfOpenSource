package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog._Str_11623;

    public class _Str_8418 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8418(k:Function)
        {
            super(k, _Str_11623);
        }

        public function get errorCode():String
        {
            return (_parser as _Str_11623).errorCode;
        }
    }
}
