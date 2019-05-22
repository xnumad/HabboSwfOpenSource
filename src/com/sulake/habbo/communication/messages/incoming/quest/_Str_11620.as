package com.sulake.habbo.communication.messages.incoming.quest
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_11620 
    {
        private var _Str_19085:int;
        private var _Str_21282:String;
        private var _userRank:int;
        private var _Str_19212:String;
        private var _badge:Boolean;
        private var _Str_12218:String;

        public function _Str_11620(k:IMessageDataWrapper)
        {
            this._Str_19085 = k.readInteger();
            this._Str_21282 = k.readString();
            this._userRank = k.readInteger();
            this._Str_19212 = k.readString();
            this._badge = k.readBoolean();
            this._Str_12218 = k.readString();
        }

        public function get _Str_26147():int
        {
            return this._Str_19085;
        }

        public function get _Str_25933():String
        {
            return this._Str_21282;
        }

        public function get userRank():int
        {
            return this._userRank;
        }

        public function get _Str_26364():String
        {
            return this._Str_19212;
        }

        public function get badge():Boolean
        {
            return this._badge;
        }

        public function get localizedName():String
        {
            return this._Str_12218;
        }
    }
}
