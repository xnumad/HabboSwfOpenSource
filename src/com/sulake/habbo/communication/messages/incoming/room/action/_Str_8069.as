package com.sulake.habbo.communication.messages.incoming.room.action
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.action._Str_6590;

    public class _Str_8069 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8069(k:Function)
        {
            super(k, _Str_6590);
        }

        public function getParser():_Str_6590
        {
            return _parser as _Str_6590;
        }
    }
}
