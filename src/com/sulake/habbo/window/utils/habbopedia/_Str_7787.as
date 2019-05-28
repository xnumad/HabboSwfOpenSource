package com.sulake.habbo.window.utils.habbopedia
{
    import com.sulake.core.runtime.events.ILinkEventTracker;
    import flash.text.StyleSheet;
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.core.window.IWindowContainer;
    import flash.utils.ByteArray;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.components.IScrollbarWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.HTMLTextController;
    import com.sulake.core.assets.AssetLoaderStruct;
    import flash.net.URLRequest;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;
    import com.sulake.habbo.utils.HabboWebTools;
    import flash.events.Event;
    import com.sulake.habbo.window.utils.habbopedia.binaryData.*;

    public class _Str_7787 implements ILinkEventTracker 
    {
        public static var _Str_18774:Class = _Str_7787__Str_18774;
        public static var _Str_20822:Class = _Str_7787__Str_20822;
        public static var _Str_15204:Class = _Str_7787__Str_15204;
        public static var styleSheet:StyleSheet = _Str_14895();

        private var _habboWindowManagerComponent:HabboWindowManagerComponent;
        private var _window:IWindowContainer;

        public function _Str_7787(k:HabboWindowManagerComponent)
        {
            this._habboWindowManagerComponent = k;
            this._habboWindowManagerComponent.context.addLinkEventTracker(this);
            _Str_14895();
        }

        private static function _Str_14895():StyleSheet
        {
            var k:StyleSheet = new StyleSheet();
            var _local_2:ByteArray = (new _Str_15204() as ByteArray);
            var _local_3:String = _local_2.readUTFBytes(_local_2.length);
            k.parseCSS(_local_3);
            return k;
        }


        private function set visible(k:Boolean):void
        {
            if (((this._window == null) || (this._window.disposed)))
            {
                this._window = this.createWindow(_Str_18774, this._Str_2533);
                (this._window.findChildByName("content") as ITextWindow).styleSheet = styleSheet;
                (this._window.findChildByName("content") as ITextWindow).addEventListener(WindowEvent.WINDOW_EVENT_CHANGE, this._Str_24991);
            }
            this._window.visible = k;
        }

        private function _Str_24991(k:WindowEvent):void
        {
            (this._window.findChildByName("scroller") as IScrollbarWindow).scrollV = 0;
        }

        private function get visible():Boolean
        {
            return (!(this._window == null)) && (this._window.visible);
        }

        private function createWindow(k:Class, _arg_2:Function):IWindowContainer
        {
            var _local_3:ByteArray = (new (k)() as ByteArray);
            var _local_4:XML = new XML(_local_3.readUTFBytes(_local_3.length));
            var _local_5:IWindowContainer = (this._habboWindowManagerComponent.buildFromXML(_local_4) as IWindowContainer);
            _local_5.procedure = _arg_2;
            return _local_5;
        }

        private function _Str_2533(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "header_button_close":
                    this.visible = false;
                    return;
                case "close":
                    this._window.visible = false;
                    return;
            }
        }

        private function _Str_22427(k:String, _arg_2:String):void
        {
            this._window.caption = _arg_2;
            (this._window.findChildByName("content") as HTMLTextController).htmlText = k;
            (this._window.findChildByName("content") as ITextWindow).styleSheet = styleSheet;
        }

        public function dispose():void
        {
            if (this.disposed)
            {
                return;
            }
            this._habboWindowManagerComponent = null;
        }

        public function get disposed():Boolean
        {
            return this._habboWindowManagerComponent == null;
        }

        public function get eventUrlPrefix():String
        {
            return "habbopages/";
        }

        public function linkReceived(link:String):void
        {
            var _local_2:Array = link.split("/");
            if (_local_2.length < 2)
            {
                return;
            }
            _local_2.shift();
            var _local_3:String = _local_2.join("/");
            this.openPage(_local_3);
        }

        public function openPage(k:String):void
        {
            var _local_5:AssetLoaderStruct;
            var _local_2:String = this._habboWindowManagerComponent.getProperty("habbopages.url");
            var _local_3:String = (_local_2 + k);
            if (this._habboWindowManagerComponent.assets.hasAsset(_local_3))
            {
                Logger.log(("[HabboPagesViewer] reload page: " + _local_3));
                this._habboWindowManagerComponent.assets.removeAsset(this._habboWindowManagerComponent.assets.getAssetByName(_local_3));
            }
            var _local_4:URLRequest = new URLRequest((_local_2 + k));
            _local_5 = this._habboWindowManagerComponent.assets.loadAssetFromFile(_local_3, _local_4, "text/plain");
            _local_5.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTCOMPLETE, this._Str_22570);
            _local_5.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTERROR, this._Str_22726);
        }

        private function _Str_22726(k:Event=null):void
        {
            var _local_2:AssetLoaderEvent = (k as AssetLoaderEvent);
            var _local_3:int;
            if (_local_2 != null)
            {
                _local_3 = _local_2.status;
            }
            HabboWebTools.logEventLog(("habbopages download error " + _local_3));
        }

        private function _Str_22570(k:Event=null):void
        {
            var _local_5:Array;
            var _local_6:String;
            var _local_7:String;
            var _local_2:AssetLoaderStruct = (k.target as AssetLoaderStruct);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:RegExp = /\n\r|\n|\r/mg;
            var _local_4:String = (_local_2.assetLoader.content as String);
            if (_local_4 != null)
            {
                _local_5 = _local_4.split(_local_3);
                _local_6 = _local_5.shift();
                _local_7 = _local_5.join("");
                this.visible = true;
                this._Str_22427(_local_7, _local_6);
                this._window.activate();
            }
        }
    }
}
