package com.sulake.habbo.communication.messages.parser.room.engine
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class UserChangeMessageParser implements IMessageParser
    {
        private var _id:int;
        private var _figure:String;
        private var _sex:String;
        private var _customInfo:String;
        private var _activityPoints:int;


        public function get id():int
        {
            return this._id;
        }

        public function get figure():String
        {
            return this._figure;
        }

        public function get sex():String
        {
            return this._sex;
        }

        public function get customInfo():String
        {
            return this._customInfo;
        }

        public function get activityPoints():int
        {
            return this._activityPoints;
        }

        public function flush():Boolean
        {
            this._id = 0;
            this._figure = "";
            this._sex = "";
            this._customInfo = "";
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._id = k.readInteger();
            this._figure = k.readString();
            this._sex = k.readString();
            this._customInfo = k.readString();
            this._activityPoints = k.readInteger();
            if (this._sex)
            {
                this._sex = this._sex.toUpperCase();
            }
            return true;
        }
    }
}
