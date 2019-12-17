package com.sulake.habbo.communication.messages.incoming.groupforums
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.groupforums._Str_5956;

    public class _Str_9518 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9518(k:Function)
        {
            super(k, _Str_5956);
        }

        public function getParser():_Str_5956
        {
            return this._parser as _Str_5956;
        }
    }
}
