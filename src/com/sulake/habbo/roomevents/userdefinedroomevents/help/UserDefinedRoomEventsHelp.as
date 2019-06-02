package com.sulake.habbo.roomevents.userdefinedroomevents.help
{
    import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.components.IContainerButtonWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.localization.ILocalization;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.display.BitmapData;
    import flash.geom.Point;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.net.URLRequest;
    import com.sulake.core.assets.AssetLoaderStruct;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;

    public class UserDefinedRoomEventsHelp 
    {
        private var _roomEvents:HabboUserDefinedRoomEvents;
        private var _helpContainer:IWindowContainer;
        private var _window:IFrameWindow;
        private var _view:IWindowContainer;
        private var _currentPage:int = 0;
        private var _localizations:Array;
        private var _buttonNext:IContainerButtonWindow;
        private var _buttonPrevious:IContainerButtonWindow;

        public function UserDefinedRoomEventsHelp(k:HabboUserDefinedRoomEvents)
        {
            this._roomEvents = k;
        }

        public function dispose():void
        {
        }

        private function _Str_2755():void
        {
            if (this._window != null)
            {
                return;
            }
            this.requestLocalizationInit();
            this._window = IFrameWindow(this._roomEvents.getXmlWindow("ude_help"));
            this._helpContainer = IWindowContainer(this.find(this._window, "help_container"));
            this._buttonPrevious = (this._helpContainer.findChildByName("button_previous") as IContainerButtonWindow);
            if (this._buttonPrevious)
            {
                this._buttonPrevious.procedure = this._Str_3369;
            }
            this._buttonNext = (this._helpContainer.findChildByName("button_next") as IContainerButtonWindow);
            if (this._buttonNext)
            {
                this._buttonNext.procedure = this._Str_3369;
            }
            var k:IWindow = this._window.findChildByTag("close");
            k.procedure = this._Str_3046;
            this._window.center();
        }

        public function open(k:int=-1, _arg_2:int=-1):void
        {
            this._Str_2755();
            this.openPage();
            this._window.visible = true;
            if (k >= 0)
            {
                this._window.x = k;
            }
            if (_arg_2 >= 0)
            {
                this._window.y = _arg_2;
            }
        }

        private function _Str_3046(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this.close();
            }
        }

        public function close():void
        {
            if (this._window)
            {
                this._window.visible = false;
            }
        }

        private function find(k:IWindowContainer, _arg_2:String):IWindow
        {
            var _local_3:IWindow = k.findChildByName(_arg_2);
            if (_local_3 == null)
            {
                throw (new Error((("Window element with name: " + _arg_2) + " cannot be found!")));
            }
            return _local_3;
        }

        public function toggle():void
        {
            this._window.visible = (!(this._window.visible));
        }

        private function openPage():void
        {
            this._Str_19940();
            this._Str_25855();
        }

        private function _Str_25855():void
        {
            if (this._currentPage >= (this._localizations.length - 1))
            {
                this._buttonNext.disable();
            }
            else
            {
                this._buttonNext.enable();
            }
            if (this._currentPage <= 0)
            {
                this._buttonPrevious.disable();
            }
            else
            {
                this._buttonPrevious.enable();
            }
        }

        private function _Str_24548():void
        {
            this._currentPage++;
            this._currentPage = Math.min(this._currentPage, (this._localizations.length - 1));
            this.openPage();
        }

        private function _Str_23595():void
        {
            this._currentPage--;
            this._currentPage = Math.max(this._currentPage, 0);
            this.openPage();
        }

        private function requestLocalizationInit():void
        {
            var _local_2:ILocalization;
            var _local_3:ILocalization;
            var _local_4:ILocalization;
            this._localizations = [];
            var k:int = 1;
            while (this._roomEvents.localization.getLocalizationRaw((("wiredfurni.help." + k) + ".title")))
            {
                _local_2 = this._roomEvents.localization.getLocalizationRaw((("wiredfurni.help." + k) + ".title"));
                _local_3 = this._roomEvents.localization.getLocalizationRaw((("wiredfurni.help." + k) + ".img"));
                _local_4 = this._roomEvents.localization.getLocalizationRaw((("wiredfurni.help." + k) + ".text"));
                this._localizations.push([_local_2, _local_3, _local_4]);
                k++;
            }
        }

        private function _Str_3369(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                switch (_arg_2.name)
                {
                    case "button_previous":
                        this._Str_23595();
                        return;
                    case "button_next":
                        this._Str_24548();
                        return;
                }
            }
        }

        private function _Str_19940():void
        {
            var k:ILocalization;
            var _local_5:String;
            var _local_2:ITextWindow = (this.find(this._window, "help_title") as ITextWindow);
            var _local_3:ITextWindow = (this.find(this._window, "help_text") as ITextWindow);
            var _local_4:IBitmapWrapperWindow = (this.find(this._window, "help_image") as IBitmapWrapperWindow);
            if (((this._localizations == null) || (this._localizations.length == 0)))
            {
                return;
            }
            if (_local_2)
            {
                k = ILocalization(this._localizations[this._currentPage][0]);
                if (k != null)
                {
                    _local_2.text = k.value;
                }
            }
            if (_local_3)
            {
                k = ILocalization(this._localizations[this._currentPage][2]);
                if (k != null)
                {
                    _local_2.text = k.value;
                }
            }
            if (_local_4)
            {
                k = ILocalization(this._localizations[this._currentPage][1]);
                if (k != null)
                {
                    _local_5 = k.value;
                    this._Str_6504(_local_5);
                }
            }
        }

        private function _Str_2972(k:IBitmapWrapperWindow, _arg_2:BitmapData):void
        {
            if (_arg_2 == null)
            {
                return;
            }
            if (k == null)
            {
                return;
            }
            if (k.disposed)
            {
                return;
            }
            var _local_3:int = ((k.width - _arg_2.width) / 2);
            var _local_4:int = ((k.height - _arg_2.height) / 2);
            if (k.bitmap == null)
            {
                k.bitmap = new BitmapData(k.width, k.height, true, 0xFFFFFF);
            }
            k.bitmap.fillRect(k.bitmap.rect, 0xFFFFFF);
            k.bitmap.copyPixels(_arg_2, _arg_2.rect, new Point(_local_3, _local_4), null, null, false);
            k.invalidate();
        }

        private function _Str_6504(k:String):void
        {
            if ((((!(k)) || (!(this._roomEvents))) || (!(this._roomEvents.assets))))
            {
                return;
            }
            var _local_2:BitmapDataAsset = (this._roomEvents.assets.getAssetByName(k) as BitmapDataAsset);
            if (_local_2 == null)
            {
                this._Str_7078(k);
                return;
            }
            var _local_3:IBitmapWrapperWindow = (this.find(this._window, "help_image") as IBitmapWrapperWindow);
            if (_local_3)
            {
                this._Str_2972(_local_3, (_local_2.content as BitmapData));
            }
        }

        private function _Str_7078(k:String):void
        {
            if ((((!(k)) || (!(this._roomEvents))) || (!(this._roomEvents.assets))))
            {
                return;
            }
            var _local_2:String = this._roomEvents.getProperty("image.library.catalogue.url");
            var _local_3:* = ((_local_2 + k) + ".gif");
            Logger.log(("[ProductViewCatalogWidget] Retrieve Product Preview Asset: " + _local_3));
            var _local_4:URLRequest = new URLRequest(_local_3);
            var _local_5:AssetLoaderStruct = this._roomEvents.assets.loadAssetFromFile(k, _local_4, "image/gif");
            if (!_local_5)
            {
                return;
            }
            _local_5.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTCOMPLETE, this._Str_6676);
        }

        private function _Str_6676(k:AssetLoaderEvent):void
        {
            var _local_2:AssetLoaderStruct = (k.target as AssetLoaderStruct);
            if (_local_2 != null)
            {
                this._Str_6504(_local_2.assetName);
            }
        }
    }
}



