package com.sulake.habbo.communication.messages.incoming.callforhelp
{
    import com.sulake.habbo.communication.messages.incoming.moderation.INamed;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class CallForHelpTopicData implements INamed
    {
        private var _name:String;
        private var _id:int;
        private var _consequence:String;

        public function CallForHelpTopicData(k:IMessageDataWrapper)
        {
            this._name = k.readString();
            this._id = k.readInteger();
            this._consequence = k.readString();
            Logger.log(((((("READ CFH TOPIC NAME: " + this._name) + ", ID: ") + this._id) + ", CONSEQUENCE: ") + this._consequence));
        }

        public function get name():String
        {
            return this._name;
        }

        public function get id():int
        {
            return this._id;
        }

        public function get _Str_26337():String
        {
            return this._consequence;
        }
    }
}
