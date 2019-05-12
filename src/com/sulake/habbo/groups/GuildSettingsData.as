package com.sulake.habbo.groups
{
    import com.sulake.habbo.communication.messages.incoming.users._Str_5716;

    public class GuildSettingsData 
    {
        private var _guildType:int = 0;
        private var _rightsLevel:int = 0;
        private var _modified:Boolean = false;

        public function GuildSettingsData(k:_Str_5716=null)
        {
            if (k == null)
            {
                return;
            }
            this._guildType = k._Str_4830;
            this._rightsLevel = k._Str_17566;
        }

        public function get _Str_4830():int
        {
            return this._guildType;
        }

        public function set _Str_4830(k:int):void
        {
            if (k != this._guildType)
            {
                this._modified = true;
            }
            this._guildType = k;
        }

        public function get _Str_7959():int
        {
            return this._rightsLevel;
        }

        public function set _Str_7959(k:int):void
        {
            if (k != this._rightsLevel)
            {
                this._modified = true;
            }
            this._rightsLevel = k;
        }

        public function get _Str_22472():Boolean
        {
            return this._modified;
        }

        public function _Str_15948():void
        {
            this._modified = false;
        }
    }
}
