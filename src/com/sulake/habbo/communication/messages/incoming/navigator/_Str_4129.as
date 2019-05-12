package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_11735;

    public class _Str_4129 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_4129(k:Function)
        {
            super(k, _Str_11735);
        }

        public function get userName():String
        {
            return (this._parser as _Str_11735).userName;
        }
    }
}
