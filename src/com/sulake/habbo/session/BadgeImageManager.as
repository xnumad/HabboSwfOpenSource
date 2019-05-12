package com.sulake.habbo.session
{
    import com.sulake.core.assets.IAssetLibrary;
    import flash.events.IEventDispatcher;
    import com.sulake.core.runtime.IHabboConfigurationManager;
    import flash.utils.Dictionary;
    import com.sulake.core.assets.AssetLibrary;
    import flash.display.BitmapData;
    import flash.net.URLRequest;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.core.assets.AssetLoaderStruct;
    import com.sulake.habbo.gamecenter.GameConfigurations;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;
    import flash.display.Bitmap;
    import com.sulake.habbo.session.events.BadgeImageReadyEvent;
    import flash.geom.Matrix;
    import com.sulake.core.assets.IAsset;

    public class BadgeImageManager 
    {
        public static const GROUP_BADGE:String = "group_badge";
        public static const NORMAL_BADGE:String = "normal_badge";

        private const _Str_9663:String = "badge_";
        private const _Str_23071:String = "_32";

        private var _assets:IAssetLibrary;
        private var _events:IEventDispatcher;
        private var _configuration:IHabboConfigurationManager;
        private var _requestedGroupBadges:Dictionary;

        public function BadgeImageManager(k:IAssetLibrary, _arg_2:IEventDispatcher, _arg_3:IHabboConfigurationManager)
        {
            this._requestedGroupBadges = new Dictionary();
            super();
            if (k == null)
            {
                k = new AssetLibrary("badge_images");
            }
            this._assets = k;
            this._events = _arg_2;
            this._configuration = _arg_3;
        }

        public function dispose():void
        {
            this._assets = null;
        }

        public function getBadgeImage(k:String, _arg_2:String="normal_badge", _arg_3:Boolean=true, _arg_4:Boolean=false):BitmapData
        {
            var _local_5:BitmapData = this._Str_10735(k, _arg_2, _arg_4);
            if (((!(_local_5)) && (_arg_3)))
            {
                _local_5 = this._Str_20965();
            }
            return _local_5;
        }

        public function _Str_19714(k:String, _arg_2:String="normal_badge"):BitmapData
        {
            if (((this._Str_10735(k, _arg_2, true) == null) && (!(this._Str_10735(k) == null))))
            {
                this._Str_22115((this._Str_9663 + k), k);
            }
            return this.getBadgeImage(k, _arg_2, false, true);
        }

        public function _Str_15979(k:String):BadgeInfo
        {
            var _local_2:BitmapData = this._Str_10735(k);
            return (_local_2 != null) ? new BadgeInfo(_local_2, false) : new BadgeInfo(this._Str_20965(), true);
        }

        public function _Str_5831(k:String, _arg_2:String="normal_badge", _arg_3:Boolean=false):String
        {
            var _local_4:String = ((this._Str_9663 + k) + ((_arg_3) ? "_32" : ""));
            if (this._assets.hasAsset(_local_4))
            {
                return _local_4;
            }
            this._Str_10735(k, _arg_2, _arg_3);
            return null;
        }

        public function _Str_19435(k:String, _arg_2:String="normal_badge"):String
        {
            var _local_3:String = this._Str_5831(k, _arg_2, true);
            if (_local_3 == null)
            {
                this._Str_22115((this._Str_9663 + k), k);
            }
            else
            {
                return _local_3;
            }
            return this._Str_5831(k, _arg_2, true);
        }

        private function _Str_10735(k:String, _arg_2:String="normal_badge", _arg_3:Boolean=false):BitmapData
        {
            var _local_5:URLRequest;
            var _local_6:String;
            var _local_7:BitmapDataAsset;
            var _local_8:AssetLoaderStruct;
            var _local_4:String = ((this._Str_9663 + k) + ((_arg_3) ? "_32" : ""));
            if (this._assets.hasAsset(_local_4))
            {
                _local_7 = (this._assets.getAssetByName(_local_4) as BitmapDataAsset);
                return (_local_7.content as BitmapData).clone();
            }
            if (_arg_3)
            {
                return null;
            }
            Logger.log(("Request badge: " + k));
            switch (_arg_2)
            {
                case NORMAL_BADGE:
                    if (this._configuration != null)
                    {
                        if (GameConfigurations._Str_21861(k))
                        {
                            _local_6 = GameConfigurations._Str_21365(k);
                        }
                        else
                        {
                            _local_6 = this._configuration.getProperty("image.library.url");
                            _local_6 = (_local_6 + (("album1584/" + k) + ".gif"));
                        }
                        _local_5 = new URLRequest(_local_6);
                    }
                    break;
                case GROUP_BADGE:
                    if (((!(this._configuration == null)) && (!(this._requestedGroupBadges[_local_4]))))
                    {
                        _local_6 = this._configuration.getProperty("group.badge.url");
                        _local_6 = _local_6.replace("%imagerdata%", k);
                        _local_5 = new URLRequest(_local_6);
                        this._requestedGroupBadges[_local_4] = true;
                    }
                    break;
            }
            if (_local_5 != null)
            {
                _local_8 = this._assets.loadAssetFromFile(_local_4, _local_5, "image/gif");
                _local_8.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTCOMPLETE, this._Str_6753);
            }
            return null;
        }

        private function _Str_20965():BitmapData
        {
            return BitmapData(this._assets.getAssetByName("loading_icon").content).clone();
        }

        private function _Str_6753(k:AssetLoaderEvent):void
        {
            var _local_3:String;
            var _local_4:String;
            var _local_5:Bitmap;
            var _local_2:AssetLoaderStruct = (k.target as AssetLoaderStruct);
            if (_local_2 != null)
            {
                if (((!(_local_2.assetLoader == null)) && (!(_local_2.assetLoader.content == null))))
                {
                    _local_3 = _local_2.assetName;
                    _local_4 = _local_3.replace(this._Str_9663, "");
                    _local_5 = (_local_2.assetLoader.content as Bitmap);
                    if (_local_5 == null)
                    {
                        return;
                    }
                    this._events.dispatchEvent(new BadgeImageReadyEvent(_local_4, _local_5.bitmapData.clone()));
                }
            }
        }

        private function _Str_22115(k:String, _arg_2:String):void
        {
            var _local_4:BitmapDataAsset;
            var _local_3:BitmapData = this._Str_23624(k);
            if (_local_3)
            {
                _local_4 = new BitmapDataAsset(this._assets.getAssetTypeDeclarationByClass(BitmapDataAsset));
                if (_local_4 != null)
                {
                    this._assets.setAsset(((this._Str_9663 + _arg_2) + this._Str_23071), _local_4);
                    _local_4.setUnknownContent(_local_3);
                }
            }
        }

        private function _Str_23624(k:String):BitmapData
        {
            var _local_3:BitmapData;
            var _local_4:BitmapData;
            var _local_5:Matrix;
            var _local_2:IAsset = this._assets.getAssetByName(k);
            if (_local_2 != null)
            {
                _local_3 = (_local_2.content as BitmapData);
                _local_4 = new BitmapData((_local_3.width / 2), (_local_3.height / 2), true, 0);
                _local_5 = new Matrix(0.5, 0, 0, 0.5);
                _local_4.draw(_local_3, _local_5, null, null, null, true);
                return _local_4;
            }
            return null;
        }
    }
}
