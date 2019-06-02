//com.sulake.habbo.advertisement.AdManager

package com.sulake.habbo.advertisement{
    import com.sulake.core.runtime.Component;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.session.ISessionDataManager;
    import flash.utils.Timer;
    import flash.display.BitmapData;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageEvent;
    import __AS3__.vec.Vector;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.habbo.communication.messages.incoming.advertisement.InterstitialMessageEvent;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;
    import flash.display.Bitmap;
    import flash.events.TimerEvent;

    public class AdManager extends Component implements IAdManager {

        private var _communicationManager:IHabboCommunicationManager;
        private var _sessionDataManager:ISessionDataManager;
        private var _interstitialClickUrl:String;
        private var _interstitialVideoUrl:String;
        private var _interstitialLastShow:int;
        private var _interstitialCurrentDisplayCount:int;
        private var _interstitialTimer:Timer;
        private var _roomAdWarningImageLeft:BitmapData;
        private var _roomAdWarningImageRight:BitmapData;
        private var _billboardImageLoaders:Map;
        private var _interstitialMessageEvent:IMessageEvent;
        private var _ignoreUrlList:Vector.<String>;

        public function AdManager(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null);

        public function get sessionDataManager():ISessionDataManager;

        override protected function get dependencies():Vector.<ComponentDependency>{
        }
        override protected function initComponent():void;

        override public function dispose():void;

        public function showInterstitial():Boolean;

        private function onInterstitial(k:InterstitialMessageEvent):void;

        private function interstitialLoaderEventHandler(k:AssetLoaderEvent):void;

        private function startInterstitial(k:Bitmap):void;

        private function interstitialTimerComplete(k:TimerEvent):void;

        private function stopInterstitial():void;

        private function adWarningLeftReady(k:AssetLoaderEvent):void;

        private function adWarningRightReady(k:AssetLoaderEvent):void;

        private function emulateBackgroundTransparency(k:BitmapData):BitmapData;

        private function isValidAdImage(k:Bitmap):Boolean;

        public function loadRoomAdImage(k:int, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:String, _arg_6:int):void;

        private function disposeAsset(k:String):void;

        private function onBillboardImageReady(k:AssetLoaderEvent):void;

        private function dispatchImageFailed(k:int, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:String):void;

        private function isIgnored(k:String):Boolean;

        private function addAsIgnored(k:String):void;

        private function dispatchImageAsset(k:BitmapData, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:String, _arg_6:String):void;

        private function onBillboardImageLoadError(k:AssetLoaderEvent):void;


    }
}//package com.sulake.habbo.advertisement

