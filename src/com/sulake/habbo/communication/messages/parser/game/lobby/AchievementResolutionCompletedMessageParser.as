package com.sulake.habbo.communication.messages.parser.game.lobby
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class AchievementResolutionCompletedMessageParser implements IMessageParser 
    {
        private var _stuffCode:String;
        private var _badgeCode:String;


        public function flush():Boolean
        {
            this._stuffCode = "";
            this._badgeCode = "";
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._stuffCode = k.readString();
            this._badgeCode = k.readString();
            return true;
        }

        public function get stuffCode():String
        {
            return this._stuffCode;
        }

        public function get badgeCode():String
        {
            return this._badgeCode;
        }
    }
}
