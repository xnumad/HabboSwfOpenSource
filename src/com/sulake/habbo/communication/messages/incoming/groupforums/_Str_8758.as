package com.sulake.habbo.communication.messages.incoming.groupforums
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.groupforums._Str_7149;

    public class _Str_8758 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8758(k:Function)
        {
            super(k, _Str_7149);
        }

        public function getParser():_Str_7149
        {
            return this._parser as _Str_7149;
        }
    }
}
