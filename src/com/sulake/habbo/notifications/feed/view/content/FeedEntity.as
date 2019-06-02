package com.sulake.habbo.notifications.feed.view.content
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.notifications.feed.NotificationController;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.window.components.IButtonWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.assets.IAsset;
    import flash.display.BitmapData;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.localization.ILocalization;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.IWindow;
    import flash.net.URLRequest;
    import com.sulake.core.assets.AssetLoaderStruct;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;
    import __AS3__.vec.*;

    public class FeedEntity implements IFeedEntity 
    {
        public static var _Str_4669:IWindowContainer;
        public static var _Str_11723:IHabboLocalizationManager;
        public static var _Str_2787:IAssetLibrary;
        public static var _Str_11726:NotificationController;
        private static const _POOL:Vector.<FeedEntity> = new Vector.<FeedEntity>();
        protected static const CONTENT_LIST:String = "content_list";
        protected static const TITLE:String = "title";
        protected static const MESSAGE:String = "message";
        protected static const TIME:String = "time";
        protected static const ICON:String = "icon";
        protected static const DECORATION:String = "decoration";
        protected static const ACTION_BUTTON:String = "action_button";
        protected static const MINUTES:String = "minutes";
        protected static const HOURS:String = "hours";
        protected static const DAYS:String = "days";
        private static const _Str_4468:int = 25;

        protected var _window:IWindowContainer;
        protected var _disposed:Boolean = false;
        protected var _Str_2638:Boolean = false;
        protected var _id:int = -1;
        protected var _Str_15818:int;
        protected var _Str_10954:String;
        protected var _Str_8852:String;
        protected var _Str_9283:String;

        public function FeedEntity():void
        {
            this._window = (_Str_4669.clone() as IWindowContainer);
        }

        public static function _Str_23222(k:IHabboWindowManager, _arg_2:IAssetLibrary, _arg_3:IHabboLocalizationManager, _arg_4:NotificationController):void
        {
            _Str_4669 = (k.buildFromXML((_arg_2.getAssetByName("feed_entity_xml").content as XML)) as IWindowContainer);
            _Str_2787 = _arg_2;
            _Str_11723 = _arg_3;
            _Str_11726 = _arg_4;
        }

        public static function _Str_23840():void
        {
            if (_Str_4669)
            {
                _Str_4669.dispose();
                _Str_4669 = null;
            }
            _Str_2787 = null;
            _Str_11723 = null;
            _Str_11726 = null;
        }

        public static function _Str_2363():FeedEntity
        {
            var k:FeedEntity = ((_POOL.length > 0) ? _POOL.pop() : new (FeedEntity)());
            k._Str_2638 = false;
            return k;
        }


        public function set id(k:int):void
        {
            this._id = k;
        }

        public function get id():int
        {
            return this._id;
        }

        public function set title(k:String):void
        {
            this._window.findChildByName(TITLE).caption = ((k) ? k : "");
        }

        public function get title():String
        {
            return (this._window) ? this._window.findChildByName(TITLE).caption : null;
        }

        public function set message(k:String):void
        {
            this._window.findChildByName(MESSAGE).caption = ((k) ? k : "");
        }

        public function get message():String
        {
            return (this._window) ? this._window.findChildByName(MESSAGE).caption : null;
        }

        public function _Str_24362(k:String, _arg_2:String):void
        {
            if (!this._window)
            {
                return;
            }
            this._Str_9283 = k;
            var _local_3:IButtonWindow = (this._window.findChildByName(ACTION_BUTTON) as IButtonWindow);
            if (this._Str_9283 == null)
            {
                _local_3.height = 0;
            }
            else
            {
                _local_3.height = _Str_4468;
                _local_3.caption = _arg_2;
                _local_3.addEventListener(WindowMouseEvent.CLICK, this._Str_21462);
            }
        }

        public function set _Str_26144(k:String):void
        {
            var _local_2:IAsset;
            if (!k)
            {
                return;
            }
            if (k != this._Str_10954)
            {
                this._Str_10954 = k;
                _local_2 = _Str_2787.getAssetByName(k);
                if (_local_2)
                {
                    this.icon = (_local_2.content as BitmapData);
                }
                else
                {
                    this._Str_20851(k);
                }
            }
        }

        public function set _Str_26226(k:String):void
        {
            var _local_2:IAsset;
            if (!k)
            {
                return;
            }
            if (k != this._Str_8852)
            {
                this._Str_8852 = k;
                _local_2 = _Str_2787.getAssetByName(k);
                if (_local_2)
                {
                    this.decoration = (_local_2.content as BitmapData);
                }
                else
                {
                    this._Str_20851(k);
                }
            }
        }

        public function set icon(k:BitmapData):void
        {
            if (((this.disposed) || (!(this._window))))
            {
                return;
            }
            var _local_2:IBitmapWrapperWindow = (this._window.findChildByName(ICON) as IBitmapWrapperWindow);
            this._Str_4497(_local_2, k);
            this._Str_10954 = null;
        }

        public function set decoration(k:BitmapData):void
        {
            if (((this.disposed) || (!(this._window))))
            {
                return;
            }
            var _local_2:IBitmapWrapperWindow = (this._window.findChildByName(DECORATION) as IBitmapWrapperWindow);
            this._Str_4497(_local_2, k);
            this._Str_8852 = null;
        }

        public function get window():IWindowContainer
        {
            return this._window;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get _Str_6044():Boolean
        {
            return this._Str_2638;
        }

        public function set _Str_19059(k:int):void
        {
            var _local_2:ITextWindow = (this._window.findChildByName(TIME) as ITextWindow);
            if (k < 0)
            {
                _local_2.height = 0;
                return;
            }
            this._Str_15818 = k;
            var _local_3:String = MINUTES;
            if (this._Str_15818 >= (24 * 60))
            {
                _local_3 = DAYS;
                k = (k / (24 * 60));
            }
            else
            {
                if (this._Str_15818 >= 60)
                {
                    _local_3 = HOURS;
                    k = (k / 60);
                }
            }
            var _local_4:ILocalization = _Str_11723.getLocalizationRaw((("friendbar.stream." + _local_3) + ".ago"));
            _local_2.caption = ((_local_4) ? _local_4.raw.replace("%value%", String(k)) : "...?");
        }

        public function get _Str_19059():int
        {
            return this._Str_15818;
        }

        public function _Str_21184():void
        {
            if (((!(this._window)) || (this.disposed)))
            {
                return;
            }
            var k:IItemListWindow = (this._window.findChildByName(CONTENT_LIST) as IItemListWindow);
            var _local_2:IWindow = (k.getListItemAt((k.numListItems - 1)) as IWindow);
            k.height = ((_local_2) ? (_local_2.y + _local_2.height) : 0);
        }

        public function recycle():void
        {
            if (!this._Str_2638)
            {
                if (!this._disposed)
                {
                    this._window.parent = null;
                    IBitmapWrapperWindow(this._window.findChildByName(DECORATION)).bitmap = null;
                    IBitmapWrapperWindow(this._window.findChildByName(ICON)).bitmap = null;
                    (this._window.findChildByName(ACTION_BUTTON) as IButtonWindow).removeEventListener(WindowMouseEvent.CLICK, this._Str_21462);
                    this._Str_8852 = null;
                    this._Str_2638 = true;
                    _POOL.push(this);
                }
            }
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                if (this._window)
                {
                    this._window.dispose();
                    this._window = null;
                }
                if (this._Str_2638)
                {
                    _POOL.splice(_POOL.indexOf(this), 1);
                    this._Str_2638 = false;
                }
                this._disposed = true;
            }
        }

        protected function _Str_21462(k:WindowMouseEvent):void
        {
            _Str_11726._Str_25651(this._Str_9283);
        }

        private function _Str_4497(k:IBitmapWrapperWindow, _arg_2:BitmapData):void
        {
            if (_arg_2 == null)
            {
                k.bitmap = null;
                k.height = 0;
                return;
            }
            var _local_3:Number = (k.x + (k.width / 2));
            var _local_4:Number = (k.y + (k.height / 2));
            k.bitmap = _arg_2;
            k.x = (_local_3 - (_arg_2.width / 2));
            k.y = (_local_4 - (_arg_2.height / 2));
            k.width = _arg_2.width;
            k.height = _arg_2.height;
        }

        private function _Str_20851(k:String):void
        {
            var _local_2:AssetLoaderStruct = _Str_2787.loadAssetFromFile(k, new URLRequest(k));
            _local_2.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTCOMPLETE, this._Str_20557);
            _local_2.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTERROR, this._Str_20557);
        }

        private function _Str_20557(k:AssetLoaderEvent):void
        {
            var _local_2:AssetLoaderStruct;
            var _local_3:IAsset;
            if (k.type == AssetLoaderEvent.ASSETLOADEREVENTCOMPLETE)
            {
                _local_2 = (k.target as AssetLoaderStruct);
                if (_local_2.assetName == this._Str_8852)
                {
                    _local_3 = _Str_2787.getAssetByName(this._Str_8852);
                    if (_local_3)
                    {
                        this.decoration = (_local_3.content as BitmapData);
                    }
                }
                else
                {
                    if (_local_2.assetName == this._Str_10954)
                    {
                        _local_3 = _Str_2787.getAssetByName(this._Str_10954);
                        if (_local_3)
                        {
                            this.icon = (_local_3.content as BitmapData);
                        }
                    }
                }
                this._Str_21184();
            }
        }
    }
}
