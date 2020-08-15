package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class HabboGroupEntryData
    {
        private var _groupId:int;
        private var _groupName:String;
        private var _badgeCode:String;
        private var _Str_6751:String;
        private var _Str_6979:String;
        private var _favourite:Boolean;
        private var _ownerId:int;
        private var _Str_19808:Boolean;

        public function HabboGroupEntryData(k:IMessageDataWrapper)
        {
            this._groupId = k.readInteger();
            this._groupName = k.readString();
            this._badgeCode = k.readString();
            this._Str_6751 = k.readString();
            this._Str_6979 = k.readString();
            this._favourite = k.readBoolean();
            this._ownerId = k.readInteger();
            this._Str_19808 = k.readBoolean();
        }

        public function get groupId():int
        {
            return this._groupId;
        }

        public function get groupName():String
        {
            return this._groupName;
        }

        public function get badgeCode():String
        {
            return this._badgeCode;
        }

        public function get _Str_5845():String
        {
            return this._Str_6751;
        }

        public function get _Str_6659():String
        {
            return this._Str_6979;
        }

        public function get favourite():Boolean
        {
            return this._favourite;
        }

        public function get ownerId():int
        {
            return this._ownerId;
        }

        public function get _Str_21674():Boolean
        {
            return this._Str_19808;
        }
    }
}
