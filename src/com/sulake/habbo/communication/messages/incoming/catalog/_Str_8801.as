package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog._Str_8488;

    public class _Str_8801 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8801(k:Function)
        {
            super(k, _Str_8488);
        }

        public function get productName():String
        {
            return (_parser as _Str_8488).productName;
        }

        public function get productDescription():String
        {
            return (_parser as _Str_8488).productDescription;
        }
    }
}
