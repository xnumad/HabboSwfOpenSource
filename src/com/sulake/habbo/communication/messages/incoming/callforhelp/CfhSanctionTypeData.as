package com.sulake.habbo.communication.messages.incoming.callforhelp
{
    import com.sulake.habbo.communication.messages.incoming.moderation.INamed;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class CfhSanctionTypeData implements INamed
    {
        private var _name:String;
        private var _sanctionLengthInHours:int;
        private var _probationDays:int;
        private var _avatarOnly:Boolean;
        private var _tradeLockInfo:String = "";
        private var _machineBanInfo:String = "";

        public function CfhSanctionTypeData(k:IMessageDataWrapper)
        {
            this._name = k.readString();
            this._sanctionLengthInHours = k.readInteger();
            this._probationDays = k.readInteger();
            this._avatarOnly = k.readBoolean();
            if (k.bytesAvailable)
            {
                this._tradeLockInfo = k.readString();
            }
            if (k.bytesAvailable)
            {
                this._machineBanInfo = k.readString();
            }
            Logger.log(((((((((("READ CFH SANCTION TYPE: " + this._name) + ", length: ") + this._sanctionLengthInHours) + ", avatar only: ") + this._avatarOnly) + ", trade lock info: ") + this._tradeLockInfo) + ", machine ban info: ") + this._machineBanInfo));
        }

        public function get name():String
        {
            return this._name;
        }

        public function get sanctionLengthInHours():int
        {
            return this._sanctionLengthInHours;
        }

        public function get avatarOnly():Boolean
        {
            return this._avatarOnly;
        }

        public function get tradeLockInfo():String
        {
            return this._tradeLockInfo;
        }

        public function get machineBanInfo():String
        {
            return this._machineBanInfo;
        }
    }
}
