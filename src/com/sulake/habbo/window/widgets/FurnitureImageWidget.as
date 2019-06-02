package com.sulake.habbo.window.widgets
{
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.core.window.utils.PropertyStruct;
    import com.sulake.habbo.window.enum._Str_3724;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.iterators.EmptyIterator;
    import com.sulake.core.window.utils.IIterator;
    import flash.display.BitmapData;
    import com.sulake.habbo.room.ImageResult;
    import com.sulake.room.utils.Vector3d;

    public class FurnitureImageWidget implements _Str_18438, IGetImageListener 
    {
        public static const FURNITURE_IMAGE:String = "furniture_image";
        private static const _Str_14664:String = (FURNITURE_IMAGE + ":furnitureType");
        private static const _Str_3540:String = (FURNITURE_IMAGE + ":scale");
        private static const _Str_4259:String = (FURNITURE_IMAGE + ":direction");
        private static const _Str_3257:Array = ["northeast", "east", "southeast", "south", "southwest", "west", "northwest", "north"];
        private static const _Str_7546:Array = [32, 64];
        private static const _Str_17639:PropertyStruct = new PropertyStruct(_Str_14664, "table_plasto_square", PropertyStruct.STRING, false);
        private static const _Str_3527:PropertyStruct = new PropertyStruct(_Str_3540, 64, PropertyStruct.INT, false, _Str_7546);
        private static const _Str_4346:PropertyStruct = new PropertyStruct(_Str_4259, _Str_3257[_Str_3724._Str_4519], PropertyStruct.STRING, false, _Str_3257);
        private static const _Str_16516:int = 0;
        private static const _Str_20628:int = 1;

        private var _disposed:Boolean;
        private var _widgetWindow:IWidgetWindow;
        private var _windowManager:HabboWindowManagerComponent;
        private var _root:IWindowContainer;
        private var _bitmap:IBitmapWrapperWindow;
        private var _region:IRegionWindow;
        private var _furnitureType:String = "table_plasto_square";
        private var _scale:int;
        private var _direction:int;
        private var _imageCallbackIds:Map;
        private var _extra:String;
        private var _itemType:int = 0;
        private var _stuffData:IStuffData = null;

        public function FurnitureImageWidget(k:IWidgetWindow, _arg_2:HabboWindowManagerComponent)
        {
            this._scale = int(_Str_3527.value);
            this._direction = _Str_3257.indexOf(String(_Str_4346.value));
            super();
            this._widgetWindow = k;
            this._windowManager = _arg_2;
            this._imageCallbackIds = new Map();
            this._root = (this._windowManager.buildFromXML((this._windowManager.assets.getAssetByName("furniture_image_xml").content as XML)) as IWindowContainer);
            this._bitmap = (this._root.findChildByName("bitmap") as IBitmapWrapperWindow);
            this._region = (this._root.findChildByName("region") as IRegionWindow);
            this._region.addEventListener(WindowMouseEvent.CLICK, this.onClick);
            this.refresh();
            this._widgetWindow._Str_2429 = this._root;
            this._root.width = this._widgetWindow.width;
            this._root.height = this._widgetWindow.height;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                if (this._region != null)
                {
                    this._region.removeEventListener(WindowMouseEvent.CLICK, this.onClick);
                    this._region.dispose();
                    this._region = null;
                }
                this._bitmap = null;
                if (this._root != null)
                {
                    this._root.dispose();
                    this._root = null;
                }
                if (this._widgetWindow != null)
                {
                    this._widgetWindow._Str_2429 = null;
                    this._widgetWindow = null;
                }
                this._windowManager = null;
                this._disposed = true;
            }
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get iterator():IIterator
        {
            return EmptyIterator.INSTANCE;
        }

        public function get properties():Array
        {
            var k:Array = [];
            if (this._disposed)
            {
                return k;
            }
            k.push(_Str_17639.withValue(this._furnitureType));
            k.push(_Str_3527.withValue(this._scale));
            k.push(_Str_4346.withValue(_Str_3257[this._direction]));
            return k;
        }

        public function set properties(k:Array):void
        {
            var _local_2:PropertyStruct;
            for each (_local_2 in k)
            {
                switch (_local_2.key)
                {
                    case _Str_14664:
                        this._Str_12916 = String(_local_2.value);
                        break;
                    case _Str_3540:
                        this.scale = int(_local_2.value);
                        break;
                    case _Str_4259:
                        this.direction = _Str_3257.indexOf(String(_local_2.value));
                        break;
                }
            }
        }

        public function get _Str_12916():String
        {
            return this._furnitureType;
        }

        public function set _Str_12916(k:String):void
        {
            this._furnitureType = k;
            this.refresh();
        }

        public function get scale():int
        {
            return this._scale;
        }

        public function set scale(k:int):void
        {
            this._scale = k;
            this.refresh();
        }

        public function get direction():int
        {
            return this._direction;
        }

        public function set direction(k:int):void
        {
            this._direction = k;
            this.refresh();
        }

        public function imageReady(k:int, _arg_2:BitmapData):void
        {
            var _local_3:String = this._imageCallbackIds.getValue(k);
            if (_local_3 == this._furnitureType)
            {
                this.refresh();
            }
        }

        public function imageFailed(k:int):void
        {
        }

        private function refresh():void
        {
            var k:ImageResult;
            var _local_2:String;
            var _local_3:int;
            var _local_4:int;
            var _local_5:String;
            this._bitmap.bitmap = null;
            if (this._windowManager.roomEngine != null)
            {
                _local_2 = "std";
                _local_3 = this._windowManager.roomEngine.getFurnitureTypeId(this._furnitureType);
                if (this._itemType == _Str_16516)
                {
                    k = this._windowManager.roomEngine.getFurnitureImage(_local_3, new Vector3d((this._direction * 45), 0, 0), this._scale, this, 0, this._extra, -1, -1, this._stuffData);
                }
                else
                {
                    k = this._windowManager.roomEngine.getWallItemImage(_local_3, new Vector3d((this._direction * 45), 0, 0), this._scale, this, 0, ((this._stuffData) ? this._stuffData.getLegacyString() : ""));
                }
                if (k != null)
                {
                    _local_4 = k.id;
                    this._imageCallbackIds.remove(_local_4);
                    if (_local_4 > 0)
                    {
                        this._imageCallbackIds.add(_local_4, this._furnitureType);
                    }
                    this._bitmap.bitmap = k.data;
                    this._bitmap.disposesBitmap = true;
                }
            }
            if (((this._bitmap.bitmap == null) || (this._bitmap.bitmap.width < 2)))
            {
                _local_5 = (("placeholder_furni" + ((this._scale == 32) ? "_small" : "")) + "_png");
                this._bitmap.bitmap = (this._windowManager.assets.getAssetByName(_local_5).content as BitmapData);
                this._bitmap.disposesBitmap = false;
            }
            this._bitmap.invalidate();
            this._widgetWindow.width = this._bitmap.bitmap.width;
            this._widgetWindow.height = this._bitmap.bitmap.height;
        }

        private function onClick(k:WindowMouseEvent):void
        {
        }
    }
}




