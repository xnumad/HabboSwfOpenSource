package com.sulake.habbo.room.object.visualization.furniture
{
    import com.sulake.habbo.room.object.visualization.data.ExtraDataManager;
    import adobe.serialization.json.JSONDecoder;
    import flash.net.URLLoader;
    import flash.net.URLRequest;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.display.BitmapData;
    import com.sulake.room.object.visualization.utils.IGraphicAsset;
    import com.sulake.room.object.visualization.IRoomObjectSprite;

    public class FurnitureExternalImageVisualization extends FurnitureDynamicThumbnailVisualization 
    {
        private var _batchesEnabled:Boolean;
        private var _baseUrl:String;
        private var _extraDataUrl:String;
        private var _url:String;
        private var _extraDataLoading:Boolean = false;
        private var _typePrefix:String = "";
        private var _externalImageUUID:String;

        public function FurnitureExternalImageVisualization():void
        {
            _Str_20445 = true;
        }

        override public function setExternalBaseUrls(k:String, _arg_2:String, _arg_3:Boolean):void
        {
            this._baseUrl = k;
            this._extraDataUrl = _arg_2;
            this._batchesEnabled = _arg_3;
        }

        override protected function getThumbnailURL():String
        {
            var uuid:String;
            var url:String;
            if ((((!(object)) || (this._baseUrl == "disabled")) || (this._url == ExtraDataManager.REJECTED)))
            {
                return null;
            }
            if (this._url)
            {
                return this._url;
            }
            var jsonString:String = object.getModel().getString("furniture_data");
            if (jsonString == null)
            {
                return null;
            }
            try
            {
                if (object.getType().indexOf("external_image_wallitem_poster") != -1)
                {
                    this._typePrefix = "";
                }
                else
                {
                    this._typePrefix = "postcards/selfie/";
                }
                uuid = this._Str_5427(jsonString, "id", null);
                if (((uuid) && (uuid.length > 0)))
                {
                    if (!this._extraDataLoading)
                    {
                        this._externalImageUUID = uuid;
                        this._extraDataLoading = true;
                        if (this._batchesEnabled)
                        {
                            ExtraDataManager._Str_23593(this);
                        }
                        else
                        {
                            this._Str_17989(uuid);
                        }
                    }
                    return null;
                }
                url = this._Str_5427(jsonString, "w", "url");
                url = this._Str_18056(url, this._typePrefix);
            }
            catch(error:Error)
            {
                return null;
            }
            this._url = url;
            return url;
        }

        public function _Str_20894():String
        {
            return this._externalImageUUID;
        }

        private function _Str_18056(k:String, _arg_2:String):String
        {
            if (k == ExtraDataManager.REJECTED)
            {
                return k;
            }
            if (k.indexOf("http") != 0)
            {
                k = ((this._baseUrl + _arg_2) + k);
            }
            k = k.replace(".png", "_small.png");
            if (k.indexOf(".png") == -1)
            {
                k = (k + "_small.png");
            }
            return k;
        }

        private function _Str_5427(k:String, _arg_2:String, _arg_3:String):String
        {
            var _local_4:Object = new JSONDecoder(k, false).getValue();
            var _local_5:String = _local_4[_arg_2];
            if (((_local_5 == null) && (!(_arg_3 == null))))
            {
                _local_5 = _local_4[_arg_3];
            }
            return _local_5;
        }

        private function _Str_17989(k:String):void
        {
            var _local_2:String = (this._extraDataUrl + k);
            var _local_3:URLLoader = new URLLoader(new URLRequest(_local_2));
            _local_3.addEventListener(Event.COMPLETE, this._Str_12417);
            _local_3.addEventListener(IOErrorEvent.IO_ERROR, this._Str_17464);
            this._extraDataLoading = true;
        }

        private function _Str_17464(k:Event):void
        {
            Logger.log(("Extra data failed to load " + k.toString()));
        }

        private function _Str_12417(k:Event):void
        {
            var _local_2:String = URLLoader(k.target).data;
            if (_local_2.length == 0)
            {
                return;
            }
            var _local_3:String = this._Str_5427(_local_2, "w", "url");
            this._url = this._Str_18056(_local_3, this._typePrefix);
        }

        public function _Str_19371(k:String):void
        {
            this._url = this._Str_18056(k, this._typePrefix);
        }

        public function _Str_22277():String
        {
            return this._extraDataUrl;
        }

        override public function dispose():void
        {
            ExtraDataManager._Str_22536(this);
            super.dispose();
        }

        override public function getImage(k:int, _arg_2:int):BitmapData
        {
            if (!assetCollection)
            {
                return new BitmapData(1, 1, true, 0);
            }
            var _local_3:String = _Str_12961(_arg_2, 32);
            if (((assetCollection.getAsset(_local_3) == null) && (object)))
            {
                _local_3 = (object.getType() + "_icon_a");
            }
            if (assetCollection.getAsset(_local_3) == null)
            {
                return new BitmapData(1, 1, true, 0);
            }
            var _local_4:Object = assetCollection.getAsset(_local_3).asset.content;
            if (!_local_4)
            {
                return new BitmapData(1, 1, true, 0);
            }
            return (_local_4 as BitmapData).clone();
        }

        override protected function getLibraryAssetNameForSprite(k:IGraphicAsset, _arg_2:IRoomObjectSprite):String
        {
            return this._url;
        }
    }
}
