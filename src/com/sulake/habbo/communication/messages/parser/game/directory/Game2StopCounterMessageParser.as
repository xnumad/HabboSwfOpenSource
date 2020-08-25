package com.sulake.habbo.communication.messages.parser.game.directory
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class Game2StopCounterMessageParser implements IMessageParser
    {


        public function flush():Boolean
        {
            return false;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            return false;
        }
    }
}
