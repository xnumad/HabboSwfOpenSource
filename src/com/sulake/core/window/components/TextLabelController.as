package com.sulake.core.window.components
{
    import com.sulake.core.window.WindowController;
    import com.sulake.core.localization.ILocalizable;
    import com.sulake.core.window.utils.TextMargins;
    import com.sulake.core.window.theme.PropertyKeys;
    import com.sulake.core.window.utils.TextStyleManager;
    import flash.events.Event;
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window.IWindow;
    import flash.text.TextFormat;
    import com.sulake.core.window.utils.IMargins;
    import com.sulake.core.window.utils.TextStyle;
    import com.sulake.core.window.utils.TextFieldCache;
    import flash.text.TextField;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.graphics.WindowRedrawFlag;
    import com.sulake.core.utils.Map;
    import com.sulake.core.window.utils.PropertyStruct;

    public class TextLabelController extends WindowController implements ILabelWindow, ILocalizable 
    {
        private static const MARGINS:String = "margins";

        private var _textColor:Object = null;
        private var _textStyleName:String;
        private var _text:String = "";
        private var _localized:Boolean = false;
        private var _margins:TextMargins;
        private var _textHeight:Number = 0;
        private var _textWidth:Number = 0;
        private var _refreshing:Boolean = false;
        private var _vertical:Boolean = false;

        public function TextLabelController(k:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:IWindow, _arg_8:Function, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            this._textStyleName = String(_arg_5.getWindowFactory().getThemeManager().getPropertyDefaults(_arg_3).get(PropertyKeys.TEXT_STYLE));
            TextStyleManager.events.addEventListener(Event.CHANGE, this._Str_6721);
            super(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
        }

        public function get antiAliasType():String
        {
            return this.textField.antiAliasType;
        }

        public function get autoSize():String
        {
            return this.textField.autoSize;
        }

        public function get bold():Boolean
        {
            return this.textField.defaultTextFormat.bold;
        }

        public function get border():Boolean
        {
            return this.textField.border;
        }

        public function get borderColor():uint
        {
            return this.textField.borderColor;
        }

        public function get defaultTextFormat():TextFormat
        {
            return this.textField.defaultTextFormat;
        }

        public function get embedFonts():Boolean
        {
            return this.textField.embedFonts;
        }

        public function get fontFace():String
        {
            return this.textField.defaultTextFormat.font;
        }

        public function get fontSize():uint
        {
            return (this.textField.defaultTextFormat.size == null) ? 12 : uint(this.textField.defaultTextFormat.size);
        }

        public function get gridFitType():String
        {
            return this.textField.gridFitType;
        }

        public function get italic():Boolean
        {
            return this.textField.defaultTextFormat.italic;
        }

        public function get kerning():Boolean
        {
            return this.textField.defaultTextFormat.kerning;
        }

        public function get length():int
        {
            return this._text.length;
        }

        public function get margins():IMargins
        {
            if (!this._margins)
            {
                this._margins = new TextMargins(0, 0, 0, 0, this._Str_5268);
            }
            return this._margins;
        }

        public function get maxChars():int
        {
            return this.textField.maxChars;
        }

        public function get sharpness():Number
        {
            return this.textField.sharpness;
        }

        public function get spacing():Number
        {
            return Number(this.textField.defaultTextFormat.letterSpacing);
        }

        public function get text():String
        {
            return this._text;
        }

        public function get textColor():uint
        {
            return uint(this._textColor);
        }

        public function get _Str_5349():Boolean
        {
            return background;
        }

        public function get _Str_4807():uint
        {
            return color;
        }

        public function get textHeight():Number
        {
            return this._textHeight;
        }

        public function get textWidth():Number
        {
            return this._textWidth;
        }

        public function get textStyle():TextStyle
        {
            return TextStyleManager.getStyle(this._textStyleName);
        }

        public function get thickness():Number
        {
            return this.textField.thickness;
        }

        public function get underline():Boolean
        {
            return this.textField.defaultTextFormat.underline;
        }

        public function get _Str_22822():int
        {
            return (this._margins) ? this._margins.left : 0;
        }

        public function get _Str_23873():int
        {
            return (this._margins) ? this._margins.top : 0;
        }

        public function get _Str_25634():Boolean
        {
            return !(this._textColor == null);
        }

        protected function get textField():TextField
        {
            var k:TextField = TextFieldCache._Str_24073(this._textStyleName);
            if (k)
            {
                k.text = this._text;
                if (this._textColor != null)
                {
                    k.textColor = uint(this._textColor);
                }
            }
            return k;
        }

        public function set text(k:String):void
        {
            if (k == null)
            {
                return;
            }
            if (this._localized)
            {
                context.removeLocalizationListener(_caption.slice(2, _caption.indexOf("}")), this);
                this._localized = false;
            }
            _caption = k;
            if (((_caption.charAt(0) == "$") && (_caption.charAt(1) == "{")))
            {
                context.registerLocalizationListener(_caption.slice(2, _caption.indexOf("}")), this);
                this._localized = true;
            }
            else
            {
                this._text = k;
                this.refresh();
            }
        }

        override public function set caption(k:String):void
        {
            this.text = k;
        }

        public function set localization(k:String):void
        {
            if (k != null)
            {
                this._text = k;
                this.refresh();
            }
        }

        public function set textStyle(k:TextStyle):void
        {
            if (k == null)
            {
                return;
            }
            if (this._textStyleName != k.name)
            {
                this._textStyleName = k.name;
                this.refresh();
            }
        }

        public function set textColor(k:uint):void
        {
            if (k != this._textColor)
            {
                this._textColor = k;
                this.refresh();
            }
        }

        override public function dispose():void
        {
            if (!_disposed)
            {
                TextStyleManager.events.removeEventListener(Event.CHANGE, this._Str_6721);
                if (this._localized)
                {
                    this._localized = false;
                    context.removeLocalizationListener(_caption.slice(2, _caption.indexOf("}")), this);
                }
                if (this._margins)
                {
                    this._margins.dispose();
                    this._margins = null;
                }
                super.dispose();
            }
        }

        private function refresh(k:Boolean=false):void
        {
            var _local_11:WindowEvent;
            if (this._refreshing)
            {
                return;
            }
            this._refreshing = true;
            var _local_2:TextField = this.textField;
            if (!_local_2)
            {
                this._refreshing = false;
                return;
            }
            this._textWidth = _local_2.textWidth;
            this._textHeight = _local_2.textHeight;
            var _local_3:int = ((_local_2.border) ? 1 : 0);
            var _local_4:int = ((this._margins) ? (this._margins.left + this._margins.right) : 0);
            var _local_5:int = ((this._margins) ? (this._margins.top + this._margins.bottom) : 0);
            var _local_6:int = (_w - _local_4);
            var _local_7:int = (_h - _local_5);
            var _local_8:int = (Math.floor(_local_2.width) + _local_3);
            var _local_9:int = (Math.floor(_local_2.height) + _local_3);
            var _local_10:Boolean;
            if (this._vertical)
            {
                if (_local_8 != _local_7)
                {
                    setRectangle(_x, _y, (_local_9 + _local_4), (Math.floor(_local_2.width) + _local_5));
                    _local_10 = true;
                }
                if (_local_9 < _local_6)
                {
                    _local_2.height = (_local_6 - _local_3);
                }
                else
                {
                    if (_local_9 > _local_6)
                    {
                        setRectangle(_x, _y, (_local_9 + _local_4), (Math.floor(_local_2.width) + _local_5));
                        _local_10 = true;
                    }
                }
            }
            else
            {
                if (_local_8 != _local_6)
                {
                    setRectangle(_x, _y, (_local_8 + _local_4), (Math.floor(_local_2.height) + _local_5));
                    _local_10 = true;
                }
                if (_local_9 < _local_7)
                {
                    _local_2.height = (_local_7 - _local_3);
                }
                else
                {
                    if (_local_9 > _local_7)
                    {
                        setRectangle(_x, _y, (_local_8 + _local_4), (Math.floor(_local_2.height) + _local_5));
                        _local_10 = true;
                    }
                }
            }
            this._refreshing = false;
            _context.invalidate(this, null, WindowRedrawFlag.REDRAW);
            if ((((!(_local_10)) && (!(k))) && (_Str_759)))
            {
                _local_11 = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_RESIZED, this, null);
                _Str_759.dispatchEvent(_local_11);
                _local_11.recycle();
            }
        }

        private function _Str_5268(k:IMargins):void
        {
            if (((k) && (!(k == this._margins))))
            {
                if (this._margins)
                {
                    this._margins.assign(k.left, k.top, k.right, k.bottom, this._Str_5268);
                }
                else
                {
                    this._margins = new TextMargins(k.left, k.top, k.right, k.bottom, this._Str_5268);
                }
            }
            this.refresh();
        }

        private function _Str_6721(k:Event):void
        {
            this.refresh();
        }

        private function _Str_18664(k:Map):void
        {
            if (this._margins)
            {
                this._margins.assign(int(k["left"]), int(k["top"]), int(k["right"]), int(k["bottom"]), this._Str_5268);
            }
            else
            {
                this._margins = new TextMargins(int(k["left"]), int(k["top"]), int(k["right"]), int(k["bottom"]), this._Str_5268);
            }
            this.refresh();
        }

        override public function get properties():Array
        {
            var k:Array = super.properties;
            var _local_2:TextStyle = TextStyleManager.getStyle(this._textStyleName);
            k.push(createProperty(PropertyKeys.TEXT_STYLE, this._textStyleName));
            var _local_3:uint = uint(((_local_2.color != null) ? _local_2.color : getDefaultProperty(PropertyKeys.TEXT_COLOR).value));
            k.push(new PropertyStruct(PropertyKeys.TEXT_COLOR, ((this._textColor == null) ? _local_3 : this._textColor), PropertyStruct.HEX, ((!(this._textColor == null)) && (!(this._textColor == _local_3)))));
            k.push(createProperty(PropertyKeys.VERTICAL, this._vertical));
            if (this._margins != null)
            {
                k.push(createProperty(PropertyKeys.MARGIN_LEFT, this._margins.left));
                k.push(createProperty(PropertyKeys.MARGIN_TOP, this._margins.top));
                k.push(createProperty(PropertyKeys.MARGIN_RIGHT, this._margins.right));
                k.push(createProperty(PropertyKeys.MARGIN_BOTTOM, this._margins.bottom));
            }
            else
            {
                k.push(getDefaultProperty(PropertyKeys.MARGIN_LEFT));
                k.push(getDefaultProperty(PropertyKeys.MARGIN_TOP));
                k.push(getDefaultProperty(PropertyKeys.MARGIN_RIGHT));
                k.push(getDefaultProperty(PropertyKeys.MARGIN_BOTTOM));
            }
            return k;
        }

        override public function set properties(k:Array):void
        {
            var _local_2:PropertyStruct;
            for each (_local_2 in k)
            {
                switch (_local_2.key)
                {
                    case PropertyKeys.TEXT_STYLE:
                        this.textStyle = TextStyleManager.getStyle((_local_2.value as String));
                        break;
                    case PropertyKeys.TEXT_COLOR:
                        this._textColor = (_local_2.value as uint);
                        break;
                    case PropertyKeys.MARGIN_LEFT:
                        if (((!(this._margins == null)) || (_local_2.valid)))
                        {
                            this.margins.left = (_local_2.value as int);
                        }
                        break;
                    case PropertyKeys.MARGIN_TOP:
                        if (((!(this._margins == null)) || (_local_2.valid)))
                        {
                            this.margins.top = (_local_2.value as int);
                        }
                        break;
                    case PropertyKeys.MARGIN_RIGHT:
                        if (((!(this._margins == null)) || (_local_2.valid)))
                        {
                            this.margins.right = (_local_2.value as int);
                        }
                        break;
                    case PropertyKeys.MARGIN_BOTTOM:
                        if (((!(this._margins == null)) || (_local_2.valid)))
                        {
                            this.margins.bottom = (_local_2.value as int);
                        }
                        break;
                    case MARGINS:
                        this._Str_18664((_local_2.value as Map));
                        break;
                    case PropertyKeys.VERTICAL:
                        this.vertical = (_local_2.value as Boolean);
                        break;
                }
            }
            super.properties = k;
        }

        public function get vertical():Boolean
        {
            return this._vertical;
        }

        public function set vertical(k:Boolean):void
        {
            this._vertical = k;
            this.refresh();
        }
    }
}
