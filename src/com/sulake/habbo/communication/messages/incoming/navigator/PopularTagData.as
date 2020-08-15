package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PopularTagData
    {
        private var _tagName:String;
        private var _userCount:int;

        public function PopularTagData(k:IMessageDataWrapper)
        {
            this._tagName = k.readString();
            this._userCount = k.readInteger();
        }

        public function get tagName():String
        {
            return this._tagName;
        }

        public function get userCount():int
        {
            return this._userCount;
        }
    }
}
