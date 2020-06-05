package com.sulake.core.window.components
{
    import com.sulake.core.window.WindowController;
    import com.sulake.core.window.utils.ITextFieldContainer;
    import com.sulake.core.localization.ILocalizable;
    import flash.utils.Dictionary;
    import flash.text.TextField;
    import com.sulake.core.window.utils.TextMargins;
    import flash.text.TextFormat;
    import com.sulake.core.window.utils.TextStyle;
    import com.sulake.core.window.theme.PropertyKeys;
    import com.sulake.core.window.utils.TextStyleManager;
    import flash.events.Event;
    import flash.text.TextFieldAutoSize;
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window.IWindow;
    import flash.text.AntiAliasType;
    import flash.text.TextFormatAlign;
    import com.sulake.core.utils.FontEnum;
    import com.sulake.core.utils.Map;
    import flash.text.FontStyle;
    import com.sulake.core.window.utils.IMargins;
    import flash.text.Font;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.graphics.WindowRedrawFlag;
    import flash.display.DisplayObject;
    import flash.text.TextLineMetrics;
    import com.sulake.core.utils.XMLVariableParser;
    import com.sulake.core.window.utils.PropertyStruct;
    import flash.text.StyleSheet;

    public class TextController extends WindowController implements ITextWindow, ITextFieldContainer, ILocalizable 
    {
        private static const REPLACE_RANDOM_CHARS:Array = ["a", "B", "c", "D", "e"];
        protected static const _PROPERTY_SETTER_TABLE:Dictionary = createPropertySetterTable();

        private var _overFlowReplace:String = "";
        protected var _field:TextField;
        protected var _scrollH:Number;
        protected var _scrollV:Number;
        protected var _drawing:Boolean;
        protected var _margins:TextMargins;
        protected var _autoSize:String = "none";
        protected var _localized:Boolean = false;
        protected var _maxLines:int = 0;
        protected var _displayRaw:Boolean = false;
        protected var _etchingColor:uint;
        protected var _etchingPosition:String;
        protected var _defaultFormat:TextFormat;
        private var _textStyleName:String;
        private var _explicitStyle:TextStyle;
        protected var _settingRectangle:Boolean;

        public function TextController(k:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:IWindow, _arg_8:Function, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            this._explicitStyle = new TextStyle();
            this._margins = new TextMargins(0, 0, 0, 0, this.setTextMargins);
            this._drawing = false;
            this._scrollH = 0;
            this._scrollV = 0;
            if (this._field == null)
            {
                this._field = new TextField();
                if (_arg_6)
                {
                    this._field.width = _arg_6.width;
                    this._field.height = _arg_6.height;
                }
                this._field.mouseWheelEnabled = false;
            }
            this._textStyleName = String(_arg_5.getWindowFactory().getThemeManager().getPropertyDefaults(_arg_3).get(PropertyKeys.TEXT_STYLE));
            super(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
            setTextFormatting(this);
            TextStyleManager.events.addEventListener(Event.CHANGE, this.onTextStyleChanged);
            if (this._field.autoSize == TextFieldAutoSize.NONE)
            {
                this._field.width = _w;
                this._field.height = _h;
            }
        }

        private static function setAntiAliasType(k:TextController, _arg_2:String):void
        {
            _arg_2 = ((_arg_2 == AntiAliasType.ADVANCED) ? AntiAliasType.ADVANCED : AntiAliasType.NORMAL);
            k._explicitStyle.antiAliasType = _arg_2;
            k._field.antiAliasType = _arg_2;
            k.refreshTextImage();
        }

        private static function setAlwaysShowSelection(k:TextController, _arg_2:Boolean):void
        {
            k._field.alwaysShowSelection = _arg_2;
        }

        private static function setAutoSize(k:TextController, _arg_2:String):void
        {
            var _local_3:TextFormat;
            if (_arg_2 != k._autoSize)
            {
                k._autoSize = _arg_2;
                k._field.autoSize = ((_arg_2 != TextFieldAutoSize.NONE) ? TextFieldAutoSize.LEFT : TextFieldAutoSize.NONE);
                _local_3 = k.defaultTextFormat;
                switch (_arg_2)
                {
                    case TextFieldAutoSize.CENTER:
                        _local_3.align = TextFormatAlign.CENTER;
                        break;
                    case TextFieldAutoSize.RIGHT:
                        _local_3.align = TextFormatAlign.RIGHT;
                        break;
                    default:
                        _local_3.align = TextFormatAlign.LEFT;
                }
                k.setTextFormat(new TextFormat(_local_3.font, _local_3.size, _local_3.color, _local_3.bold, _local_3.italic, _local_3.underline, _local_3.url, _local_3.target, _local_3.align, _local_3.leftMargin, _local_3.rightMargin, _local_3.indent, _local_3.leading));
                k.defaultTextFormat = _local_3;
                k.refreshTextImage();
            }
        }

        private static function setTextBackground(k:TextController, _arg_2:Boolean):void
        {
            k.background = _arg_2;
        }

        private static function setTextBackgroundColor(k:TextController, _arg_2:uint):void
        {
            k.color = _arg_2;
        }

        private static function setBold(k:TextController, _arg_2:Boolean):void
        {
            var _local_3:TextFormat = k.defaultTextFormat;
            _local_3.bold = _arg_2;
            k.setTextFormat(new TextFormat(_local_3.font, _local_3.size, _local_3.color, _local_3.bold, _local_3.italic, _local_3.underline, _local_3.url, _local_3.target, _local_3.align, _local_3.leftMargin, _local_3.rightMargin, _local_3.indent, _local_3.leading));
            k.defaultTextFormat = _local_3;
            k._explicitStyle.fontWeight = TextStyle.BOLD;
        }

        private static function setBorder(k:TextController, _arg_2:Boolean):void
        {
            k._field.border = _arg_2;
            k.refreshTextImage();
        }

        private static function setBorderColor(k:TextController, _arg_2:uint):void
        {
            k._field.borderColor = _arg_2;
            k.refreshTextImage();
        }

        private static function setCondenseWhite(k:TextController, _arg_2:Boolean):void
        {
            k._field.condenseWhite = _arg_2;
            k.refreshTextImage();
        }

        private static function setDefaultTextFormat(k:TextController, _arg_2:TextFormat):void
        {
            k._field.defaultTextFormat = _arg_2;
            k.refreshTextImage();
        }

        private static function setEmbedFonts(k:TextController, _arg_2:Boolean):void
        {
            k._field.embedFonts = _arg_2;
        }

        private static function setFontFace(k:TextController, _arg_2:String):void
        {
            var _local_3:TextFormat = k.defaultTextFormat;
            _local_3.font = _arg_2;
            k.setTextFormat(new TextFormat(_local_3.font, _local_3.size, _local_3.color, _local_3.bold, _local_3.italic, _local_3.underline, _local_3.url, _local_3.target, _local_3.align, _local_3.leftMargin, _local_3.rightMargin, _local_3.indent, _local_3.leading));
            k._field.embedFonts = FontEnum.isEmbeddedFont(_arg_2);
            k.defaultTextFormat = _local_3;
            k._explicitStyle.fontFamily = _arg_2;
        }

        private static function setFontSize(k:TextController, _arg_2:uint):void
        {
            var _local_3:TextFormat = k.defaultTextFormat;
            _local_3.size = _arg_2;
            k.setTextFormat(new TextFormat(_local_3.font, _local_3.size, _local_3.color, _local_3.bold, _local_3.italic, _local_3.underline, _local_3.url, _local_3.target, _local_3.align, _local_3.leftMargin, _local_3.rightMargin, _local_3.indent, _local_3.leading));
            k.defaultTextFormat = _local_3;
            k._explicitStyle.fontSize = _arg_2;
        }

        private static function setGridFitType(k:TextController, _arg_2:String):void
        {
            k._field.gridFitType = _arg_2;
            k.refreshTextImage();
        }

        private static function setHtmlText(k:TextController, _arg_2:String):void
        {
            if (_arg_2 == null)
            {
                return;
            }
            if (k._localized)
            {
                k.context.removeLocalizationListener(k._caption.slice(2, k._caption.indexOf("}")), k);
                k._localized = false;
            }
            k._caption = _arg_2;
            if (((k._caption.charAt(0) == "$") && (k._caption.charAt(1) == "{")))
            {
                k.context.registerLocalizationListener(k._caption.slice(2, k._caption.indexOf("}")), k);
                k._localized = true;
            }
            else
            {
                if (k._field != null)
                {
                    k._field.htmlText = k._caption;
                    k.refreshTextImage();
                }
            }
        }

        private static function setItalic(k:TextController, _arg_2:Boolean):void
        {
            var _local_3:TextFormat = k.defaultTextFormat;
            _local_3.italic = _arg_2;
            k.setTextFormat(new TextFormat(_local_3.font, _local_3.size, _local_3.color, _local_3.bold, _local_3.italic, _local_3.underline, _local_3.url, _local_3.target, _local_3.align, _local_3.leftMargin, _local_3.rightMargin, _local_3.indent, _local_3.leading));
            k.defaultTextFormat = _local_3;
            k._explicitStyle.fontStyle = ((_arg_2) ? TextStyle.ITALIC : TextStyle.NORMAL);
        }

        private static function setKerning(k:TextController, _arg_2:Boolean):void
        {
            var _local_3:TextFormat = k.defaultTextFormat;
            _local_3.kerning = _arg_2;
            var _local_4:TextFormat = new TextFormat(_local_3.font, _local_3.size, _local_3.color, _local_3.bold, _local_3.italic, _local_3.underline, _local_3.url, _local_3.target, _local_3.align, _local_3.leftMargin, _local_3.rightMargin, _local_3.indent, _local_3.leading);
            _local_4.kerning = _arg_2;
            k.setTextFormat(_local_4);
            k.defaultTextFormat = _local_3;
            k._explicitStyle.kerning = _arg_2;
        }

        private static function setTextMarginMap(k:TextController, _arg_2:Map):void
        {
            if (k._margins)
            {
                k._margins.assign(int(_arg_2["left"]), int(_arg_2["top"]), int(_arg_2["right"]), int(_arg_2["bottom"]), k.setTextMargins);
            }
            else
            {
                k._margins = new TextMargins(int(_arg_2["left"]), int(_arg_2["top"]), int(_arg_2["right"]), int(_arg_2["bottom"]), k.setTextMargins);
            }
            k.refreshTextImage();
        }

        private static function setMarginLeft(k:TextController, _arg_2:int):void
        {
            if (((k._margins) && (!(k._margins.left == _arg_2))))
            {
                k.margins.left = _arg_2;
            }
        }

        private static function setMarginTop(k:TextController, _arg_2:int):void
        {
            if (((k._margins) && (!(k._margins.top == _arg_2))))
            {
                k.margins.top = _arg_2;
            }
        }

        private static function setMarginRight(k:TextController, _arg_2:int):void
        {
            if (((k._margins) && (!(k._margins.right == _arg_2))))
            {
                k.margins.right = _arg_2;
            }
        }

        private static function setMarginBottom(k:TextController, _arg_2:int):void
        {
            if (((k._margins) && (!(k._margins.bottom == _arg_2))))
            {
                k.margins.bottom = _arg_2;
            }
        }

        private static function setMaxChars(k:TextController, _arg_2:int):void
        {
            k._field.maxChars = _arg_2;
            k.refreshTextImage();
        }

        private static function setMouseWheelEnabled(k:TextController, _arg_2:Boolean):void
        {
            k._field.mouseWheelEnabled = _arg_2;
        }

        private static function setMultiline(k:TextController, _arg_2:Boolean):void
        {
            k._field.multiline = _arg_2;
            k.refreshTextImage();
        }

        private static function setRestrict(k:TextController, _arg_2:String):void
        {
            k._field.restrict = _arg_2;
        }

        private static function setSharpness(k:TextController, _arg_2:Number):void
        {
            k._field.sharpness = _arg_2;
            k.refreshTextImage();
            k._explicitStyle.sharpness = _arg_2;
        }

        private static function setSpacing(k:TextController, _arg_2:Number):void
        {
            var _local_3:TextFormat = k.defaultTextFormat;
            _local_3.letterSpacing = _arg_2;
            var _local_4:TextFormat = new TextFormat(_local_3.font, _local_3.size, _local_3.color, _local_3.bold, _local_3.italic, _local_3.underline, _local_3.url, _local_3.target, _local_3.align, _local_3.leftMargin, _local_3.rightMargin, _local_3.indent, _local_3.leading);
            _local_4.letterSpacing = _arg_2;
            k.setTextFormat(_local_4);
            k.defaultTextFormat = _local_3;
            k._explicitStyle.letterSpacing = _arg_2;
        }

        private static function setMaxLines(k:TextController, _arg_2:int):void
        {
            k._maxLines = _arg_2;
            k.refreshTextImage();
        }

        private static function setLeading(k:TextController, _arg_2:Number):void
        {
            var _local_3:TextFormat = k.defaultTextFormat;
            _local_3.leading = _arg_2;
            var _local_4:TextFormat = new TextFormat(_local_3.font, _local_3.size, _local_3.color, _local_3.bold, _local_3.italic, _local_3.underline, _local_3.url, _local_3.target, _local_3.align, _local_3.leftMargin, _local_3.rightMargin, _local_3.indent, _local_3.leading);
            _local_4.leading = _arg_2;
            k.setTextFormat(_local_4);
            k.defaultTextFormat = _local_3;
            k._explicitStyle.leading = _arg_2;
        }

        private static function setTextColor(k:TextController, _arg_2:uint):void
        {
            k._field.textColor = _arg_2;
            k.refreshTextImage();
            k._explicitStyle.color = _arg_2;
        }

        private static function setTextStyle(k:TextController, _arg_2:TextStyle):void
        {
            if (((!(k)) || (!(_arg_2))))
            {
                return;
            }
            var _local_3:TextStyle = TextStyleManager.getStyle(_arg_2.name);
            if (((_local_3) && (!(_local_3.equals(_arg_2)))))
            {
                _local_3 = TextStyleManager.findMatchingTextStyle(_arg_2.toString());
            }
            if (_local_3)
            {
                k._textStyleName = _local_3.name;
                setTextFormatting(k);
                k.refreshTextImage();
            }
        }

        private static function setTextStyleString(k:TextController, _arg_2:String):void
        {
            var _local_4:TextFormat;
            var _local_3:TextStyle = TextStyleManager.getStyle(_arg_2);
            if (!_local_3)
            {
                _local_3 = TextStyleManager.findMatchingTextStyle(_arg_2);
            }
            if (_local_3)
            {
                k._textStyleName = _local_3.name;
                setTextFormatting(k);
                k.refreshTextImage();
            }
            else
            {
                _local_3 = TextStyleManager.parseCSS(_arg_2)[0];
                if (_local_3)
                {
                    if (!TextStyleManager.getStyle(_local_3.name))
                    {
                        TextStyleManager.setStyle(_local_3.name, _local_3);
                    }
                    setTextStyle(k, _local_3);
                }
            }
            if (k._autoSize == TextFieldAutoSize.CENTER)
            {
                _local_4 = new TextFormat();
                _local_4.align = TextFormatAlign.CENTER;
                k._field.setTextFormat(_local_4);
            }
        }

        private static function setThickness(k:TextController, _arg_2:Number):void
        {
            k._field.thickness = _arg_2;
            k.refreshTextImage();
            k._explicitStyle.thickness = _arg_2;
        }

        private static function setUnderline(k:TextController, _arg_2:Boolean):void
        {
            var _local_3:TextFormat = k.defaultTextFormat;
            _local_3.underline = _arg_2;
            k.setTextFormat(new TextFormat(_local_3.font, _local_3.size, _local_3.color, _local_3.bold, _local_3.italic, _local_3.underline, _local_3.url, _local_3.target, _local_3.align, _local_3.leftMargin, _local_3.rightMargin, _local_3.indent, _local_3.leading));
            k.defaultTextFormat = _local_3;
            k._explicitStyle.textDecoration = ((_arg_2) ? TextStyle.UNDERLINE : TextStyle.NONE);
        }

        private static function setWordWrap(k:TextController, _arg_2:Boolean):void
        {
            k._field.wordWrap = _arg_2;
            k.refreshTextImage();
        }

        private static function setOverflowReplace(k:TextController, _arg_2:String):void
        {
            k._overFlowReplace = _arg_2;
            k.refreshTextImage();
        }

        protected static function setTextFormatting(k:TextController):void
        {
            var _local_2:TextField = k._field;
            var _local_3:String = k._textStyleName;
            var _local_4:TextStyle = k._explicitStyle;
            var _local_5:TextStyle = TextStyleManager.getStyle(_local_3);
            var _local_6:TextFormat = _local_2.defaultTextFormat;
            if (!_local_5)
            {
                _local_5 = TextStyleManager.getStyle(TextStyleManager.REGULAR);
            }
            if (!_local_5.color)
            {
                _local_5.color = 0;
            }
            if (!_local_4.fontFamily)
            {
                _local_6.font = _local_5.fontFamily;
            }
            if (!_local_4.fontSize)
            {
                _local_6.size = _local_5.fontSize;
            }
            if (!_local_4.color)
            {
                _local_6.color = _local_5.color;
            }
            if (!_local_4.fontWeight)
            {
                _local_6.bold = ((_local_5.fontWeight == FontStyle.BOLD) ? true : null);
            }
            if (!_local_4.fontStyle)
            {
                _local_6.italic = ((_local_5.fontStyle == FontStyle.ITALIC) ? true : null);
            }
            if (!_local_4.textDecoration)
            {
                _local_6.underline = ((_local_5.textDecoration == TextStyle.UNDERLINE) ? true : null);
            }
            if (!_local_4.textIndent)
            {
                _local_6.indent = _local_5.textIndent;
            }
            if (!_local_4.leading)
            {
                _local_6.leading = _local_5.leading;
            }
            if (!_local_4.kerning)
            {
                _local_6.kerning = _local_5.kerning;
            }
            if (!_local_4.letterSpacing)
            {
                _local_6.letterSpacing = _local_5.letterSpacing;
            }
            if (!_local_4.antiAliasType)
            {
                _local_2.antiAliasType = ((_local_5.antiAliasType == AntiAliasType.ADVANCED) ? AntiAliasType.ADVANCED : AntiAliasType.NORMAL);
            }
            if (!_local_4.sharpness)
            {
                _local_2.sharpness = int(_local_5.sharpness);
            }
            if (!_local_4.thickness)
            {
                _local_2.thickness = int(_local_5.thickness);
            }
            if (_local_4.etchingColor == null)
            {
                k.etchingColor = uint(_local_5.etchingColor);
            }
            if (_local_4.etchingPosition == null)
            {
                k.etchingPosition = String(_local_5.etchingPosition);
            }
            if (((!(_local_5.fontWeight)) && (!(_local_4.fontWeight))))
            {
                _local_6.bold = false;
            }
            if (((!(_local_5.fontStyle)) && (!(_local_4.fontStyle))))
            {
                _local_6.italic = false;
            }
            if (((!(_local_5.textDecoration)) && (!(_local_4.textDecoration))))
            {
                _local_6.underline = false;
            }
            if (((!(_local_5.textIndent)) && (!(_local_4.textIndent))))
            {
                _local_6.indent = 0;
            }
            if (((!(_local_5.leading)) && (!(_local_4.leading))))
            {
                _local_6.leading = 0;
            }
            if (((!(_local_5.kerning)) && (!(_local_4.kerning))))
            {
                _local_6.kerning = false;
            }
            if (((!(_local_5.letterSpacing)) && (!(_local_4.letterSpacing))))
            {
                _local_6.letterSpacing = 0;
            }
            if (((!(_local_5.antiAliasType)) && (!(_local_4.antiAliasType))))
            {
                _local_2.antiAliasType = AntiAliasType.NORMAL;
            }
            if (((!(_local_5.sharpness)) && (!(_local_4.sharpness))))
            {
                _local_2.sharpness = 0;
            }
            if (((!(_local_5.thickness)) && (!(_local_4.thickness))))
            {
                _local_2.thickness = 0;
            }
            if (((_local_5.etchingColor == null) && (_local_4.etchingColor == null)))
            {
                k.etchingColor = 0;
            }
            if (((_local_5.etchingPosition == null) && (_local_4.etchingPosition == null)))
            {
                k.etchingPosition = TextStyle.BOTTOM;
            }
            _local_2.setTextFormat(_local_6);
            _local_2.embedFonts = FontEnum.isEmbeddedFont(_local_6.font);
            _local_2.defaultTextFormat = _local_6;
            k._defaultFormat = _local_6;
        }

        protected static function createPropertySetterTable():Dictionary
        {
            var k:Dictionary = new Dictionary();
            k[PropertyKeys.ALWAYS_SHOW_SELECTION] = setAlwaysShowSelection;
            k["background"] = setTextBackground;
            k["background_color"] = setTextBackgroundColor;
            k[PropertyKeys.BOLD] = setBold;
            k[PropertyKeys.BORDER] = setBorder;
            k[PropertyKeys.BORDER_COLOR] = setBorderColor;
            k[PropertyKeys.CONDENSE_WHITE] = setCondenseWhite;
            k["default_text_format"] = setDefaultTextFormat;
            k[PropertyKeys.ETCHING_COLOR] = setEtchingColor;
            k[PropertyKeys.ETCHING_POSITION] = setEtchingPosition;
            k[PropertyKeys.FONT_FACE] = setFontFace;
            k[PropertyKeys.FONT_SIZE] = setFontSize;
            k[PropertyKeys.GRID_FIT_TYPE] = setGridFitType;
            k[PropertyKeys.ITALIC] = setItalic;
            k[PropertyKeys.KERNING] = setKerning;
            k[PropertyKeys.MAX_CHARS] = setMaxChars;
            k[PropertyKeys.MULTILINE] = setMultiline;
            k[PropertyKeys.RESTRICT] = setRestrict;
            k[PropertyKeys.SPACING] = setSpacing;
            k[PropertyKeys.SHARPNESS] = setSharpness;
            k[PropertyKeys.THICKNESS] = setThickness;
            k[PropertyKeys.UNDERLINE] = setUnderline;
            k[PropertyKeys.WORD_WRAP] = setWordWrap;
            k["margins"] = setTextMarginMap;
            k[PropertyKeys.MAX_LINES] = setMaxLines;
            k[PropertyKeys.LEADING] = setLeading;
            k[PropertyKeys.ANTIALIAS_TYPE] = setAntiAliasType;
            k[PropertyKeys.AUTO_SIZE] = setAutoSize;
            k[PropertyKeys.MOUSE_WHEEL_ENABLED] = setMouseWheelEnabled;
            k[PropertyKeys.TEXT_COLOR] = setTextColor;
            k[PropertyKeys.TEXT_STYLE] = setTextStyleString;
            k[PropertyKeys.MARGIN_LEFT] = setMarginLeft;
            k[PropertyKeys.MARGIN_TOP] = setMarginTop;
            k[PropertyKeys.MARGIN_RIGHT] = setMarginRight;
            k[PropertyKeys.MARGIN_BOTTOM] = setMarginBottom;
            k[PropertyKeys.OVERFLOW_REPLACE] = setOverflowReplace;
            return k;
        }

        private static function setEtchingColor(k:TextController, _arg_2:uint):void
        {
            k._etchingColor = _arg_2;
            k.refreshTextImage();
            k._explicitStyle.etchingColor = k._etchingColor;
        }

        private static function setEtchingPosition(k:TextController, _arg_2:String):void
        {
            k._etchingPosition = _arg_2;
            k.refreshTextImage();
            k._explicitStyle.etchingPosition = k._etchingPosition;
        }


        public function get antiAliasType():String
        {
            return this._field.antiAliasType;
        }

        public function get autoSize():String
        {
            return this._autoSize;
        }

        public function get bold():Boolean
        {
            return this._field.defaultTextFormat.bold;
        }

        public function get border():Boolean
        {
            return this._field.border;
        }

        public function get borderColor():uint
        {
            return this._field.borderColor;
        }

        public function get bottomScrollV():int
        {
            return this._field.bottomScrollV;
        }

        public function get defaultTextFormat():TextFormat
        {
            return this._field.defaultTextFormat;
        }

        public function get embedFonts():Boolean
        {
            return this._field.embedFonts;
        }

        public function get fontFace():String
        {
            return this._field.defaultTextFormat.font;
        }

        public function get fontSize():uint
        {
            return (this._field.defaultTextFormat.size == null) ? 12 : uint(this._field.defaultTextFormat.size);
        }

        public function get gridFitType():String
        {
            return this._field.gridFitType;
        }

        public function get htmlText():String
        {
            return this._field.htmlText;
        }

        public function get italic():Boolean
        {
            return this._field.defaultTextFormat.italic;
        }

        public function get kerning():Boolean
        {
            return this._field.defaultTextFormat.kerning;
        }

        public function get length():int
        {
            return this._field.length;
        }

        public function get margins():IMargins
        {
            return this._margins;
        }

        public function get maxChars():int
        {
            return this._field.maxChars;
        }

        public function get multiline():Boolean
        {
            return this._field.multiline;
        }

        public function get numLines():int
        {
            return this._field.numLines;
        }

        public function get restrict():String
        {
            return this._field.restrict;
        }

        public function get sharpness():Number
        {
            return this._field.sharpness;
        }

        public function get spacing():Number
        {
            return Number(this._field.defaultTextFormat.letterSpacing);
        }

        public function get text():String
        {
            return (this._field != null) ? this._field.text : "";
        }

        public function get textColor():uint
        {
            return this._field.textColor;
        }

        public function get textBackground():Boolean
        {
            return background;
        }

        public function get textBackgroundColor():uint
        {
            return color;
        }

        public function get textHeight():Number
        {
            return this._field.textHeight;
        }

        public function get textWidth():Number
        {
            return this._field.textWidth;
        }

        public function get textStyle():TextStyle
        {
            return TextStyleManager.getStyle(this._textStyleName);
        }

        public function get thickness():Number
        {
            return this._field.thickness;
        }

        public function get underline():Boolean
        {
            return this._field.defaultTextFormat.underline;
        }

        public function get wordWrap():Boolean
        {
            return this._field.wordWrap;
        }

        public function get textField():TextField
        {
            return this._field;
        }

        public function get maxLines():int
        {
            return this._maxLines;
        }

        public function get leading():Number
        {
            return Number(this._field.defaultTextFormat.leading);
        }

        public function get isOverflowReplaceOn():Boolean
        {
            return !(this._overFlowReplace == "");
        }

        public function get overflowReplace():String
        {
            return this._overFlowReplace;
        }

        public function get scrollH():Number
        {
            return this._scrollH;
        }

        public function get scrollV():Number
        {
            return this._scrollV;
        }

        public function get maxScrollH():int
        {
            return this._field.maxScrollH;
        }

        public function get maxScrollV():int
        {
            return Math.max((this._field.textHeight - height), 0);
        }

        public function set antiAliasType(k:String):void
        {
            setAntiAliasType(this, k);
        }

        public function set autoSize(k:String):void
        {
            setAutoSize(this, k);
        }

        public function set bold(k:Boolean):void
        {
            setBold(this, k);
        }

        public function set border(k:Boolean):void
        {
            setBorder(this, k);
        }

        public function set borderColor(k:uint):void
        {
            setBorderColor(this, k);
        }

        public function set defaultTextFormat(k:TextFormat):void
        {
            setDefaultTextFormat(this, k);
        }

        public function set embedFonts(k:Boolean):void
        {
            setEmbedFonts(this, k);
        }

        public function set fontFace(k:String):void
        {
            setFontFace(this, k);
        }

        public function set fontSize(k:uint):void
        {
            setFontSize(this, k);
        }

        public function set gridFitType(k:String):void
        {
            setGridFitType(this, k);
        }

        public function set htmlText(k:String):void
        {
            setHtmlText(this, k);
        }

        public function set italic(k:Boolean):void
        {
            setItalic(this, k);
        }

        public function set kerning(k:Boolean):void
        {
            setKerning(this, k);
        }

        public function set maxChars(k:int):void
        {
            setMaxChars(this, k);
        }

        public function set multiline(k:Boolean):void
        {
            setMultiline(this, k);
        }

        public function set restrict(k:String):void
        {
            setRestrict(this, k);
        }

        public function set sharpness(k:Number):void
        {
            setSharpness(this, k);
        }

        public function set spacing(k:Number):void
        {
            setSpacing(this, k);
        }

        public function set textColor(k:uint):void
        {
            setTextColor(this, k);
        }

        public function set textBackground(k:Boolean):void
        {
            setTextBackground(this, k);
        }

        public function set textBackgroundColor(k:uint):void
        {
            setTextBackgroundColor(this, k);
        }

        public function set textStyle(k:TextStyle):void
        {
            setTextStyle(this, k);
        }

        public function set thickness(k:Number):void
        {
            setThickness(this, k);
        }

        public function set underline(k:Boolean):void
        {
            setUnderline(this, k);
        }

        public function set wordWrap(k:Boolean):void
        {
            setWordWrap(this, k);
        }

        public function set maxLines(k:int):void
        {
            setMaxLines(this, k);
        }

        public function set leading(k:Number):void
        {
            setLeading(this, k);
        }

        public function set overflowReplace(k:String):void
        {
            setOverflowReplace(this, k);
        }

        protected function limitStringLength(k:String):String
        {
            return (this.maxChars > 0) ? k.substr(0, this.maxChars) : k;
        }

        override public function setRectangle(k:int, _arg_2:int, _arg_3:int, _arg_4:int):void
        {
            if ((((this._settingRectangle) || (!(this.multiline))) || (!(this.wordWrap))))
            {
                super.setRectangle(k, _arg_2, _arg_3, _arg_4);
                return;
            }
            this._settingRectangle = true;
            var _local_5:String = this.autoSize;
            this.autoSize = TextFieldAutoSize.NONE;
            super.setRectangle(k, _arg_2, _arg_3, _arg_4);
            this.autoSize = _local_5;
            this._settingRectangle = false;
        }

        public function set scrollH(k:Number):void
        {
            this._scrollH = k;
            this._field.scrollH = (this._scrollH * Number(this._field.maxScrollH));
            this.refreshTextImage();
        }

        public function set scrollV(k:Number):void
        {
            if (k > this._scrollV)
            {
                this._scrollV = k;
                this._field.scrollV = Math.max(this._field.scrollV, ((k * this._field.maxScrollV) + 1));
                this.refreshTextImage();
            }
            else
            {
                if (k < this._scrollV)
                {
                    this._scrollV = k;
                    this._field.scrollV = Math.min(this._field.scrollV, ((k * this._field.maxScrollV) - 1));
                    this.refreshTextImage();
                }
            }
        }

        public function get visibleRegion():Rectangle
        {
            return new Rectangle((this._scrollH * this.maxScrollH), (this._scrollV * this.maxScrollV), width, height);
        }

        public function get scrollableRegion():Rectangle
        {
            return new Rectangle(0, 0, (this.maxScrollH + width), (this.maxScrollV + height));
        }

        public function get scrollStepH():Number
        {
            return 10;
        }

        public function get scrollStepV():Number
        {
            return this._field.textHeight / this._field.numLines;
        }

        public function set scrollStepH(k:Number):void
        {
        }

        public function set scrollStepV(k:Number):void
        {
        }

        private function replaceNonRenderableCharacters(k:String):String
        {
            var _local_4:Font;
            var _local_5:Font;
            var _local_6:String;
            var _local_7:int;
            var _local_8:String;
            var _local_2:TextFormat = this._field.getTextFormat();
            if (((!(_local_2)) || (!(_local_2.font))))
            {
                return k;
            }
            var _local_3:Array = Font.enumerateFonts();
            for each (_local_5 in _local_3)
            {
                if (_local_5.fontName.toLowerCase() == _local_2.font.toLowerCase())
                {
                    _local_4 = _local_5;
                }
            }
            if (_local_4 == null)
            {
                return k;
            }
            if (_local_4.hasGlyphs(k))
            {
                return k;
            }
            _local_6 = "";
            _local_7 = 0;
            while (_local_7 < k.length)
            {
                _local_8 = k.charAt(_local_7);
                if ((((!(_local_4.hasGlyphs(_local_8))) && (!(_local_8 == "\r"))) && (!(_local_8 == "\n"))))
                {
                    _local_6 = (_local_6 + REPLACE_RANDOM_CHARS[Math.floor((Math.random() * REPLACE_RANDOM_CHARS.length))]);
                }
                else
                {
                    _local_6 = (_local_6 + _local_8);
                }
                _local_7++;
            }
            return _local_6;
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
            if ((((!(this._displayRaw)) && (_caption.charAt(0) == "$")) && (_caption.charAt(1) == "{")))
            {
                this._localized = true;
                context.registerLocalizationListener(_caption.slice(2, _caption.indexOf("}")), this);
            }
            else
            {
                if (this._field != null)
                {
                    this._field.text = this.replaceNonRenderableCharacters(_caption);
                    this.refreshTextImage();
                }
            }
        }

        override public function set caption(k:String):void
        {
            this.text = k;
        }

        override public function set color(k:uint):void
        {
            super.color = k;
            this._field.backgroundColor = k;
        }

        override public function set background(k:Boolean):void
        {
            super.background = k;
            this._field.background = k;
        }

        public function set localization(k:String):void
        {
            if (((!(k == null)) && (!(this._field == null))))
            {
                this._field.text = this.limitStringLength(k);
                this.refreshTextImage();
            }
        }

        override public function clone():IWindow
        {
            var k:TextController = (super.clone() as TextController);
            k._field.backgroundColor = color;
            k._field.background = background;
            k._scrollH = this._scrollH;
            k._scrollV = this._scrollV;
            k._margins = this._margins.clone(k.setTextMargins);
            k._autoSize = this._autoSize;
            k._localized = this._localized;
            return k;
        }

        override public function dispose():void
        {
            immediateClickMode = false;
            TextStyleManager.events.removeEventListener(Event.CHANGE, this.onTextStyleChanged);
            if (this._localized)
            {
                context.removeLocalizationListener(_caption.slice(2, _caption.indexOf("}")), this);
            }
            if (this._margins != null)
            {
                this._margins.dispose();
                this._margins = null;
            }
            this._field = null;
            super.dispose();
        }

        override public function update(k:WindowController, _arg_2:WindowEvent):Boolean
        {
            if (!this._drawing)
            {
                if (_arg_2.type == WindowEvent.WINDOW_EVENT_RESIZED)
                {
                    this.refreshTextImage(true);
                }
            }
            return super.update(k, _arg_2);
        }

        protected function refreshTextImage(k:Boolean=false):void
        {
            var _local_8:int;
            var _local_9:String;
            var _local_10:String;
            var _local_11:int;
            var _local_12:int;
            var _local_13:int;
            var _local_14:int;
            var _local_15:TextFormat;
            var _local_16:int;
            var _local_17:WindowEvent;
            if (this._drawing)
            {
                return;
            }
            this._drawing = true;
            var _local_2:int = (this._margins.left + this._margins.right);
            var _local_3:int = (this._margins.top + this._margins.bottom);
            var _local_4:int = (_w - _local_2);
            var _local_5:int = (_h - _local_3);
            var _local_6:int = (Math.floor(this._field.width) + ((this._field.border) ? 1 : 0));
            var _local_7:Boolean;
            if (((this._autoSize == TextFieldAutoSize.NONE) && (this.isOverflowReplaceOn)))
            {
                _local_9 = this._field.text;
                if ((this._field.textHeight + _local_3) > _local_5)
                {
                    _local_11 = (this._field.numLines - 1);
                    while (((this._field.getCharBoundaries(this._field.getLineOffset(_local_11)) == null) || (this._field.getCharBoundaries(this._field.getLineOffset(_local_11)).bottom > _local_5)))
                    {
                        _local_11--;
                    }
                    _local_12 = this._field.getLineOffset(_local_11);
                    _local_13 = (_local_12 + this._field.getLineLength(_local_11));
                    _local_8 = _local_13;
                    while ((((this._field.textHeight + _local_3) > _local_5) && (_local_8 > 0)))
                    {
                        this._field.text = (_local_9.slice(0, --_local_8) + this.overflowReplace);
                    }
                }
                _local_10 = this._field.text;
                if ((this._field.textWidth + _local_2) > _local_4)
                {
                    _local_14 = (this._field.text.length - 1);
                    while (((this._field.getCharBoundaries(_local_14) == null) || (this._field.getCharBoundaries(_local_14).right > _local_4)))
                    {
                        _local_14--;
                    }
                    _local_15 = this.getTextFormat(0, _local_14);
                    _local_8 = _local_14;
                    _local_16 = (((_local_2 + _local_15.indent) + _local_15.leftMargin) + _local_15.rightMargin);
                    while (((((this._field.textWidth + _local_16) + 2) > _local_4) && (_local_8 > 0)))
                    {
                        this._field.text = (_local_10.slice(0, --_local_8) + this.overflowReplace);
                    }
                }
                _local_6 = (Math.floor(this._field.width) + ((this._field.border) ? 1 : 0));
            }
            if (_local_6 != _local_4)
            {
                if (this._autoSize == TextFieldAutoSize.LEFT)
                {
                    this.setRectangle(_x, _y, (_local_6 + _local_2), (Math.floor(this._field.height) + _local_3));
                    _local_7 = true;
                }
                else
                {
                    if (this._autoSize != TextFieldAutoSize.RIGHT)
                    {
                        if (this._autoSize != TextFieldAutoSize.CENTER)
                        {
                            this._field.width = (_local_4 - ((this._field.border) ? 1 : 0));
                            this._field.height = (_local_5 - ((this._field.border) ? 1 : 0));
                        }
                    }
                }
            }
            if ((this._field.height + ((this._field.border) ? 1 : 0)) < _local_5)
            {
                if (this._autoSize == TextFieldAutoSize.NONE)
                {
                    this._field.height = (_local_5 - ((this._field.border) ? 1 : 0));
                }
                else
                {
                    height = (Math.floor(this._field.height) + _local_3);
                    _local_7 = true;
                }
            }
            else
            {
                if ((this._field.height + ((this._field.border) ? 1 : 0)) > _local_5)
                {
                    if (this._autoSize != TextFieldAutoSize.NONE)
                    {
                        height = (Math.floor(this._field.height) + _local_3);
                        _local_7 = true;
                    }
                }
            }
            this._drawing = false;
            _context.invalidate(this, null, WindowRedrawFlag.REDRAW);
            if ((((!(_local_7)) && (!(k))) && (_events)))
            {
                _local_17 = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_RESIZED, this, null);
                _events.dispatchEvent(_local_17);
                _local_17.recycle();
            }
        }

        public function appendText(k:String):void
        {
            this._field.appendText(k);
            this.refreshTextImage();
        }

        public function getCharBoundaries(k:int):Rectangle
        {
            return this._field.getCharBoundaries(k);
        }

        public function getCharIndexAtPoint(k:Number, _arg_2:Number):int
        {
            return this._field.getCharIndexAtPoint(k, _arg_2);
        }

        public function getFirstCharInParagraph(k:int):int
        {
            return this._field.getFirstCharInParagraph(k);
        }

        public function getImageReference(k:String):DisplayObject
        {
            return this._field.getImageReference(k);
        }

        public function getLineIndexAtPoint(k:Number, _arg_2:Number):int
        {
            return this._field.getLineIndexAtPoint(k, _arg_2);
        }

        public function getLineIndexOfChar(k:int):int
        {
            return this._field.getLineIndexOfChar(k);
        }

        public function getLineLength(k:int):int
        {
            return this._field.getLineLength(k);
        }

        public function getLineMetrics(k:int):TextLineMetrics
        {
            return this._field.getLineMetrics(k);
        }

        public function getLineOffset(k:int):int
        {
            return this._field.getLineOffset(k);
        }

        public function getLineText(k:int):String
        {
            return this._field.getLineText(k);
        }

        public function getParagraphLength(k:int):int
        {
            return this._field.getParagraphLength(k);
        }

        public function getTextFormat(k:int=-1, _arg_2:int=-1):TextFormat
        {
            return this._field.getTextFormat(k, _arg_2);
        }

        public function replaceText(k:int, _arg_2:int, _arg_3:String):void
        {
            this._field.replaceText(k, _arg_2, _arg_3);
            this.refreshTextImage();
        }

        public function setTextFormat(k:TextFormat, _arg_2:int=-1, _arg_3:int=-1):void
        {
            if ((((_arg_2 >= 0) && (_arg_3 > _arg_2)) && (_arg_3 < this._field.length)))
            {
                this._field.setTextFormat(k, _arg_2, _arg_3);
                this.refreshTextImage();
            }
        }

        public function setTextMargins(k:IMargins):void
        {
            if (k != this._margins)
            {
                this._margins.dispose();
                this._margins = new TextMargins(k.left, k.top, k.right, k.bottom, this.setTextMargins);
            }
            if (this._autoSize == TextFieldAutoSize.LEFT)
            {
                this._field.width = ((_w - this._margins.left) - this._margins.right);
            }
            this.refreshTextImage();
        }

        private function onTextStyleChanged(k:Event):void
        {
            setTextFormatting(this);
            this.refreshTextImage();
        }

        protected function parseVariableSet(k:XML):void
        {
            var _local_2:String;
            var _local_3:Function;
            var _local_4:Map;
            if (k != null)
            {
                _local_4 = new Map();
                XMLVariableParser.parseVariableList(k.children(), _local_4);
                this._drawing = true;
                for (_local_2 in _local_4)
                {
                    _local_3 = _PROPERTY_SETTER_TABLE[_local_2];
                    if (_local_3 != null)
                    {
                        (_local_3(this, _local_4[_local_2]));
                    }
                }
                this._drawing = false;
            }
        }

        override public function set properties(k:Array):void
        {
            var _local_2:Function;
            var _local_3:PropertyStruct;
            this._drawing = true;
            for each (_local_3 in k)
            {
                _local_2 = _PROPERTY_SETTER_TABLE[_local_3.key];
                if (_local_2 != null)
                {
                    (_local_2(this, _local_3.value));
                }
            }
            this._drawing = false;
            super.properties = k;
            this.refreshTextImage();
        }

        override public function get properties():Array
        {
            var k:Array = super.properties;
            var _local_2:TextStyle = TextStyleManager.getStyle(this._textStyleName);
            k.push(createProperty(PropertyKeys.ALWAYS_SHOW_SELECTION, this._field.alwaysShowSelection));
            k.push(new PropertyStruct(PropertyKeys.ANTIALIAS_TYPE, this._field.antiAliasType, PropertyStruct.STRING, (!(this._field.antiAliasType == _local_2.antiAliasType)), PropertyKeys.ANTIALIAS_TYPE_RANGE));
            k.push(createProperty(PropertyKeys.AUTO_SIZE, this._autoSize));
            k.push(createProperty(PropertyKeys.BORDER, this._field.border));
            k.push(createProperty(PropertyKeys.BORDER_COLOR, this._field.borderColor));
            k.push(new PropertyStruct(PropertyKeys.ETCHING_COLOR, this._etchingColor, PropertyStruct.HEX, (!(this._etchingColor == uint(_local_2.etchingColor)))));
            k.push(new PropertyStruct(PropertyKeys.ETCHING_POSITION, this._etchingPosition, PropertyStruct.STRING, (!(this._etchingPosition == String(_local_2.etchingPosition))), PropertyKeys.ETCHING_POSITION_RANGE));
            k.push(createProperty(PropertyKeys.CONDENSE_WHITE, this._field.condenseWhite));
            k.push(new PropertyStruct(PropertyKeys.FONT_FACE, this.defaultTextFormat.font, PropertyStruct.STRING, (!(this.defaultTextFormat.font == _local_2.fontFamily))));
            k.push(new PropertyStruct(PropertyKeys.FONT_SIZE, this.defaultTextFormat.size, PropertyStruct.UINT, (!(this.defaultTextFormat.size == _local_2.fontSize))));
            k.push(createProperty(PropertyKeys.GRID_FIT_TYPE, this._field.gridFitType));
            var _local_3:uint = uint(((_local_2.color != null) ? _local_2.color : getDefaultProperty(PropertyKeys.TEXT_COLOR).value));
            k.push(new PropertyStruct(PropertyKeys.TEXT_COLOR, this._field.textColor, PropertyStruct.HEX, (!(this._field.textColor == _local_3))));
            k.push(createProperty(PropertyKeys.TEXT_STYLE, this._textStyleName));
            k.push(createProperty(PropertyKeys.MARGIN_LEFT, this._margins.left));
            k.push(createProperty(PropertyKeys.MARGIN_TOP, this._margins.top));
            k.push(createProperty(PropertyKeys.MARGIN_RIGHT, this._margins.right));
            k.push(createProperty(PropertyKeys.MARGIN_BOTTOM, this._margins.bottom));
            k.push(createProperty(PropertyKeys.MOUSE_WHEEL_ENABLED, this._field.mouseWheelEnabled));
            k.push(createProperty(PropertyKeys.MAX_CHARS, this._field.maxChars));
            k.push(createProperty(PropertyKeys.MULTILINE, this._field.multiline));
            k.push(createProperty(PropertyKeys.RESTRICT, this._field.restrict));
            k.push(new PropertyStruct(PropertyKeys.SHARPNESS, this._field.sharpness, PropertyStruct.NUMBER, (!(this._field.sharpness == _local_2.sharpness))));
            k.push(new PropertyStruct(PropertyKeys.THICKNESS, this._field.thickness, PropertyStruct.NUMBER, (!(this._field.thickness == _local_2.thickness))));
            k.push(createProperty(PropertyKeys.WORD_WRAP, this._field.wordWrap));
            k.push(createProperty(PropertyKeys.MAX_LINES, this.maxLines));
            k.push(createProperty(PropertyKeys.OVERFLOW_REPLACE, this.overflowReplace));
            k.push(new PropertyStruct(PropertyKeys.BOLD, (!(this._field.defaultTextFormat.bold == false)), PropertyStruct.BOOLEAN, (!(this._field.defaultTextFormat.bold == (_local_2.fontWeight == FontStyle.BOLD)))));
            k.push(new PropertyStruct(PropertyKeys.ITALIC, (!(this._field.defaultTextFormat.italic == false)), PropertyStruct.BOOLEAN, (!(this._field.defaultTextFormat.italic == (_local_2.fontStyle == FontStyle.ITALIC)))));
            k.push(new PropertyStruct(PropertyKeys.UNDERLINE, (!(this._field.defaultTextFormat.underline == false)), PropertyStruct.BOOLEAN, (!(this._field.defaultTextFormat.underline == (_local_2.textDecoration == "underline")))));
            k.push(new PropertyStruct(PropertyKeys.KERNING, (!(this._field.defaultTextFormat.kerning == false)), PropertyStruct.BOOLEAN, (!(this._field.defaultTextFormat.kerning == _local_2.kerning))));
            k.push(new PropertyStruct(PropertyKeys.SPACING, this._field.defaultTextFormat.letterSpacing, PropertyStruct.NUMBER, (!(this._field.defaultTextFormat.letterSpacing == _local_2.letterSpacing))));
            k.push(new PropertyStruct(PropertyKeys.LEADING, this._field.defaultTextFormat.leading, PropertyStruct.NUMBER, (!(this._field.defaultTextFormat.leading == _local_2.leading))));
            return k;
        }

        public function get etchingColor():uint
        {
            return this._etchingColor;
        }

        public function set etchingColor(k:uint):void
        {
            setEtchingColor(this, k);
        }

        public function set styleSheet(k:StyleSheet):void
        {
            this.setStyleSheet(this, k);
        }

        private function setStyleSheet(k:TextController, _arg_2:StyleSheet):void
        {
            k._field.styleSheet = _arg_2;
            this.refreshTextImage();
        }

        public function get etchingPosition():String
        {
            return this._etchingPosition;
        }

        public function set etchingPosition(k:String):void
        {
            setEtchingPosition(this, k);
        }

        public function resetExplicitStyle():void
        {
            this._explicitStyle = new TextStyle();
        }
    }
}
