package com.sulake.habbo.communication.messages.incoming.game.directory
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.directory.Game2StartingGameFailedMessageParser;

    public class _Str_18557 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_18557(k:Function)
        {
            super(k, Game2StartingGameFailedMessageParser);
        }

        public function getParser():Game2StartingGameFailedMessageParser
        {
            return this._parser as Game2StartingGameFailedMessageParser;
        }
    }
}
