package com.sulake.habbo.ui.widget.loadingbar
{
    import com.sulake.habbo.ui.widget.ConversionTrackingWidget;
    import com.sulake.core.window.components.IBorderWindow;
    import com.sulake.core.runtime.IHabboConfigurationManager;
    import flash.display.BitmapData;
    import flash.display.Sprite;
    import com.apdevblog.ui.video.ApdevVideoPlayer;
    import flash.utils.Dictionary;
    import flash.utils.Timer;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import flash.events.MouseEvent;
    import com.sulake.habbo.ui.widget.events._Str_3227;
    import flash.events.IEventDispatcher;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;
    import flash.events.SecurityErrorEvent;
    import com.apdevblog.ui.video._Str_2872;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.components.IDisplayObjectWrapper;
    import com.sulake.core.assets.AssetLoaderStruct;
    import org.openvideoads.vast.model.VideoAdServingTemplate;
    import com.apdevblog.ui.video.controls.VideoControlsEvent;
    import org.openvideoads.vast.model.TrackingEvent;
    import org.openvideoads.vast.model.VideoAdV2;
    import org.openvideoads.vast.model.MediaFile;
    import org.openvideoads.util.NetworkResource;
    import flash.events.TimerEvent;
    import flash.net.URLLoader;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.net.URLRequest;
    import com.sulake.habbo.utils.HabboWebTools;

    public class LoadingBarWidget extends ConversionTrackingWidget 
    {
        private static const CLOSE:String = "close";
        private static const COMPLETE:String = "complete";
        private static const FIRSTQUARTILE:String = "firstQuartile";
        private static const MIDPOINT:String = "midpoint";
        private static const MUTE:String = "mute";
        private static const PAUSE:String = "pause";
        private static const RESUME:String = "resume";
        private static const THIRDQUARTILE:String = "thirdQuartile";
        private static const UNMUTE:String = "unmute";
        private static const START:String = "start";

        private var _window:IBorderWindow;
        private var _config:IHabboConfigurationManager;
        private var _image:BitmapData;
        private var _clickUrl:String = "";
        private var _adSprite:Sprite = null;
        private var _videoPlayer:ApdevVideoPlayer;
        private var _videoUrl:String = "";
        private var _videoList:Array;
        private var _videoMute:Boolean = false;
        private var _adTrackingEvents:Dictionary;
        private var _interstitialVideoTimer:Timer;
        private var _PreviousPosition:Number;
        private var _clickTrackingUrl:String;
        private var _adPageOpened:Boolean = false;
        private var _videoState:String;

        public function LoadingBarWidget(k:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary, _arg_4:IHabboLocalizationManager, _arg_5:IHabboConfigurationManager)
        {
            this._videoList = [];
            super(k, _arg_2, _arg_3, _arg_4);
            this._config = _arg_5;
        }

        override public function dispose():void
        {
            if (this._adSprite != null)
            {
                this._adSprite.removeEventListener(MouseEvent.CLICK, this._Str_4612);
                this._adSprite = null;
            }
            if (this._image != null)
            {
                this._image.dispose();
                this._image = null;
            }
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
            }
            this._config = null;
            super.dispose();
        }

        override public function registerUpdateEvents(k:IEventDispatcher):void
        {
            if (k == null)
            {
                return;
            }
            k.addEventListener(_Str_3227.RWLBUE_SHOW_LOADING_BAR, this._Str_16768);
            k.addEventListener(_Str_3227.RWLBUW_HIDE_LOADING_BAR, this._Str_18442);
            super.registerUpdateEvents(k);
        }

        override public function unregisterUpdateEvents(k:IEventDispatcher):void
        {
            if (k == null)
            {
                return;
            }
            k.removeEventListener(_Str_3227.RWLBUE_SHOW_LOADING_BAR, this._Str_16768);
            k.removeEventListener(_Str_3227.RWLBUW_HIDE_LOADING_BAR, this._Str_16768);
            k.removeEventListener(_Str_3227.RWLBUW_HIDE_LOADING_BAR, this._Str_18442);
        }

        private function _Str_25958(k:AssetLoaderEvent):void
        {
            Logger.log(((("Error loading xml: " + this._videoUrl) + ", ") + k));
        }

        private function onSecurityError(k:SecurityErrorEvent):void
        {
        }

        private function _Str_16768(k:_Str_3227):void
        {
            if (((k == null) || (!(k.type == _Str_3227.RWLBUE_SHOW_LOADING_BAR))))
            {
                return;
            }
            if (!this.createWindow())
            {
                return;
            }
            this._window.visible = true;
            this._window.center();
        }

        private function _Str_18442(k:_Str_3227):void
        {
            if (((k == null) || (!(k.type == _Str_3227.RWLBUW_HIDE_LOADING_BAR))))
            {
                return;
            }
            if (((this._videoPlayer) && ((this._videoPlayer._Str_3404 == _Str_2872.VIDEOSTATEPLAYING) || (this._videoPlayer._Str_3404 == _Str_2872.VIDEOSTATEPAUSED))))
            {
                return;
            }
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
            }
        }

        private function createWindow():Boolean
        {
            var _local_4:int;
            if (this._window != null)
            {
                return true;
            }
            var k:XmlAsset = (assets.getAssetByName("room_loading_bar") as XmlAsset);
            if (k == null)
            {
                return false;
            }
            this._window = (windowManager.buildFromXML((k.content as XML)) as IBorderWindow);
            if (this._window == null)
            {
                return false;
            }
            this._window.visible = false;
            var _local_2:IRegionWindow = (this._window.findChildByName("region") as IRegionWindow);
            if (_local_2 != null)
            {
            }
            var _local_3:IDisplayObjectWrapper = (this._window.findChildByName("image") as IDisplayObjectWrapper);
            if (_local_3 != null)
            {
                _local_4 = _local_3.height;
                this._window.scale(0, -(_local_4));
            }
            return true;
        }

        private function _Str_19456(k:AssetLoaderEvent):void
        {
            var _local_2:AssetLoaderStruct;
            var _local_3:XmlAsset;
            var _local_4:XML;
            var _local_5:VideoAdServingTemplate;
            _local_2 = (k.target as AssetLoaderStruct);
            _local_2.removeEventListener(AssetLoaderEvent.ASSETLOADEREVENTCOMPLETE, this._Str_19456);
            _local_2.removeEventListener(AssetLoaderEvent.ASSETLOADEREVENTERROR, this._Str_19456);
            if (k.type == AssetLoaderEvent.ASSETLOADEREVENTCOMPLETE)
            {
                _local_3 = (_assets.getAssetByName(_local_2.assetName) as XmlAsset);
                _local_4 = (_local_3.content as XML);
                if (_local_4 != null)
                {
                    _local_5 = new VideoAdServingTemplate();
                    _local_5._Str_15022(_local_4);
                    this._videoList = _local_5.ads;
                    this.playVideo();
                }
            }
        }

        private function _Str_22287(k:int=760, _arg_2:int=480):void
        {
            this._videoPlayer = new ApdevVideoPlayer(k, _arg_2);
            this._videoPlayer._Str_14540 = false;
            this._videoPlayer._Str_11762 = false;
            this._videoPlayer._Str_20925 = this._image;
            this._videoPlayer.autoPlay = false;
            this._videoPlayer._Str_17422.mute.visible = true;
            this._videoPlayer._Str_17422.fullscreen.visible = false;
            this._videoPlayer._Str_17422.bar._Str_18989 = false;
            this._videoPlayer.addEventListener(VideoControlsEvent.STATEUPDATE, this._Str_25250, false, 0, true);
            this._Str_18970();
            this._videoPlayer.addEventListener(VideoControlsEvent.TOGGLESOUND, this._Str_20632);
            this._videoPlayer.addEventListener(VideoControlsEvent.SETVOLUME, this._Str_20632);
            this._videoPlayer.addEventListener(MouseEvent.CLICK, this._Str_25072);
        }

        private function _Str_23195(k:Array, _arg_2:String):void
        {
            var _local_3:TrackingEvent;
            if (k)
            {
                this._adTrackingEvents = new Dictionary();
                this._adTrackingEvents[START] = _arg_2;
                for each (_local_3 in k)
                {
                    this._adTrackingEvents[_local_3.eventType] = _local_3;
                }
            }
        }

        private function _Str_18970():void
        {
            if (((this._videoPlayer == null) || (this._window == null)))
            {
                return;
            }
            var k:IDisplayObjectWrapper = (this._window.findChildByName("image") as IDisplayObjectWrapper);
            if (k == null)
            {
                return;
            }
            var _local_2:int = Math.max(0, (this._videoPlayer.width - k.width));
            var _local_3:int = Math.max(0, (this._videoPlayer.height - k.height));
            this._window.scale(_local_2, _local_3);
            k.setDisplayObject(this._videoPlayer);
            this._videoPlayer.autoPlay = true;
            this._window.visible = true;
            this._window.center();
        }

        private function playVideo():void
        {
            var _local_2:VideoAdV2;
            var _local_5:MediaFile;
            var _local_6:String;
            var _local_7:NetworkResource;
            var k:int = this._videoList.length;
            if (k == 0)
            {
                return;
            }
            if (k > 0)
            {
                _local_2 = (this._videoList[0] as VideoAdV2);
            }
            var _local_3:String = "";
            var _local_4:Array = _local_2.getImpressionList();
            if (_local_4.length > 0)
            {
                _local_3 = String(_local_4[0]);
            }
            if (((_local_2) && (_local_2.hasAds(false))))
            {
                _local_5 = (_local_2.linearVideoAd.mediaFiles[0] as MediaFile);
                if (_local_5 == null)
                {
                    return;
                }
                _local_6 = _local_5.url.url;
                this._Str_23195(_local_2.trackingEvents, _local_3);
                if (_local_2.linearVideoAd.clickThroughs.length > 0)
                {
                    _local_7 = (_local_2.linearVideoAd.clickThroughs[0] as NetworkResource);
                    if (_local_7 != null)
                    {
                        this._clickTrackingUrl = _local_7.url;
                    }
                }
                this._Str_22287(int(_local_5.width), int(_local_5.height));
                this._videoPlayer.load(_local_6);
                this._videoPlayer.play();
                this._Str_5407(START);
                if (this._interstitialVideoTimer == null)
                {
                    this._interstitialVideoTimer = new Timer(500);
                    this._interstitialVideoTimer.addEventListener(TimerEvent.TIMER, this._Str_25552);
                }
                if (this._interstitialVideoTimer.running)
                {
                    this._interstitialVideoTimer.reset();
                }
                this._interstitialVideoTimer.start();
            }
        }

        private function _Str_5407(k:String):void
        {
            var _local_2:TrackingEvent;
            var _local_3:Array;
            var _local_4:URLLoader;
            _local_2 = (this._adTrackingEvents[k] as TrackingEvent);
            if (((!(_local_2 == null)) || (k == START)))
            {
                if (k == START)
                {
                    _local_3 = [this._adTrackingEvents[START]];
                }
                else
                {
                    _local_3 = _local_2.getURLList();
                }
                if (((_local_3) && (_local_3.length > 0)))
                {
                    _local_4 = new URLLoader();
                    _local_4.addEventListener(Event.COMPLETE, this._Str_25284);
                    _local_4.addEventListener(IOErrorEvent.IO_ERROR, this._Str_24634);
                    _local_4.load(new URLRequest(_local_3[0]));
                }
            }
        }

        private function _Str_25552(k:TimerEvent):void
        {
            var _local_2:Number;
            if (this._videoPlayer)
            {
                _local_2 = this._videoPlayer.getPosition();
                if (this._videoPlayer._Str_3404 == _Str_2872.VIDEOSTATEPLAYING)
                {
                    if (((this._PreviousPosition < 0.25) && (_local_2 >= 0.25)))
                    {
                        this._Str_5407(FIRSTQUARTILE);
                    }
                    else
                    {
                        if (((this._PreviousPosition < 0.5) && (_local_2 >= 0.5)))
                        {
                            this._Str_5407(MIDPOINT);
                        }
                        else
                        {
                            if (((this._PreviousPosition < 0.75) && (_local_2 >= 0.75)))
                            {
                                this._Str_5407(THIRDQUARTILE);
                            }
                        }
                    }
                }
                this._PreviousPosition = _local_2;
            }
        }

        private function _Str_25250(k:VideoControlsEvent):void
        {
            if (k.data == _Str_2872.VIDEOSTATESTOPPED)
            {
                this._interstitialVideoTimer.reset();
                this._Str_5407(COMPLETE);
                this._Str_5407(CLOSE);
                this._Str_18442(new _Str_3227(_Str_3227.RWLBUW_HIDE_LOADING_BAR));
            }
            else
            {
                if (((k.data == _Str_2872.VIDEOSTATEPLAYING) && (this._videoState == _Str_2872.VIDEOSTATEPAUSED)))
                {
                    this._Str_5407(RESUME);
                }
                else
                {
                    if (((k.data == _Str_2872.VIDEOSTATEPAUSED) && (!(this._videoState == _Str_2872.VIDEOSTATEPAUSED))))
                    {
                        this._Str_5407(PAUSE);
                    }
                }
            }
            this._videoState = k.data;
        }

        private function _Str_4612(k:Event):void
        {
            if (this._clickUrl != "")
            {
                HabboWebTools.openWebPage(this._clickUrl);
            }
        }

        private function _Str_25072(k:Event):void
        {
            if ((((!(this._videoUrl == "")) && (!(this._clickTrackingUrl == ""))) && (!(this._adPageOpened))))
            {
                HabboWebTools.openWebPage(this._clickTrackingUrl);
                this._adPageOpened = true;
            }
        }

        private function _Str_24634(k:IOErrorEvent):void
        {
        }

        private function _Str_25284(k:Event):void
        {
        }

        private function _Str_24150():void
        {
            this._Str_5407(MUTE);
        }

        private function _Str_23440():void
        {
            this._Str_5407(UNMUTE);
        }

        private function _Str_20632(k:VideoControlsEvent):void
        {
            if (this._videoPlayer._Str_3206 == 0)
            {
                this._videoMute = true;
                this._Str_24150();
            }
            else
            {
                if (this._videoMute)
                {
                    this._Str_23440();
                }
                this._videoMute = false;
            }
        }
    }
}
