package com.sulake.habbo.communication.messages.parser.inventory.achievements
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.inventory.achievements.Achievement;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class AchievementsParser implements IMessageParser 
    {
        private var _achievements:Array;
        private var _Str_19269:String;


        public function flush():Boolean
        {
            this._achievements = new Array();
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._achievements = new Array();
            var count:int = k.readInteger();
            var index:int;
            while (index < count)
            {
                this._achievements.push(new Achievement(k));
                index++;
            }
            this._Str_19269 = k.readString();
            return true;
        }

        public function get achievements():Array
        {
            return this._achievements;
        }

        public function get defaultCategory():String
        {
            return this._Str_19269;
        }
    }
}
