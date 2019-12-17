package com.sulake.habbo.communication.messages.incoming._Str_348
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.directory._Str_9647;

    public class _Str_18475 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_18475(k:Function)
        {
            super(k, _Str_9647);
        }

        public function getParser():_Str_9647
        {
            return this._parser as _Str_9647;
        }
    }
}
