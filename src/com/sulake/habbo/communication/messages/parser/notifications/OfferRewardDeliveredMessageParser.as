package com.sulake.habbo.communication.messages.parser.notifications
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class OfferRewardDeliveredMessageParser implements IMessageParser
    {
        private var _contentType:String;
        private var _classId:int;
        private var _name:String;
        private var _description:String;


        public function flush():Boolean
        {
            this._contentType = null;
            this._classId = 0;
            this._name = null;
            this._description = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._contentType = k.readString();
            this._classId = k.readInteger();
            this._name = k.readString();
            this._description = k.readString();
            return true;
        }

        public function get contentType():String
        {
            return this._contentType;
        }

        public function get classId():int
        {
            return this._classId;
        }

        public function get name():String
        {
            return this._name;
        }

        public function get description():String
        {
            return this._description;
        }
    }
}
