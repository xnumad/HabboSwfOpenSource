package com.sulake.habbo.groups
{
    import com.sulake.habbo.communication.messages.incoming.users.IGuildData;

    public class GuildSettingsData 
    {
        private var _guildType:int = 0;
        private var _rightsLevel:int = 0;
        private var _modified:Boolean = false;

        public function GuildSettingsData(k:IGuildData=null)
        {
            if (k == null)
            {
                return;
            }
            this._guildType = k.guildType;
            this._rightsLevel = k.guildRightsLevel;
        }

        public function get guildType():int
        {
            return this._guildType;
        }

        public function set guildType(k:int):void
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
