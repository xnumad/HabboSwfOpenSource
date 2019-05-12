package com.sulake.habbo.communication.messages.incoming.friendlist
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendlist._Str_8705;

    public class _Str_8800 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8800(k:Function)
        {
            super(k, _Str_8705);
        }

        public function get success():Boolean
        {
            return _Str_8705(_parser).success;
        }
    }
}
