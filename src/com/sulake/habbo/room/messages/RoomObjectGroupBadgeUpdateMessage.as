package com.sulake.habbo.room.messages
{
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class RoomObjectGroupBadgeUpdateMessage extends RoomObjectUpdateMessage 
    {
        public static const ROGBUM_BADGE_LOADED:String = "ROGBUM_BADGE_LOADED";

        private var _badgeId:String;
        private var _assetName:String;

        public function RoomObjectGroupBadgeUpdateMessage(k:String, _arg_2:String)
        {
            super(null, null);
            this._badgeId = k;
            this._assetName = _arg_2;
        }

        public function get badgeId():String
        {
            return this._badgeId;
        }

        public function get assetName():String
        {
            return this._assetName;
        }
    }
}
