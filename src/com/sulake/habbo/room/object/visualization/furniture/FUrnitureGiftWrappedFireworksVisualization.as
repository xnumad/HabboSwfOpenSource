package com.sulake.habbo.room.object.visualization.furniture
{
    import com.sulake.room.utils.IRoomGeometry;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;

    public class FUrnitureGiftWrappedFireworksVisualization extends FurnitureFireworksVisualization 
    {
        private static const PRESENT_DEFAULT_STATE:int = 0;
        private static const MAX_PACKET_TYPE_VALUE:int = 9;
        private static const MAX_RIBBON_TYPE_VALUE:int = 11;

        private var _packetType:int = 0;
        private var _ribbonType:int = 0;
        private var _state:int = 0;


        override public function update(k:IRoomGeometry, _arg_2:int, _arg_3:Boolean, _arg_4:Boolean):void
        {
            this._Str_16942();
            super.update(k, _arg_2, _arg_3, _arg_4);
        }

        private function _Str_16942():void
        {
            var _local_2:IRoomObjectModel;
            var _local_3:int;
            var _local_4:String;
            var _local_5:int;
            var _local_6:int;
            var _local_7:int;
            var k:IRoomObject = object;
            if (k != null)
            {
                _local_2 = k.getModel();
                if (_local_2 != null)
                {
                    _local_3 = 1000;
                    _local_4 = _local_2.getString(RoomObjectVariableEnum.FURNITURE_EXTRAS);
                    _local_5 = parseInt(_local_4);
                    _local_6 = Math.floor((_local_5 / _local_3));
                    _local_7 = (_local_5 % _local_3);
                    this._packetType = ((_local_6 > MAX_PACKET_TYPE_VALUE) ? 0 : _local_6);
                    this._ribbonType = ((_local_7 > MAX_RIBBON_TYPE_VALUE) ? 0 : _local_7);
                }
            }
        }

        override protected function getFrameNumber(k:int, _arg_2:int):int
        {
            if (this._state == PRESENT_DEFAULT_STATE)
            {
                if (_arg_2 <= 1)
                {
                    return this._packetType;
                }
                if (_arg_2 == 2)
                {
                    return this._ribbonType;
                }
            }
            return super.getFrameNumber(k, _arg_2);
        }

        override protected function getSpriteAssetName(k:int, _arg_2:int):String
        {
            var _local_3:int = _Str_3033(k);
            var _local_4:String = type;
            var _local_5:String = "";
            if (_arg_2 < (spriteCount - 1))
            {
                _local_5 = String.fromCharCode(("a".charCodeAt() + _arg_2));
            }
            else
            {
                _local_5 = "sd";
            }
            var _local_6:int = this.getFrameNumber(k, _arg_2);
            _local_4 = (_local_4 + ((((("_" + _local_3) + "_") + _local_5) + "_") + direction));
            _local_4 = (_local_4 + ("_" + _local_6));
            return _local_4;
        }

        override protected function setAnimation(k:int):void
        {
            this._state = k;
            super.setAnimation(k);
        }
    }
}
