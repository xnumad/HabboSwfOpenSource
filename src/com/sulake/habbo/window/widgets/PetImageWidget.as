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
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.iterators.EmptyIterator;
    import com.sulake.core.window.utils.IIterator;
    import flash.display.BitmapData;
    import com.sulake.habbo.room.ImageResult;
    import com.sulake.habbo.avatar.pets.PetFigureData;
    import com.sulake.room.utils.Vector3d;

    public class PetImageWidget implements _Str_18605, IGetImageListener 
    {
        public static const PET_IMAGE:String = "pet_image";
        private static const _Str_4305:String = (PET_IMAGE + ":figure");
        private static const _Str_3540:String = (PET_IMAGE + ":scale");
        private static const _Str_4259:String = (PET_IMAGE + ":direction");
        private static const _Str_3257:Array = ["northeast", "east", "southeast", "south", "southwest", "west", "northwest", "north"];
        private static const _Str_7546:Array = [32, 64];
        private static const _Str_3804:PropertyStruct = new PropertyStruct(_Str_4305, "1 0 ffffff", PropertyStruct.STRING);
        private static const _Str_3527:PropertyStruct = new PropertyStruct(_Str_3540, 64, PropertyStruct.INT, false, _Str_7546);
        private static const _Str_4346:PropertyStruct = new PropertyStruct(_Str_4259, _Str_3257[_Str_3724._Str_4519], PropertyStruct.STRING, false, _Str_3257);

        private var _disposed:Boolean;
        private var _widgetWindow:IWidgetWindow;
        private var _windowManager:HabboWindowManagerComponent;
        private var _root:IWindowContainer;
        private var _bitmap:IBitmapWrapperWindow;
        private var _region:IRegionWindow;
        private var _figure:String;
        private var _scale:int;
        private var _direction:int;
        private var _imageCallbackIds:Map;

        public function PetImageWidget(k:IWidgetWindow, _arg_2:HabboWindowManagerComponent)
        {
            this._figure = String(_Str_3804.value);
            this._scale = int(_Str_3527.value);
            this._direction = _Str_3257.indexOf(String(_Str_4346.value));
            super();
            this._widgetWindow = k;
            this._windowManager = _arg_2;
            this._imageCallbackIds = new Map();
            this._root = (this._windowManager.buildFromXML((this._windowManager.assets.getAssetByName("pet_image_xml").content as XML)) as IWindowContainer);
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
            k.push(_Str_3804.withValue(this._figure));
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
                    case _Str_4305:
                        this.figure = String(_local_2.value);
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

        public function get figure():String
        {
            return this._figure;
        }

        public function set figure(k:String):void
        {
            this._figure = this._Str_12216(k);
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
            if (_local_3 != null)
            {
                if (this._Str_12216(_local_3) == this._figure)
                {
                    this.refresh();
                }
            }
        }

        public function imageFailed(k:int):void
        {
        }

        private function refresh():void
        {
            var _local_2:BitmapData;
            var _local_3:String;
            var _local_4:ImageResult;
            var _local_5:int;
            var _local_6:String;
            this._bitmap.bitmap = null;
            var k:PetFigureData = new PetFigureData(this._figure);
            if (this._windowManager.roomEngine != null)
            {
                _local_3 = "std";
                _local_4 = this._windowManager.roomEngine.getPetImage(k.typeId, k.paletteId, k.color, new Vector3d((this._direction * 45)), this.scale, this, true, 0, k._Str_3542, _local_3);
                if (_local_4 != null)
                {
                    _local_5 = _local_4.id;
                    this._imageCallbackIds.remove(_local_5);
                    if (_local_5 > 0)
                    {
                        this._imageCallbackIds.add(_local_5, this._figure);
                    }
                    this._bitmap.bitmap = _local_4.data;
                    this._bitmap.disposesBitmap = true;
                }
            }
            if (((this._bitmap.bitmap == null) || (this._bitmap.bitmap.width < 2)))
            {
                _local_6 = (("placeholder_pet" + ((this._scale == 32) ? "_small" : "")) + "_png");
                this._bitmap.bitmap = (this._windowManager.assets.getAssetByName(_local_6).content as BitmapData);
                this._bitmap.disposesBitmap = false;
            }
            this._bitmap.invalidate();
            this._widgetWindow.width = this._bitmap.bitmap.width;
            this._widgetWindow.height = this._bitmap.bitmap.height;
        }

        private function _Str_12216(k:String):String
        {
            return (k == null) ? String(_Str_3804.value) : k.replace(/NaN/g, "");
        }

        private function onClick(k:WindowMouseEvent):void
        {
        }
    }
}



