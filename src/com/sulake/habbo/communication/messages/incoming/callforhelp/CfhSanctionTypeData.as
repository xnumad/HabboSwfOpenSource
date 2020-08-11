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
        private var _Str_17021:String = "";
        private var _Str_16444:String = "";

        public function CfhSanctionTypeData(k:IMessageDataWrapper)
        {
            this._name = k.readString();
            this._sanctionLengthInHours = k.readInteger();
            this._probationDays = k.readInteger();
            this._avatarOnly = k.readBoolean();
            if (k.bytesAvailable)
            {
                this._Str_17021 = k.readString();
            }
            if (k.bytesAvailable)
            {
                this._Str_16444 = k.readString();
            }
            Logger.log(((((((((("READ CFH SANCTION TYPE: " + this._name) + ", length: ") + this._sanctionLengthInHours) + ", avatar only: ") + this._avatarOnly) + ", trade lock info: ") + this._Str_17021) + ", machine ban info: ") + this._Str_16444));
        }

        public function get name():String
        {
            return this._name;
        }

        public function get _Str_16119():int
        {
            return this._sanctionLengthInHours;
        }

        public function get _Str_25147():Boolean
        {
            return this._avatarOnly;
        }

        public function get _Str_20573():String
        {
            return this._Str_17021;
        }

        public function get _Str_19607():String
        {
            return this._Str_16444;
        }
    }
}
