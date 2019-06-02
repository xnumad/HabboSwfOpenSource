//com.sulake.habbo.communication.messages.incoming.users.GuildEditorData

package com.sulake.habbo.communication.messages.incoming.users{
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GuildEditorData {

        private var _baseParts:Vector.<BadgePartData>;
        private var _layerParts:Vector.<BadgePartData>;
        private var _badgeColors:Vector.<GuildColorData>;
        private var _guildPrimaryColors:Vector.<GuildColorData>;
        private var _guildSecondaryColors:Vector.<GuildColorData>;

        public function GuildEditorData(k:IMessageDataWrapper=null);

        public function get baseParts():Vector.<BadgePartData>;

        public function get layerParts():Vector.<BadgePartData>;

        public function get badgeColors():Vector.<GuildColorData>;

        public function get guildPrimaryColors():Vector.<GuildColorData>;

        public function get guildSecondaryColors():Vector.<GuildColorData>;

        public function findMatchingPrimaryColorId(k:int):int;

        public function findMatchingSecondaryColorId(k:int):int;

        private function findClosestColor(k:GuildColorData, _arg_2:Vector.<GuildColorData>):int;


    }
}//package com.sulake.habbo.communication.messages.incoming.users

