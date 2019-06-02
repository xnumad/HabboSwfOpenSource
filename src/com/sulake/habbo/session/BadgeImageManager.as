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
            var _local_5:BitmapData = this.getBadgeImageInternal(k, _arg_2, _arg_4);
            if (((!(_local_5)) && (_arg_3)))
            {
                _local_5 = this.getPlaceholder();
            }
            return _local_5;
        }

        public function getSmallBadgeImage(k:String, _arg_2:String="normal_badge"):BitmapData
        {
            if (((this.getBadgeImageInternal(k, _arg_2, true) == null) && (!(this.getBadgeImageInternal(k) == null))))
            {
                this.createSmallBadgeBitmap((this._Str_9663 + k), k);
            }
            return this.getBadgeImage(k, _arg_2, false, true);
        }

        public function getBadgeImageWithInfo(k:String):BadgeInfo
        {
            var _local_2:BitmapData = this.getBadgeImageInternal(k);
            return (_local_2 != null) ? new BadgeInfo(_local_2, false) : new BadgeInfo(this.getPlaceholder(), true);
        }

        public function getBadgeImageAssetName(k:String, _arg_2:String="normal_badge", _arg_3:Boolean=false):String
        {
            var _local_4:String = ((this._Str_9663 + k) + ((_arg_3) ? "_32" : ""));
            if (this._assets.hasAsset(_local_4))
            {
                return _local_4;
            }
            this.getBadgeImageInternal(k, _arg_2, _arg_3);
            return null;
        }

        public function getSmallScaleBadgeAssetName(k:String, _arg_2:String="normal_badge"):String
        {
            var _local_3:String = this.getBadgeImageAssetName(k, _arg_2, true);
            if (_local_3 == null)
            {
                this.createSmallBadgeBitmap((this._Str_9663 + k), k);
            }
            else
            {
                return _local_3;
            }
            return this.getBadgeImageAssetName(k, _arg_2, true);
        }

        private function getBadgeImageInternal(k:String, _arg_2:String="normal_badge", _arg_3:Boolean=false):BitmapData
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
                        if (GameConfigurations.isGameBadge(k))
                        {
                            _local_6 = GameConfigurations.getBadgeImageUri(k);
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
                _local_8.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTCOMPLETE, this.onBadgeImageReady);
            }
            return null;
        }

        private function getPlaceholder():BitmapData
        {
            return BitmapData(this._assets.getAssetByName("loading_icon").content).clone();
        }

        private function onBadgeImageReady(k:AssetLoaderEvent):void
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

        private function createSmallBadgeBitmap(k:String, _arg_2:String):void
        {
            var _local_4:BitmapDataAsset;
            var _local_3:BitmapData = this.renderSmallScaleBadgeBitmap(k);
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

        private function renderSmallScaleBadgeBitmap(k:String):BitmapData
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
