package com.sulake.habbo.communication.messages.incoming._Str_348
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.directory._Str_9702;

    public class _Str_17148 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_17148(k:Function)
        {
            super(k, _Str_9702);
        }

        public function getParser():_Str_9702
        {
            return this._parser as _Str_9702;
        }
    }
}
