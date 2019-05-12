package com.sulake.habbo.communication.messages.parser.users
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.users.ExtendedProfileData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class ExtendedProfileMessageParser implements IMessageParser 
    {
        private var _data:ExtendedProfileData;


        public function flush():Boolean
        {
            this._data = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._data = new ExtendedProfileData(k);
            return true;
        }

        public function get data():ExtendedProfileData
        {
            return this._data;
        }
    }
}
