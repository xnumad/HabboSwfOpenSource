package com.sulake.habbo.window.widgets
{
    import com.sulake.habbo.avatar.IAvatarImageListener;
    import com.sulake.core.window.utils.PropertyStruct;
    import com.sulake.habbo.avatar.enum.AvatarScaleType;
    import com.sulake.habbo.window.enum._Str_3724;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.iterators.EmptyIterator;
    import com.sulake.core.window.utils.IIterator;
    import com.sulake.habbo.avatar.IAvatarImage;
    import com.sulake.habbo.avatar.enum.AvatarSetType;
    import flash.display.BitmapData;
    import flash.geom.Point;
    import flash.filters.ColorMatrixFilter;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_2553;

    public class AvatarImageWidget implements _Str_2483, IAvatarImageListener 
    {
        public static const AVATAR_IMAGE:String = "avatar_image";
        private static const _Str_4305:String = (AVATAR_IMAGE + ":figure");
        private static const _Str_3540:String = (AVATAR_IMAGE + ":scale");
        private static const _Str_15149:String = (AVATAR_IMAGE + ":only_head");
        private static const _Str_13883:String = (AVATAR_IMAGE + ":cropped");
        private static const _Str_4259:String = (AVATAR_IMAGE + ":direction");
        private static const _Str_3257:Array = ["northeast", "east", "southeast", "south", "southwest", "west", "northwest", "north"];
        private static const _Str_3804:PropertyStruct = new PropertyStruct(_Str_4305, "hd-180-1.ch-210-66.lg-270-82.sh-290-81", PropertyStruct.STRING);
        private static const _Str_3527:PropertyStruct = new PropertyStruct(_Str_3540, AvatarScaleType.LARGE, PropertyStruct.STRING, false, [AvatarScaleType.SMALL, AvatarScaleType.LARGE]);
        private static const _Str_15271:PropertyStruct = new PropertyStruct(_Str_15149, false, PropertyStruct.BOOLEAN);
        private static const _Str_13004:PropertyStruct = new PropertyStruct(_Str_13883, false, PropertyStruct.BOOLEAN);
        private static const _Str_4346:PropertyStruct = new PropertyStruct(_Str_4259, _Str_3257[_Str_3724._Str_4519], PropertyStruct.STRING, false, _Str_3257);

        private const rc:Number = 0.333333333333333;
        private const _Str_761:Number = 0.333333333333333;
        private const bc:Number = 0.333333333333333;

        private var _disposed:Boolean;
        private var _widgetWindow:IWidgetWindow;
        private var _windowManager:HabboWindowManagerComponent;
        private var _root:IWindowContainer;
        private var _bitmap:IBitmapWrapperWindow;
        private var _region:IRegionWindow;
        private var _figure:String;
        private var _scale:String;
        private var _onlyHead:Boolean;
        private var _cropped:Boolean;
        private var _direction:int;
        private var _userId:int;

        public function AvatarImageWidget(k:IWidgetWindow, _arg_2:HabboWindowManagerComponent)
        {
            this._figure = String(_Str_3804.value);
            this._scale = String(_Str_3527.value);
            this._onlyHead = Boolean(_Str_15271.value);
            this._cropped = Boolean(_Str_13004.value);
            this._direction = _Str_3257.indexOf(String(_Str_4346.value));
            super();
            this._widgetWindow = k;
            this._windowManager = _arg_2;
            this._root = (this._windowManager.buildFromXML((this._windowManager.assets.getAssetByName("avatar_image_xml").content as XML)) as IWindowContainer);
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
            k.push(_Str_15271.withValue(this._onlyHead));
            k.push(_Str_13004.withValue(this._cropped));
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
                        this.scale = String(_local_2.value);
                        break;
                    case _Str_15149:
                        this._Str_13957 = Boolean(_local_2.value);
                        break;
                    case _Str_13883:
                        this._Str_13833 = Boolean(_local_2.value);
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

        public function get scale():String
        {
            return this._scale;
        }

        public function set scale(k:String):void
        {
            this._scale = k;
            this.refresh();
        }

        public function get _Str_13957():Boolean
        {
            return this._onlyHead;
        }

        public function set _Str_13957(k:Boolean):void
        {
            this._onlyHead = k;
            this.refresh();
        }

        public function get _Str_13833():Boolean
        {
            return this._cropped;
        }

        public function set _Str_13833(k:Boolean):void
        {
            this._cropped = k;
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

        public function get userId():int
        {
            return this._userId;
        }

        public function set userId(k:int):void
        {
            this._userId = k;
            this._region.visible = (this._userId > 0);
        }

        public function _Str_840(k:String):void
        {
            if (this._Str_12216(k) == this._figure)
            {
                this.refresh();
            }
        }

        private function refresh():void
        {
            var _local_3:Number;
            var _local_4:IAvatarImage;
            var _local_5:String;
            this._bitmap.bitmap = null;
            var k:Boolean;
            var _local_2:String = this._figure;
            if (((_local_2 == null) || (_local_2.length == 0)))
            {
                k = true;
                _local_2 = String(_Str_3804.value);
            }
            if (this._windowManager._Str_1458 != null)
            {
                _local_3 = ((this._scale == AvatarScaleType.LARGE) ? 1 : 0.5);
                _local_4 = this._windowManager._Str_1458.createAvatarImage(_local_2, AvatarScaleType.LARGE, null, this);
                if (_local_4 != null)
                {
                    _local_4.setDirection(((this._onlyHead) ? AvatarSetType.HEAD : AvatarSetType.FULL), this._direction);
                    if (this._cropped)
                    {
                        this._bitmap.bitmap = _local_4._Str_818(((this._onlyHead) ? AvatarSetType.HEAD : AvatarSetType.FULL), _local_3);
                    }
                    else
                    {
                        this._bitmap.bitmap = _local_4.getImage(((this._onlyHead) ? AvatarSetType.HEAD : AvatarSetType.FULL), true, _local_3);
                    }
                    if (k)
                    {
                        this._Str_20832(this._bitmap);
                    }
                    this._bitmap.disposesBitmap = true;
                    _local_4.dispose();
                }
            }
            if (((this._bitmap.bitmap == null) || (this._bitmap.bitmap.width < 2)))
            {
                _local_5 = (((("placeholder_avatar" + ((this._scale == AvatarScaleType.SMALL) ? "_small" : "")) + ((this._onlyHead) ? "_head" : "")) + ((this._cropped) ? "_cropped" : "")) + "_png");
                this._bitmap.bitmap = (this._windowManager.assets.getAssetByName(_local_5).content as BitmapData);
                this._bitmap.disposesBitmap = false;
                this._Str_20832(this._bitmap);
            }
            this._bitmap.invalidate();
            this._widgetWindow.width = this._bitmap.bitmap.width;
            this._widgetWindow.height = this._bitmap.bitmap.height;
        }

        private function _Str_20832(k:IBitmapWrapperWindow):*
        {
            this._bitmap.bitmap.applyFilter(this._bitmap.bitmap, this._bitmap.bitmap.rect, new Point(), new ColorMatrixFilter([this.rc, this._Str_761, this.bc, 0, 0, this.rc, this._Str_761, this.bc, 0, 0, this.rc, this._Str_761, this.bc, 0, 0, 0, 0, 0, 1, 0]));
        }

        private function _Str_12216(k:String):String
        {
            return (k == null) ? String(_Str_3804.value) : k.replace(/NaN/g, "");
        }

        private function onClick(k:WindowMouseEvent):void
        {
            if (this._userId > 0)
            {
                this._windowManager.communication.connection.send(new _Str_2553(this._userId));
            }
        }
    }
}






