package com.sulake.habbo.communication.messages.incoming.game.directory
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.directory._Str_6554;

    public class Game2AccountGameStatusMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function Game2AccountGameStatusMessageEvent(k:Function)
        {
            super(k, _Str_6554);
        }

        public function getParser():_Str_6554
        {
            return this._parser as _Str_6554;
        }
    }
}
