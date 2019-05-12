package com.sulake.habbo.communication.messages.parser.inventory.achievements
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class AchievementsScoreParser implements IMessageParser 
    {
        private var _score:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._score = k.readInteger();
            return true;
        }

        public function get score():int
        {
            return this._score;
        }
    }
}
