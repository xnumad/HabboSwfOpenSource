package com.sulake.habbo.communication.messages.incoming.users
{
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import com.sulake.room.utils.IVector3d;
    import com.sulake.room.utils.ColorConverter;
    import __AS3__.vec.*;

    public class GuildEditorData 
    {
        private var _baseParts:Vector.<BadgePartData>;
        private var _layerParts:Vector.<BadgePartData>;
        private var _badgeColors:Vector.<GuildColorData>;
        private var _guildPrimaryColors:Vector.<GuildColorData>;
        private var _guildSecondaryColors:Vector.<GuildColorData>;

        public function GuildEditorData(k:IMessageDataWrapper=null)
        {
            var _local_2:int;
            var _local_3:int;
            this._baseParts = new Vector.<BadgePartData>();
            this._layerParts = new Vector.<BadgePartData>();
            this._badgeColors = new Vector.<GuildColorData>();
            this._guildPrimaryColors = new Vector.<GuildColorData>();
            this._guildSecondaryColors = new Vector.<GuildColorData>();
            super();
            _local_3 = k.readInteger();
            _local_2 = 0;
            while (_local_2 < _local_3)
            {
                this._baseParts.push(new BadgePartData(k));
                _local_2++;
            }
            _local_3 = k.readInteger();
            _local_2 = 0;
            while (_local_2 < _local_3)
            {
                this._layerParts.push(new BadgePartData(k));
                _local_2++;
            }
            _local_3 = k.readInteger();
            _local_2 = 0;
            while (_local_2 < _local_3)
            {
                this._badgeColors.push(new GuildColorData(k));
                _local_2++;
            }
            _local_3 = k.readInteger();
            _local_2 = 0;
            while (_local_2 < _local_3)
            {
                this._guildPrimaryColors.push(new GuildColorData(k));
                _local_2++;
            }
            _local_3 = k.readInteger();
            _local_2 = 0;
            while (_local_2 < _local_3)
            {
                this._guildSecondaryColors.push(new GuildColorData(k));
                _local_2++;
            }
        }

        public function get _Str_11328():Vector.<BadgePartData>
        {
            return this._baseParts;
        }

        public function get _Str_12125():Vector.<BadgePartData>
        {
            return this._layerParts;
        }

        public function get _Str_9008():Vector.<GuildColorData>
        {
            return this._badgeColors;
        }

        public function get _Str_17665():Vector.<GuildColorData>
        {
            return this._guildPrimaryColors;
        }

        public function get _Str_16298():Vector.<GuildColorData>
        {
            return this._guildSecondaryColors;
        }

        public function findMatchingPrimaryColorId(k:int):int
        {
            if (((((k < 0) || (this._badgeColors.length <= 0)) || (this._badgeColors.length < k)) || (this._guildPrimaryColors.length <= 0)))
            {
                return 0;
            }
            return this._Str_21273(this._badgeColors[k], this._guildPrimaryColors);
        }

        public function findMatchingSecondaryColorId(k:int):int
        {
            if (((((k < 0) || (this._badgeColors.length <= 0)) || (this._badgeColors.length < k)) || (this._guildSecondaryColors.length <= 0)))
            {
                return 0;
            }
            return this._Str_21273(this._badgeColors[k], this._guildSecondaryColors);
        }

        private function _Str_21273(k:GuildColorData, _arg_2:Vector.<GuildColorData>):int
        {
            var _local_7:IVector3d;
            var _local_8:Number;
            var _local_3:IVector3d = ColorConverter.rgb2CieLab(k.color);
            var _local_4:int;
            var _local_5:Number = Number.MAX_VALUE;
            var _local_6:int;
            while (_local_6 < _arg_2.length)
            {
                _local_7 = ColorConverter.rgb2CieLab(_arg_2[_local_6].color);
                _local_8 = ((Math.pow((_local_3.x - _local_7.x), 2) + Math.pow((_local_3.y - _local_7.y), 2)) + Math.pow((_local_3.z - _local_7.z), 2));
                if (_local_8 < _local_5)
                {
                    _local_5 = _local_8;
                    _local_4 = _local_6;
                }
                _local_6++;
            }
            return _arg_2[_local_4].id;
        }
    }
}
