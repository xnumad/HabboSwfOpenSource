package onBoardingHcUi
{
    import flash.display.Sprite;
    import flash.geom.Rectangle;
    import flash.display.DisplayObject;
    import flash.text.TextField;
    import flash.display.Bitmap;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.text.TextFormatAlign;
    import flash.filters.GlowFilter;
    import onBoardingHcUi.images.*;

    public class _Str_951 extends Sprite 
    {
        private static const _Str_1272:Class = _Str_951__Str_1272;
        private static const _Str_1046:Class = _Str_951__Str_1046;
        private static const _Str_1828:Class = _Str_951__Str_1828;

        private var _Str_622:String;
        protected var _Str_873:Rectangle;
        private var _Str_1690:Boolean;
        private var _Str_1709:Boolean;
        private var _Str_603:Function;
        private var _Str_1239:uint;
        private var _Str_803:Sprite;
        private var _Str_2170:DisplayObject;
        private var _Str_1489:DisplayObject;
        private var _Str_1481:DisplayObject;
        private var _Str_1755:DisplayObject;
        private var _Str_1268:DisplayObject;
        private var _Str_848:TextField;
        private var _Str_1052:Boolean;
        private var _hover:Boolean;
        private var _active:Boolean;
        private var _Str_1007:Boolean;
        private var _Str_1055:Boolean;
        private var _Str_2169:Boolean;
        private var _icon:Bitmap;

        public function _Str_951(k:String, _arg_2:Rectangle, _arg_3:Boolean, _arg_4:Function, _arg_5:uint=0xFFFFFF)
        {
            this._Str_622 = k;
            this._Str_873 = _arg_2;
            this._Str_1690 = _arg_3;
            this._Str_603 = _arg_4;
            this._Str_1239 = _arg_5;
            this._icon = this.icon;
            this.active = true;
            mouseChildren = false;
            addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
            addEventListener(Event.REMOVED_FROM_STAGE, this._Str_583);
        }

        private function _Str_583(k:Event):void
        {
            stage.removeEventListener(MouseEvent.MOUSE_UP, this._Str_1703);
            removeEventListener(MouseEvent.MOUSE_DOWN, this._Str_780);
            removeEventListener(MouseEvent.MOUSE_UP, this._Str_712);
            removeEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
            removeEventListener(MouseEvent.MOUSE_OUT, this.onMouseOut);
        }

        protected function onAddedToStage(k:Event):void
        {
            this.x = this._Str_873.x;
            this.y = this._Str_873.y;
            if (this._Str_622 != "")
            {
                this._Str_848 = LoaderUI._Str_1132(this._Str_622, 18, this.textColour, true, false, false, this.italic, TextFormatAlign.LEFT, false, this.underline);
                if (this.etching)
                {
                    LoaderUI._Str_1516(this._Str_848);
                }
                if (this._Str_1690)
                {
                    this._Str_873.width = (this._Str_848.textWidth + this.padding);
                }
            }
            this._Str_2170 = this.defaultBackground;
            this._Str_2170.width = this._Str_873.width;
            this._Str_2170.height = this._Str_873.height;
            this._Str_1489 = this.currentlyActive;
            this._Str_1489.width = this._Str_873.width;
            this._Str_1489.height = this._Str_873.height;
            this._Str_1481 = this.pressedBackground;
            this._Str_1481.width = this._Str_873.width;
            this._Str_1481.height = this._Str_873.height;
            this._Str_1755 = this.inactiveBackground;
            this._Str_1755.width = this._Str_873.width;
            this._Str_1755.height = this._Str_873.height;
            this._Str_1268 = this.rolloverBackground;
            if (this._Str_1268 != null)
            {
                this._Str_1268.width = this._Str_873.width;
                this._Str_1268.height = this._Str_873.height;
            }
            while (numChildren > 0)
            {
                removeChildAt(0);
            }
            this._Str_803 = new Sprite();
            this._Str_803.addChild(this._Str_2170);
            this._Str_803.addChild(this._Str_1481);
            this._Str_803.addChild(this._Str_1755);
            this._Str_803.addChild(this._Str_1489);
            if (this._Str_1268 != null)
            {
                this._Str_803.addChild(this._Str_1268);
            }
            addChild(this._Str_803);
            if (this._Str_622 != "")
            {
                addChild(this._Str_848);
                this._Str_848.x = (((this._Str_873.width - this._Str_848.textWidth) / 2) - 2);
                this._Str_848.y = (((this._Str_873.height - this._Str_848.textHeight) / 2) - 2);
            }
            if (this.icon != null)
            {
                this._Str_803.addChild(this.icon);
                this.icon.x = 10;
                this._icon.y = ((this._Str_803.height - this.icon.height) / 2);
            }
            this.refresh();
            width = this._Str_873.width;
            height = this._Str_873.height;
            if (this._Str_1732)
            {
                this.x = int(((parent.width - width) / 2));
            }
            if (this._Str_2169)
            {
                this.x = (parent.width - width);
            }
            addEventListener(MouseEvent.MOUSE_DOWN, this._Str_780);
            addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
            addEventListener(MouseEvent.MOUSE_OUT, this.onMouseOut);
        }

        private function onMouseOut(k:MouseEvent):void
        {
            this._hover = false;
            this.refresh();
        }

        private function onMouseOver(k:MouseEvent):void
        {
            if (!this._active)
            {
                return;
            }
            this._hover = true;
            this.refresh();
        }

        private function _Str_780(k:MouseEvent):void
        {
            if (!this._active)
            {
                return;
            }
            stage.addEventListener(MouseEvent.MOUSE_UP, this._Str_1703);
            addEventListener(MouseEvent.MOUSE_UP, this._Str_712);
            this._Str_1052 = true;
            this.refresh();
        }

        private function _Str_712(k:MouseEvent):void
        {
            k.stopImmediatePropagation();
            stage.removeEventListener(MouseEvent.MOUSE_UP, this._Str_1703);
            removeEventListener(MouseEvent.MOUSE_UP, this._Str_712);
            this._Str_1052 = false;
            this.refresh();
            this._Str_603(this);
        }

        private function _Str_1703(k:MouseEvent):void
        {
            stage.removeEventListener(MouseEvent.MOUSE_UP, this._Str_1703);
            removeEventListener(MouseEvent.MOUSE_UP, this._Str_712);
            this._Str_1052 = false;
            this.refresh();
        }

        private function refresh():void
        {
            var k:int = 1;
            var _local_2:int = 2;
            var _local_3:int = 3;
            var _local_4:int = 4;
            if (this._Str_803 == null)
            {
                return;
            }
            var _local_5:int = ((this._active) ? ((((this._Str_1052) && (this._hover)) || (this._Str_1007)) ? _local_2 : k) : _local_3);
            if (this._Str_1055)
            {
                _local_5 = _local_4;
            }
            this._Str_2170.visible = ((_local_5 == k) && ((this._Str_1268 == null) || (!(this._hover))));
            this._Str_1481.visible = (_local_5 == _local_2);
            this._Str_1755.visible = (_local_5 == _local_3);
            this._Str_1489.visible = (_local_5 == _local_4);
            if (this._Str_1268 != null)
            {
                this._Str_1268.visible = ((_local_5 == k) && (this._hover));
                filters = [];
            }
            else
            {
                filters = ((this._hover) ? [new GlowFilter(this._Str_1239, 0.7, 10, 10)] : []);
            }
            if (this._Str_848)
            {
                this._Str_848.textColor = ((this._active) ? this.textColour : 0x999999);
            }
        }

        public function get _Str_1732():Boolean
        {
            return this._Str_1709;
        }

        public function set _Str_1732(k:Boolean):void
        {
            this._Str_1709 = k;
        }

        override public function set x(k:Number):void
        {
            super.x = k;
            this._Str_873.x = k;
        }

        override public function set y(k:Number):void
        {
            super.y = k;
            this._Str_873.y = k;
        }

        public function get active():Boolean
        {
            return this._active;
        }

        public function set active(k:Boolean):void
        {
            this._active = k;
            buttonMode = this._active;
            this.refresh();
        }

        public function unselect():void
        {
            this._Str_1055 = false;
            this._Str_1007 = false;
            this.refresh();
        }

        public function _Str_1854():void
        {
            this._Str_1055 = true;
            this.refresh();
        }

        public function select():void
        {
            this._Str_1007 = true;
            this.refresh();
        }

        public function set _Str_1622(k:Boolean):void
        {
            this._Str_2169 = k;
        }

        protected function get defaultBackground():DisplayObject
        {
            return LoaderUI._Str_2038(Bitmap(new _Str_1272()).bitmapData, new Rectangle(5, 5, 1, 2));
        }

        protected function get pressedBackground():DisplayObject
        {
            return LoaderUI._Str_2038(Bitmap(new _Str_1046()).bitmapData, new Rectangle(6, 10, 1, 3));
        }

        protected function get inactiveBackground():DisplayObject
        {
            return LoaderUI._Str_2038(Bitmap(new _Str_1828()).bitmapData, new Rectangle(5, 6, 1, 2));
        }

        protected function get currentlyActive():DisplayObject
        {
            return LoaderUI._Str_2038(Bitmap(new _Str_1272()).bitmapData, new Rectangle(5, 6, 1, 2));
        }

        protected function get rolloverBackground():DisplayObject
        {
            return null;
        }

        protected function get icon():Bitmap
        {
            return this._icon;
        }

        protected function get etching():Boolean
        {
            return true;
        }

        protected function get padding():int
        {
            return 24;
        }

        protected function get textColour():uint
        {
            return 0;
        }

        protected function get italic():Boolean
        {
            return false;
        }

        protected function get underline():Boolean
        {
            return false;
        }
    }
}
