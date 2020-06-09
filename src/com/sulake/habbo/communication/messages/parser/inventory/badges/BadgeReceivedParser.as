package com.sulake.habbo.communication.messages.parser.inventory.badges
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class BadgeReceivedParser implements IMessageParser
    {
        private var _badgeId:int;
        private var _badgeCode:String;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._badgeId = k.readInteger();
            this._badgeCode = k.readString();
            return true;
        }

        public function get badgeId():int
        {
            return this._badgeId;
        }

        public function get badgeCode():String
        {
            return this._badgeCode;
        }
    }
}
