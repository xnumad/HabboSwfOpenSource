package com.sulake.habbo.communication.messages.incoming.groupforums
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.groupforums._Str_7217;

    public class _Str_9446 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9446(k:Function)
        {
            super(k, _Str_7217);
        }

        public function getParser():_Str_7217
        {
            return this._parser as _Str_7217;
        }
    }
}
