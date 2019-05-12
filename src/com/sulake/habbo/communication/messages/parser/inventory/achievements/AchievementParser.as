package com.sulake.habbo.communication.messages.parser.inventory.achievements
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.inventory.achievements.Achievement;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class AchievementParser implements IMessageParser 
    {
        private var _achievement:Achievement;


        public function flush():Boolean
        {
            this._achievement = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._achievement = new Achievement(k);
            return true;
        }

        public function get achievement():Achievement
        {
            return this._achievement;
        }
    }
}
