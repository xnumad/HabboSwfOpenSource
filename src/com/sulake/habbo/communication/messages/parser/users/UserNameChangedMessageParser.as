package com.sulake.habbo.communication.messages.parser.users
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class UserNameChangedMessageParser implements IMessageParser 
    {
        private var _webId:int;
        private var _id:int;
        private var _newName:String;


        public function get webId():int
        {
            return this._webId;
        }

        public function get id():int
        {
            return this._id;
        }

        public function get newName():String
        {
            return this._newName;
        }

        public function flush():Boolean
        {
            this._webId = -1;
            this._id = -1;
            this._newName = "";
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._webId = k.readInteger();
            this._id = k.readInteger();
            this._newName = k.readString();
            return true;
        }
    }
}
