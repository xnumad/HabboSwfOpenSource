package com.sulake.habbo.game
{
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.IItemGridWindow;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.window.components.IDisplayObjectWrapper;
    import flash.display.BitmapData;
    import flash.geom.Point;
    import flash.display.Bitmap;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.window.utils.PropertyStruct;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.core.window.components.ITextWindow;

    public class WindowUtils 
    {
        private static var _assets:IAssetLibrary;
        private static var _Str_2277:IHabboWindowManager;


        public static function _Str_4180(k:IWindow, _arg_2:String):void
        {
            var _local_3:IWindow;
            k.caption = _arg_2;
            if ((k.parent is IWindowContainer))
            {
                _local_3 = (k.parent as IWindowContainer).findChildByName((k.name + "_stroke"));
            }
            if ((k.parent is IItemListWindow))
            {
                _local_3 = (k.parent as IItemListWindow).getListItemByName((k.name + "_stroke"));
            }
            if ((k.parent is IItemGridWindow))
            {
                _local_3 = (k.parent as IItemGridWindow)._Str_13519((k.name + "_stroke"));
            }
            if (_local_3)
            {
                if (_local_3.caption != _arg_2)
                {
                    _local_3.caption = _arg_2;
                }
            }
        }

        public static function init(k:IAssetLibrary, _arg_2:IHabboWindowManager):void
        {
            _assets = k;
            _Str_2277 = _arg_2;
        }

        public static function _Str_2972(k:IWindow, _arg_2:BitmapData, _arg_3:int=0, _arg_4:int=0, _arg_5:int=0):void
        {
            var _local_9:IBitmapWrapperWindow;
            var _local_10:IDisplayObjectWrapper;
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
            var _local_6:int = ((_arg_3 > 0) ? _arg_3 : k.height);
            var _local_7:int = (((k.width - _arg_2.width) / 2) + _arg_4);
            var _local_8:int = (((_local_6 - _arg_2.height) / 2) + _arg_5);
            if ((k as IBitmapWrapperWindow) != null)
            {
                _local_9 = IBitmapWrapperWindow(k);
                if (((_local_9.bitmap == null) || (_arg_3 > 0)))
                {
                    _local_9.bitmap = new BitmapData(k.width, _local_6, true, 0xFFFFFF);
                }
                _local_9.bitmap.fillRect(_local_9.bitmap.rect, 0xFFFFFF);
                _local_9.bitmap.copyPixels(_arg_2, _arg_2.rect, new Point(_local_7, _local_8), null, null, false);
                k.invalidate();
            }
            else
            {
                if ((k as IDisplayObjectWrapper) != null)
                {
                    _local_10 = IDisplayObjectWrapper(k);
                    _local_10.setDisplayObject(new Bitmap(_arg_2));
                }
            }
        }

        public static function createWindow(k:String, _arg_2:int=2):IWindow
        {
            var _local_6:IWindow;
            var _local_7:IBitmapWrapperWindow;
            HabboGamesCom.log(("CreateWindow: " + k));
            if (((!(_assets)) || (!(_Str_2277))))
            {
                return null;
            }
            var _local_3:XmlAsset = (_assets.getAssetByName(k) as XmlAsset);
            if (_local_3 == null)
            {
                HabboGamesCom.log(("CreateWindow() could not find the asset for window: " + k));
                return null;
            }
            var _local_4:IWindow = _Str_2277.buildFromXML((_local_3.content as XML), _arg_2);
            var _local_5:Array = [];
            if ((_local_4 is IWindowContainer))
            {
                (_local_4 as IWindowContainer).groupChildrenWithTag("bitmap", _local_5, -1);
            }
            else
            {
                if ((_local_4 is IItemListWindow))
                {
                    (_local_4 as IItemListWindow).groupListItemsWithTag("bitmap", _local_5, -1);
                }
                else
                {
                    if ((_local_4 is IItemGridWindow))
                    {
                    }
                }
            }
            for each (_local_6 in _local_5)
            {
                HabboGamesCom.log(("Found child: " + _local_6.name));
            }
            for each (_local_7 in _local_5)
            {
                if (_local_7 == null)
                {
                }
                else
                {
                    _Str_21499(_local_7, false);
                }
            }
            return _local_4;
        }

        private static function _Str_21499(bmpWindow:IBitmapWrapperWindow, active:Boolean):void
        {
            var asset:IAsset;
            var assetName:String;
            var src:BitmapData;
            if (!_assets)
            {
                return;
            }
            if (bmpWindow == null)
            {
                return;
            }
            var result:Array = bmpWindow.properties.filter(function (k:*, _arg_2:int, _arg_3:Array):Boolean
            {
                return PropertyStruct(k).key == "bitmap_asset_name";
            });
            var offset:Point = new Point();
            if (((result) && (result.length)))
            {
                assetName = (PropertyStruct(result[0]).value as String);
                HabboGamesCom.log(((("Found Image: " + bmpWindow.name) + " : ") + assetName));
                if (active)
                {
                    assetName = assetName.replace("_on", "");
                }
                asset = _assets.getAssetByName(assetName);
                if (((asset) && (asset is BitmapDataAsset)))
                {
                    bmpWindow.bitmap = new BitmapData(bmpWindow.width, bmpWindow.height, true, 0);
                    src = (asset.content as BitmapData);
                    offset.x = ((bmpWindow.width - src.width) / 2);
                    offset.y = ((bmpWindow.height - src.height) / 2);
                    bmpWindow.bitmap.copyPixels(src, src.rect, offset);
                }
            }
        }

        public static function _Str_26294(k:IWindowContainer, _arg_2:String):void
        {
            var _local_3:IWindow = k.findChildByName(_arg_2);
            if (_local_3)
            {
                _local_3.visible = false;
            }
            var _local_4:IWindow = k.findChildByName((_arg_2 + "_stroke"));
            if (_local_4)
            {
                _local_4.visible = false;
            }
        }

        public static function _Str_26442(k:IWindow, _arg_2:uint):void
        {
            var _local_4:ITextWindow;
            var _local_3:Array = [];
            if ((k is IWindowContainer))
            {
                (k as IWindowContainer).groupChildrenWithTag("stroke", _local_3, 10);
            }
            else
            {
                if ((k is IItemListWindow))
                {
                    (k as IItemListWindow).groupListItemsWithTag("stroke", _local_3, 10);
                }
                else
                {
                    if ((k is IItemGridWindow))
                    {
                    }
                }
            }
            for each (_local_4 in _local_3)
            {
                if (_local_4 == null)
                {
                }
                else
                {
                    _local_4.textColor = _arg_2;
                }
            }
        }

        public static function _Str_26291(k:IWindowContainer, _arg_2:String):void
        {
            var _local_3:IWindow = k.findChildByName(_arg_2);
            if (_local_3)
            {
                _local_3.visible = true;
            }
            var _local_4:IWindow = k.findChildByName((_arg_2 + "_stroke"));
            if (_local_4)
            {
                _local_4.visible = true;
            }
        }
    }
}
