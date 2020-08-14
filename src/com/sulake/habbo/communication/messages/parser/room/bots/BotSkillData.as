package com.sulake.habbo.communication.messages.parser.room.bots
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class BotSkillData
    {
        private var _id:int;
        private var _data:String;

        public function BotSkillData(k:IMessageDataWrapper)
        {
            this.parse(k);
        }

        public function parse(k:IMessageDataWrapper):void
        {
            this._id = k.readInteger();
            this._data = k.readString();
        }

        public function get id():int
        {
            return this._id;
        }

        public function get data():String
        {
            return this._data;
        }
    }
}
