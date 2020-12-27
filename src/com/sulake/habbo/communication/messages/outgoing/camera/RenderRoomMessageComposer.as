package com.sulake.habbo.communication.messages.outgoing.camera
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.habbo.utils.StringUtil;
    import flash.utils.ByteArray;
    import flash.utils.CompressionAlgorithm;
    import com.sulake.core.communication.encryption.CryptoTools;
    import com.sulake.room.object.visualization.IPlaneDrawingData;
    import com.sulake.habbo.communication.messages.outgoing.camera.json.JsonPlaneDrawingData;
    import __AS3__.vec.Vector;
    import flash.geom.Point;
    import com.sulake.habbo.communication.messages.outgoing.camera.json.JsonTextureColumnData;
    import com.sulake.habbo.communication.messages.outgoing.camera.json.JsonMaskDrawingData;
    import com.sulake.habbo.communication.messages.outgoing.camera.json.JsonPoint;
    import com.sulake.core.runtime.exceptions.Exception;

    public class RenderRoomMessageComposer implements IMessageComposer 
    {
        private const DATA_LENGTH_LIMIT:int = 8100;

        private var roomPlanesDataArr:Array;
        private var spriteDataJsonObj:String;
        private var roomRenderingModifierJsonObj:String;
        private var effectDataJsonObj:String = "[]";
        private var roomId:int;
        private var zoomLevel:int = 1;
        private var topSecurityLevel:int;
        private var time:Number;
        protected var _data:Array;

        public function RenderRoomMessageComposer(k:Array, _arg_2:String, _arg_3:String, _arg_4:int, _arg_5:int)
        {
            this._data = [];
            super();
            this.roomPlanesDataArr = this.getRoomPlanesDataArray(k);
            this.spriteDataJsonObj = _arg_2;
            this.roomRenderingModifierJsonObj = _arg_3;
            this.roomId = _arg_4;
            this.topSecurityLevel = _arg_5;
            this.time = new Date().getTime();
        }

        private static function planesString():String
        {
            return StringUtil.makeMagicString(142, 178, 155, 183, 194, 196, 168, 157, 195, 152, 143, 163, 197, 154, 200, 148, 158, 148, 200);
            //{ "planes" :
        }

        private static function spritesString():String
        {
            return StringUtil.makeMagicString(113, 119, 172, 167, 152, 139, 154, 118, 141, 140, 125, 169, 152, 119, 168, 165, 129, 146);
            //,"sprites" :
        }

        private static function modifiersString():String
        {
            return StringUtil.makeMagicString(129, 188, 141, 133, 186, 137, 164, 132, 160, 132, 185, 134, 168, 183, 162, 149, 181, 135);
            //,"modifiers" :
        }

        private static function filtersString():String
        {
            return StringUtil.makeMagicString(131, 190, 163, 186, 162, 159, 146, 177, 172, 172, 132, 136, 170, 186, 164, 151, 164);
            //,"filters" :
        }

        private static function roomIdString():String
        {
            return StringUtil.makeMagicString(122, 181, 177, 127, 144, 130, 147, 129, 125, 157, 126, 145, 142, 145, 170);
            //,"roomid" :
        }

        private static function zoomString():String
        {
            return StringUtil.makeMagicString(126, 132, 128, 180, 166, 134, 158, 167, 151, 148, 133, 132, 181, 159, 146, 158, 159);
            //,"zoom" :
        }

        private static function statusString():String
        {
            return StringUtil.makeMagicString(118, 124, 120, 172, 157, 164, 171, 145, 167, 143, 139, 173, 154, 159, 141, 134, 170);
            //,"status" :
        }

        private static function timestampString():String
        {
            return StringUtil.makeMagicString(137, 178, 196, 192, 164, 143, 165, 144, 193, 158, 164, 155, 143, 144, 163, 191, 160, 153, 149, 173, 169, 173, 195);
            //,"timestamp" :
        }

        private static function checksumString():String
        {
            return StringUtil.makeMagicString(120, 179, 124, 161, 132, 139, 150, 176, 139, 145, 157, 141, 169, 127, 152, 175, 153, 140, 156, 143);
            //,"checksum" :
        }

        private static function jsonEndString():String
        {
            return StringUtil.makeMagicString(136, 148, 159, 145, 168);
            // }
        }

        private static function deflate(k:String):ByteArray
        {
            var _local_2:ByteArray = new ByteArray();
            _local_2.writeUTFBytes(k);
            _local_2.compress(CompressionAlgorithm.ZLIB);
            return _local_2;
        }


        public function addEffectData(k:String):void
        {
            this.effectDataJsonObj = k;
        }

        public function setZoom(k:int):void
        {
            this.zoomLevel = k;
        }

        public function compressData():void
        {
            var roomPlanesDataJsonObj:String = JSON.stringify(this.roomPlanesDataArr, function (k:Object, _arg_2:Object):*
            {
                if (((k == "masks") && (_arg_2.length == 0)))
                {
                    return undefined;
                }
                return _arg_2;
            });
            var dataStrJsonObj:String = (((((((((planesString() + roomPlanesDataJsonObj) + spritesString()) + this.spriteDataJsonObj) + modifiersString()) + this.roomRenderingModifierJsonObj) + filtersString()) + this.effectDataJsonObj) + roomIdString()) + this.roomId);
            if (this.zoomLevel != 1)
            {
                dataStrJsonObj = (dataStrJsonObj + (zoomString() + this.zoomLevel));
            }
            var timeLastDigits:int = (this.time % 100);
            this.time = (this.time - timeLastDigits);
            var status:int = (((this.time / 100) % 23) + this.topSecurityLevel);
            dataStrJsonObj = (dataStrJsonObj + (statusString() + status));
            var check:int = dataStrJsonObj.length;
            check = ((check + ((this.time / 100) * 17)) % 1493);
            var bytes:ByteArray = CryptoTools.stringToByteArray(dataStrJsonObj);
            var checksum:int = CryptoTools.fletcher100(bytes, check, this.roomId);
            dataStrJsonObj = (dataStrJsonObj + (timestampString() + (this.time + checksum)));
            dataStrJsonObj = (dataStrJsonObj + ((checksumString() + ((timeLastDigits + 13) * (check + 29))) + jsonEndString()));
            var deflatedMsg:ByteArray = deflate(dataStrJsonObj);
            this._data = [deflatedMsg];
        }

        protected function getRoomPlanesDataArray(k:Array):Array
        {
            var _local_3:IPlaneDrawingData;
            var _local_4:JsonPlaneDrawingData;
            var _local_5:Vector.<Point>;
            var _local_6:Array;
            var _local_7:Array;
            var _local_8:Array;
            var _local_9:Array;
            var _local_10:int;
            var _local_11:Array;
            var _local_12:Array;
            var _local_13:JsonTextureColumnData;
            var _local_14:String;
            var _local_2:Array = [];
            for each (_local_3 in k)
            {
                _local_4 = new JsonPlaneDrawingData();
                _local_4.z = _local_3.z;
                _local_5 = _local_3.cornerPoints;
                _local_4.addCornerPoint(_local_5[0].x, _local_5[0].y);
                _local_4.addCornerPoint(_local_5[1].x, _local_5[1].y);
                _local_4.addCornerPoint(_local_5[2].x, _local_5[2].y);
                _local_4.addCornerPoint(_local_5[3].x, _local_5[3].y);
                _local_4.color = _local_3.color;
                _local_6 = _local_3.maskAssetNames;
                _local_7 = _local_3.maskAssetLocations;
                _local_8 = _local_3.maskAssetFlipHs;
                _local_9 = _local_3.maskAssetFlipVs;
                _local_10 = 0;
                while (_local_10 < _local_6.length)
                {
                    _local_4.addMask(new JsonMaskDrawingData(_local_6[_local_10], new JsonPoint(_local_7[_local_10].x, _local_7[_local_10].y), _local_8[_local_10], _local_9[_local_10]));
                    _local_10++;
                }
                _local_4.setBottomAligned(_local_3.isBottomAligned());
                _local_11 = _local_3.assetNameColumns;
                if (_local_11.length != 0)
                {
                    for each (_local_12 in _local_11)
                    {
                        _local_13 = new JsonTextureColumnData();
                        for each (_local_14 in _local_12)
                        {
                            _local_13.addAssetName(_local_14);
                        }
                        _local_4.addTexCol(_local_13);
                    }
                }
                _local_2.push(_local_4);
            }
            return _local_2;
        }

        public function isSendable():Boolean
        {
            if (this._data.length == 0)
            {
                this.compressData();
            }
            return this._data[0].length < this.DATA_LENGTH_LIMIT;
        }

        public function getMessageArray():Array
        {
            if (this._data.length == 0)
            {
                throw (new Exception("Render room message sending attempt before packData() is called."));
            }
            return this._data;
        }

        public function dispose():void
        {
            this._data = [];
        }
    }
}
