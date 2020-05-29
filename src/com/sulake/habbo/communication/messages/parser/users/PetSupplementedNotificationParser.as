package com.sulake.habbo.communication.messages.parser.users
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PetSupplementedNotificationParser implements IMessageParser
    {
        private var _petId:int;
        private var _userId:int;
        private var _supplementType:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._petId = k.readInteger();
            this._userId = k.readInteger();
            this._supplementType = k.readInteger();
            return true;
        }

        public function get petId():int
        {
            return this._petId;
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function get supplementType():int
        {
            return this._supplementType;
        }
    }
}
