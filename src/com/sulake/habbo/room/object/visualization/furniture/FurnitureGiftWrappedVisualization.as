package com.sulake.habbo.room.object.visualization.furniture
{
    import com.sulake.room.utils.IRoomGeometry;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;

    public class FurnitureGiftWrappedVisualization extends FurnitureVisualization 
    {
        private var _packetType:int = 0;
        private var _ribbonType:int = 0;


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
            var k:IRoomObject = object;
            if (k != null)
            {
                _local_2 = k.getModel();
                if (_local_2 != null)
                {
                    _local_3 = 1000;
                    _local_4 = _local_2.getString(RoomObjectVariableEnum.FURNITURE_EXTRAS);
                    _local_5 = parseInt(_local_4);
                    this._packetType = Math.floor((_local_5 / _local_3));
                    this._ribbonType = (_local_5 % _local_3);
                }
            }
        }

        override protected function getFrameNumber(k:int, _arg_2:int):int
        {
            if (_arg_2 <= 1)
            {
                return this._packetType;
            }
            return this._ribbonType;
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
    }
}
