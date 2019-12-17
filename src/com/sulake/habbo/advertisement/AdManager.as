package com.sulake.habbo.advertisement
{
    import com.sulake.core.runtime.Component;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import flash.display.BitmapData;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDHabboConfigurationManager;
    import com.sulake.iid.IIDSessionDataManager;
    import com.sulake.iid.IIDHabboCatalog;
    import __AS3__.vec.Vector;
    import flash.net.URLRequest;
    import com.sulake.core.assets.AssetLoaderStruct;
    import com.sulake.habbo.communication.messages.incoming._Str_483._Str_8332;
    import flash.system.Security;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;
    import flash.external.ExternalInterface;
    import com.sulake.habbo.communication.messages.outgoing._Str_499._Str_10855;
    import com.sulake.habbo.communication.messages.parser.advertisement._Str_7915;
    import com.sulake.habbo.advertisement.events.InterstitialEvent;
    import flash.display.Bitmap;
    import com.sulake.core.assets.IAsset;
    import com.sulake.habbo.advertisement.events.AdEvent;

    public class AdManager extends Component implements IAdManager 
    {
        private static const INTERSTITIALCOMPLETED:String = "interstitialCompleted";

        private var _communicationManager:IHabboCommunicationManager;
        private var _sessionDataManager:ISessionDataManager;
        private var _catalog:IHabboCatalog;
        private var _roomAdWarningImageLeft:BitmapData = null;
        private var _roomAdWarningImageRight:BitmapData = null;
        private var _billboardImageLoaders:Map;
        private var _interstitialMessageEvent:IMessageEvent;

        public function AdManager(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null)
        {
            super(k, _arg_2, _arg_3);
        }

        public function get sessionDataManager():ISessionDataManager
        {
            return this._sessionDataManager;
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboCommunicationManager(), function (k:IHabboCommunicationManager):void
            {
                _communicationManager = k;
            }), new ComponentDependency(new IIDHabboConfigurationManager(), null), new ComponentDependency(new IIDSessionDataManager(), function (k:ISessionDataManager):void
            {
                _sessionDataManager = k;
            }, false), new ComponentDependency(new IIDHabboCatalog(), function (k:IHabboCatalog):void
            {
                _catalog = k;
            }, false)]));
        }

        override protected function initComponent():void
        {
            var urlRequest:URLRequest;
            var asset:AssetLoaderStruct;
            this._billboardImageLoaders = new Map();
            this._interstitialMessageEvent = this._communicationManager.addHabboConnectionMessageEvent(new _Str_8332(this._Str_24116));
            var k:String = getProperty("ads.domain");
            if (k != "")
            {
                Security.loadPolicyFile((("https://" + k) + "/crossdomain.xml"));
            }
            var adwarningLeftURL:String = getProperty("billboard.adwarning.left.url");
            var adwarningRightURL:String = getProperty("billboard.adwarning.right.url");
            var imageLibraryURL:String = getProperty("image.library.url");
            if (((!(adwarningLeftURL == "")) && (!(adwarningRightURL == ""))))
            {
                adwarningLeftURL = (imageLibraryURL + adwarningLeftURL);
                adwarningRightURL = (imageLibraryURL + adwarningRightURL);
                urlRequest = new URLRequest(adwarningLeftURL);
                asset = assets.loadAssetFromFile("adWarningL", urlRequest, "image/png");
                asset.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTCOMPLETE, this.interstitialLoaderEventHandler);
                urlRequest = new URLRequest(adwarningRightURL);
                asset = assets.loadAssetFromFile("adWarningRight", urlRequest, "image/png");
                asset.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTCOMPLETE, this.adWarningLeftReady);
            }
            if (ExternalInterface.available)
            {
                ExternalInterface.addCallback(INTERSTITIALCOMPLETED, this.disposeAsset);
            }
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            }
            if (this._billboardImageLoaders != null)
            {
                this._billboardImageLoaders.dispose();
                this._billboardImageLoaders = null;
            }
            if (this._communicationManager != null)
            {
                this._communicationManager.removeHabboConnectionMessageEvent(this._interstitialMessageEvent);
                this._interstitialMessageEvent = null;
            }
            if (this._roomAdWarningImageLeft)
            {
                this._roomAdWarningImageLeft.dispose();
                this._roomAdWarningImageLeft = null;
            }
            if (this._roomAdWarningImageRight)
            {
                this._roomAdWarningImageRight.dispose();
                this._roomAdWarningImageRight = null;
            }
            super.dispose();
        }

        public function showInterstitial():void
        {
            if (!getBoolean("interstitials.2016.enabled"))
            {
                this._Str_17549();
                return;
            }
            this._communicationManager.connection.send(new _Str_10855());
        }

        private function _Str_24116(k:_Str_8332):void
        {
            var _local_2:_Str_7915 = k.getParser();
            if (((_local_2) && (_local_2._Str_24162)))
            {
                if (ExternalInterface.available)
                {
                    ExternalInterface.call("FlashExternalInterface.showInterstitial");
                    events.dispatchEvent(new InterstitialEvent(InterstitialEvent.INTERSTITIAL_SHOW));
                }
                else
                {
                    this._Str_17549();
                }
            }
            else
            {
                this._Str_17549();
            }
        }

        private function _Str_17549():void
        {
            if (events != null)
            {
                events.dispatchEvent(new InterstitialEvent(InterstitialEvent.INTERSTITIAL_NOT_SHOWN));
            }
        }

        private function disposeAsset(k:String):void
        {
            events.dispatchEvent(new InterstitialEvent(InterstitialEvent.INTERSTITIAL_COMPLETE, k));
        }

        private function interstitialLoaderEventHandler(k:AssetLoaderEvent):void
        {
            var _local_2:AssetLoaderStruct = (k.target as AssetLoaderStruct);
            var _local_3:Bitmap = (_local_2.assetLoader.content as Bitmap);
            if (_local_3 != null)
            {
                this._roomAdWarningImageLeft = this.emulateBackgroundTransparency(_local_3.bitmapData);
            }
        }

        private function adWarningLeftReady(k:AssetLoaderEvent):void
        {
            var _local_2:AssetLoaderStruct = (k.target as AssetLoaderStruct);
            var _local_3:Bitmap = (_local_2.assetLoader.content as Bitmap);
            if (_local_3 != null)
            {
                this._roomAdWarningImageRight = this.emulateBackgroundTransparency(_local_3.bitmapData);
            }
        }

        private function emulateBackgroundTransparency(k:BitmapData):BitmapData
        {
            var _local_4:int;
            var _local_5:uint;
            if (k == null)
            {
                return null;
            }
            var _local_2:BitmapData = new BitmapData(k.width, k.height, true, 0);
            var _local_3:int;
            while (_local_3 < _local_2.height)
            {
                _local_4 = 0;
                while (_local_4 < _local_2.width)
                {
                    _local_5 = k.getPixel32(_local_4, _local_3);
                    if (_local_5 != 0xFFFFFFFF)
                    {
                        _local_2.setPixel32(_local_4, _local_3, _local_5);
                    }
                    _local_4++;
                }
                _local_3++;
            }
            return _local_2;
        }

        private function isValidAdImage(k:Bitmap):Boolean
        {
            if ((((!(k == null)) && (!(k.bitmapData == null))) && ((k.width > 1) || (k.height > 1))))
            {
                return true;
            }
            return false;
        }

        public function loadRoomAdImage(k:int, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:String):void
        {
            var _local_9:IAsset;
            var _local_10:BitmapData;
            var _local_11:AdImageRequest;
            if (((_arg_4 == null) || (_arg_4.length == 0)))
            {
                return;
            }
            if (assets.hasAsset(_arg_4))
            {
                _local_9 = assets.getAssetByName(_arg_4);
                if (_local_9 != null)
                {
                    _local_10 = (_local_9.content as BitmapData);
                    if (_local_10 != null)
                    {
                        this.dispatchImageAsset(_local_10.clone(), k, _arg_2, _arg_3, _arg_4, _arg_5);
                    }
                }
                return;
            }
            var _local_6:Array = this._billboardImageLoaders.getValue(_arg_4);
            if (_local_6 == null)
            {
                _local_6 = [];
                this._billboardImageLoaders.add(_arg_4, _local_6);
            }
            if (_local_6.length > 0)
            {
                for each (_local_11 in _local_6)
                {
                    if ((((_local_11.roomId == k) && (_local_11._Str_1577 == _arg_2)) && (_local_11.objectCategory == _arg_3)))
                    {
                        return;
                    }
                }
            }
            _local_6.push(new AdImageRequest(k, _arg_4, _arg_5, _arg_2, _arg_3));
            var _local_7:URLRequest = new URLRequest(_arg_4);
            var _local_8:AssetLoaderStruct = assets.loadAssetFromFile(_arg_4, _local_7, "image/png");
            _local_8.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTCOMPLETE, this.adWarningRightReady);
            _local_8.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTERROR, this.onBillboardImageReady);
        }

        private function adWarningRightReady(k:AssetLoaderEvent):void
        {
            var _local_5:BitmapData;
            var _local_6:AdImageRequest;
            var _local_2:AssetLoaderStruct = (k.target as AssetLoaderStruct);
            var _local_3:Bitmap = (_local_2.assetLoader.content as Bitmap);
            var _local_4:Array = this._billboardImageLoaders.remove(_local_2.assetName);
            if (((_local_4 == null) || (_local_4.length == 0)))
            {
                return;
            }
            if (this.isValidAdImage(_local_3))
            {
                _local_5 = _local_3.bitmapData;
                if (_local_5 != null)
                {
                    for each (_local_6 in _local_4)
                    {
                        this.dispatchImageAsset(_local_5.clone(), _local_6.roomId, _local_6._Str_1577, _local_6.objectCategory, _local_6.imageURL, _local_6.clickURL);
                    }
                }
            }
        }

        private function dispatchImageAsset(k:BitmapData, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:String, _arg_6:String):void
        {
            if (events != null)
            {
                events.dispatchEvent(new AdEvent(AdEvent.ROOM_AD_IMAGE_LOADED, _arg_2, k, _arg_5, _arg_6, null, null, _arg_3, _arg_4));
            }
        }

        private function onBillboardImageReady(k:AssetLoaderEvent):void
        {
            var _local_4:AdImageRequest;
            var _local_2:AssetLoaderStruct = (k.target as AssetLoaderStruct);
            var _local_3:Array = this._billboardImageLoaders.remove(_local_2.assetName);
            if (((_local_3 == null) || (_local_3.length == 0)))
            {
                return;
            }
            for each (_local_4 in _local_3)
            {
                this.dispatchImageAsset(null, _local_4.roomId, _local_4._Str_1577, _local_4.objectCategory, _local_4.imageURL, _local_4.clickURL);
            }
        }
    }
}
