package com.sulake.habbo.groups.events
{
    import flash.events.Event;

    public class GuildSettingsChangedInManageEvent extends Event 
    {
        public static const GSCIME_GUILD_VISUAL_SETTINGS_CHANGED:String = "GSCIME_GUILD_VISUAL_SETTINGS_CHANGED";

        private var _guildId:int;

        public function GuildSettingsChangedInManageEvent(k:String, _arg_2:int, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(k, _arg_3, _arg_4);
            this._guildId = _arg_2;
        }

        public function get _Str_3916():int
        {
            return this._guildId;
        }
    }
}
