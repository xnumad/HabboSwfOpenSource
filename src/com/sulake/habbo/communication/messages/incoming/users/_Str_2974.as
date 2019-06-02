package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_2974 
    {
        public static const _Str_6787:int = 0;
        public static const _Str_6562:int = 1;
        public static const _Str_7780:int = 2;
        public static const _Str_11591:int = 3;
        public static const _Str_8761:int = 4;
        public static const _Str_15167:int = 0;
        public static const _Str_8362:int = 1;
        public static const _Str_16876:int = 2;

        private var _groupId:int;
        private var _Str_16148:Boolean;
        private var _type:int;
        private var _groupName:String;
        private var _description:String;
        private var _Str_2722:String;
        private var _roomId:int = -1;
        private var _roomName:String = "";
        private var _status:int;
        private var _totalMembers:int;
        private var _favourite:Boolean;
        private var _creationDate:String;
        private var _Str_4514:Boolean;
        private var _Str_14681:Boolean;
        private var _ownerName:String;
        private var _Str_20023:Boolean;
        private var _Str_19985:Boolean;
        private var _Str_22088:Boolean;
        private var _Str_21164:int;

        public function _Str_2974(k:IMessageDataWrapper)
        {
            this._groupId = k.readInteger();
            this._Str_16148 = k.readBoolean();
            this._type = k.readInteger();
            this._groupName = k.readString();
            this._description = k.readString();
            this._Str_2722 = k.readString();
            this._roomId = k.readInteger();
            this._roomName = k.readString();
            this._status = k.readInteger();
            this._totalMembers = k.readInteger();
            this._favourite = k.readBoolean();
            this._creationDate = k.readString();
            this._Str_4514 = k.readBoolean();
            this._Str_14681 = k.readBoolean();
            this._ownerName = k.readString();
            this._Str_20023 = k.readBoolean();
            this._Str_22088 = k.readBoolean();
            this._Str_21164 = k.readInteger();
            this._Str_19985 = k.readBoolean();
        }

        public function get groupId():int
        {
            return this._groupId;
        }

        public function get _Str_6444():Boolean
        {
            return this._Str_16148;
        }

        public function get type():int
        {
            return this._type;
        }

        public function get groupName():String
        {
            return this._groupName;
        }

        public function get description():String
        {
            return this._description;
        }

        public function get badgeCode():String
        {
            return this._Str_2722;
        }

        public function get roomId():int
        {
            return this._roomId;
        }

        public function get roomName():String
        {
            return this._roomName;
        }

        public function get status():int
        {
            return this._status;
        }

        public function get totalMembers():int
        {
            return this._totalMembers;
        }

        public function get favourite():Boolean
        {
            return this._favourite;
        }

        public function get creationDate():String
        {
            return this._creationDate;
        }

        public function get _Str_3233():Boolean
        {
            return this._Str_4514;
        }

        public function get isAdmin():Boolean
        {
            return this._Str_14681;
        }

        public function get ownerName():String
        {
            return this._ownerName;
        }

        public function get _Str_8199():Boolean
        {
            return this._Str_20023;
        }

        public function get _Str_17307():Boolean
        {
            return this._Str_22088;
        }

        public function get _Str_18324():int
        {
            return this._Str_21164;
        }

        public function get _Str_25156():Boolean
        {
            return this._Str_19985;
        }

        public function get _Str_19430():Boolean
        {
            return (this._status == _Str_2974._Str_15167) && ((this._type == _Str_6787) || (this._type == _Str_8761));
        }

        public function get _Str_21531():Boolean
        {
            return (this._status == _Str_2974._Str_15167) && (this._type == _Str_2974._Str_6562);
        }

        public function get _Str_24358():Boolean
        {
            return ((this._Str_16148) && (!(this._Str_4514))) && (this._status == _Str_2974._Str_8362);
        }
    }
}
