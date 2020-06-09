package com.sulake.habbo.communication.messages.parser.inventory.badges
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class IsBadgeRequestFulfilledParser implements IMessageParser
    {
        private var _requestCode:String;
        private var _fulfilled:Boolean;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._requestCode = k.readString();
            this._fulfilled = k.readBoolean();
            return true;
        }

        public function get requestCode():String
        {
            return this._requestCode;
        }

        public function get fulfilled():Boolean
        {
            return this._fulfilled;
        }
    }
}
