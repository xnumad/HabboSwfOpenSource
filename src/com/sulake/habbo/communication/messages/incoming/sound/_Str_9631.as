package com.sulake.habbo.communication.messages.incoming.sound
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.sound._Str_8571;

    public class _Str_9631 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9631(k:Function)
        {
            super(k, _Str_8571);
        }

        public function getParser():_Str_8571
        {
            return this._parser as _Str_8571;
        }
    }
}
