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
        private static const _Str_15102:Array = ["a", "B", "c", "D", "e"];
        protected static const _Str_13927:Dictionary = _Str_19301();

        private var _Str_16655:String = "";
        protected var _Str_2309:TextField;
        protected var _Str_7995:Number;
        protected var _Str_3375:Number;
        protected var _Str_4263:Boolean;
        protected var _Str_2480:TextMargins;
        protected var _Str_4318:String = "none";
        protected var _Str_2959:Boolean = false;
        protected var _Str_22084:int = 0;
        protected var _Str_5517:Boolean = false;
        protected var _Str_3778:uint;
        protected var _Str_5717:String;
        protected var _Str_22881:TextFormat;
        private var _Str_4040:String;
        private var _Str_3808:TextStyle;
        protected var _Str_17282:Boolean;

        public function TextController(k:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:IWindow, _arg_8:Function, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            this._Str_3808 = new TextStyle();
            this._Str_2480 = new TextMargins(0, 0, 0, 0, this._Str_5268);
            this._Str_4263 = false;
            this._Str_7995 = 0;
            this._Str_3375 = 0;
            if (this._Str_2309 == null)
            {
                this._Str_2309 = new TextField();
                if (_arg_6)
                {
                    this._Str_2309.width = _arg_6.width;
                    this._Str_2309.height = _arg_6.height;
                }
                this._Str_2309.mouseWheelEnabled = false;
            }
            this._Str_4040 = String(_arg_5.getWindowFactory().getThemeManager().getPropertyDefaults(_arg_3).get(PropertyKeys.TEXT_STYLE));
            super(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
            _Str_6964(this);
            TextStyleManager.events.addEventListener(Event.CHANGE, this._Str_6721);
            if (this._Str_2309.autoSize == TextFieldAutoSize.NONE)
            {
                this._Str_2309.width = _w;
                this._Str_2309.height = _h;
            }
        }

        private static function _Str_17232(k:TextController, _arg_2:String):void
        {
            _arg_2 = ((_arg_2 == AntiAliasType.ADVANCED) ? AntiAliasType.ADVANCED : AntiAliasType.NORMAL);
            k._Str_3808.antiAliasType = _arg_2;
            k._Str_2309.antiAliasType = _arg_2;
            k.refreshTextImage();
        }

        private static function _Str_23745(k:TextController, _arg_2:Boolean):void
        {
            k._Str_2309.alwaysShowSelection = _arg_2;
        }

        private static function _Str_16361(k:TextController, _arg_2:String):void
        {
            var _local_3:TextFormat;
            if (_arg_2 != k._Str_4318)
            {
                k._Str_4318 = _arg_2;
                k._Str_2309.autoSize = ((_arg_2 != TextFieldAutoSize.NONE) ? TextFieldAutoSize.LEFT : TextFieldAutoSize.NONE);
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

        private static function _Str_16638(k:TextController, _arg_2:Boolean):void
        {
            k.background = _arg_2;
        }

        private static function _Str_16255(k:TextController, _arg_2:uint):void
        {
            k.color = _arg_2;
        }

        private static function _Str_17644(k:TextController, _arg_2:Boolean):void
        {
            var _local_3:TextFormat = k.defaultTextFormat;
            _local_3.bold = _arg_2;
            k.setTextFormat(new TextFormat(_local_3.font, _local_3.size, _local_3.color, _local_3.bold, _local_3.italic, _local_3.underline, _local_3.url, _local_3.target, _local_3.align, _local_3.leftMargin, _local_3.rightMargin, _local_3.indent, _local_3.leading));
            k.defaultTextFormat = _local_3;
            k._Str_3808.fontWeight = TextStyle.BOLD;
        }

        private static function _Str_18639(k:TextController, _arg_2:Boolean):void
        {
            k._Str_2309.border = _arg_2;
            k.refreshTextImage();
        }

        private static function _Str_18700(k:TextController, _arg_2:uint):void
        {
            k._Str_2309.borderColor = _arg_2;
            k.refreshTextImage();
        }

        private static function _Str_23959(k:TextController, _arg_2:Boolean):void
        {
            k._Str_2309.condenseWhite = _arg_2;
            k.refreshTextImage();
        }

        private static function _Str_18477(k:TextController, _arg_2:TextFormat):void
        {
            k._Str_2309.defaultTextFormat = _arg_2;
            k.refreshTextImage();
        }

        private static function _Str_19185(k:TextController, _arg_2:Boolean):void
        {
            k._Str_2309.embedFonts = _arg_2;
        }

        private static function _Str_16898(k:TextController, _arg_2:String):void
        {
            var _local_3:TextFormat = k.defaultTextFormat;
            _local_3.font = _arg_2;
            k.setTextFormat(new TextFormat(_local_3.font, _local_3.size, _local_3.color, _local_3.bold, _local_3.italic, _local_3.underline, _local_3.url, _local_3.target, _local_3.align, _local_3.leftMargin, _local_3.rightMargin, _local_3.indent, _local_3.leading));
            k._Str_2309.embedFonts = FontEnum.isEmbeddedFont(_arg_2);
            k.defaultTextFormat = _local_3;
            k._Str_3808.fontFamily = _arg_2;
        }

        private static function _Str_16385(k:TextController, _arg_2:uint):void
        {
            var _local_3:TextFormat = k.defaultTextFormat;
            _local_3.size = _arg_2;
            k.setTextFormat(new TextFormat(_local_3.font, _local_3.size, _local_3.color, _local_3.bold, _local_3.italic, _local_3.underline, _local_3.url, _local_3.target, _local_3.align, _local_3.leftMargin, _local_3.rightMargin, _local_3.indent, _local_3.leading));
            k.defaultTextFormat = _local_3;
            k._Str_3808.fontSize = _arg_2;
        }

        private static function _Str_18868(k:TextController, _arg_2:String):void
        {
            k._Str_2309.gridFitType = _arg_2;
            k.refreshTextImage();
        }

        private static function _Str_20777(k:TextController, _arg_2:String):void
        {
            if (_arg_2 == null)
            {
                return;
            }
            if (k._Str_2959)
            {
                k.context.removeLocalizationListener(k._caption.slice(2, k._caption.indexOf("}")), k);
                k._Str_2959 = false;
            }
            k._caption = _arg_2;
            if (((k._caption.charAt(0) == "$") && (k._caption.charAt(1) == "{")))
            {
                k.context.registerLocalizationListener(k._caption.slice(2, k._caption.indexOf("}")), k);
                k._Str_2959 = true;
            }
            else
            {
                if (k._Str_2309 != null)
                {
                    k._Str_2309.htmlText = k._caption;
                    k.refreshTextImage();
                }
            }
        }

        private static function _Str_17524(k:TextController, _arg_2:Boolean):void
        {
            var _local_3:TextFormat = k.defaultTextFormat;
            _local_3.italic = _arg_2;
            k.setTextFormat(new TextFormat(_local_3.font, _local_3.size, _local_3.color, _local_3.bold, _local_3.italic, _local_3.underline, _local_3.url, _local_3.target, _local_3.align, _local_3.leftMargin, _local_3.rightMargin, _local_3.indent, _local_3.leading));
            k.defaultTextFormat = _local_3;
            k._Str_3808.fontStyle = ((_arg_2) ? TextStyle.ITALIC : TextStyle.NORMAL);
        }

        private static function _Str_18973(k:TextController, _arg_2:Boolean):void
        {
            var _local_3:TextFormat = k.defaultTextFormat;
            _local_3.kerning = _arg_2;
            var _local_4:TextFormat = new TextFormat(_local_3.font, _local_3.size, _local_3.color, _local_3.bold, _local_3.italic, _local_3.underline, _local_3.url, _local_3.target, _local_3.align, _local_3.leftMargin, _local_3.rightMargin, _local_3.indent, _local_3.leading);
            _local_4.kerning = _arg_2;
            k.setTextFormat(_local_4);
            k.defaultTextFormat = _local_3;
            k._Str_3808.kerning = _arg_2;
        }

        private static function _Str_18664(k:TextController, _arg_2:Map):void
        {
            if (k._Str_2480)
            {
                k._Str_2480.assign(int(_arg_2["left"]), int(_arg_2["top"]), int(_arg_2["right"]), int(_arg_2["bottom"]), k._Str_5268);
            }
            else
            {
                k._Str_2480 = new TextMargins(int(_arg_2["left"]), int(_arg_2["top"]), int(_arg_2["right"]), int(_arg_2["bottom"]), k._Str_5268);
            }
            k.refreshTextImage();
        }

        private static function _Str_22964(k:TextController, _arg_2:int):void
        {
            if (((k._Str_2480) && (!(k._Str_2480.left == _arg_2))))
            {
                k.margins.left = _arg_2;
            }
        }

        private static function _Str_24238(k:TextController, _arg_2:int):void
        {
            if (((k._Str_2480) && (!(k._Str_2480.top == _arg_2))))
            {
                k.margins.top = _arg_2;
            }
        }

        private static function _Str_22453(k:TextController, _arg_2:int):void
        {
            if (((k._Str_2480) && (!(k._Str_2480.right == _arg_2))))
            {
                k.margins.right = _arg_2;
            }
        }

        private static function _Str_24630(k:TextController, _arg_2:int):void
        {
            if (((k._Str_2480) && (!(k._Str_2480.bottom == _arg_2))))
            {
                k.margins.bottom = _arg_2;
            }
        }

        private static function _Str_18813(k:TextController, _arg_2:int):void
        {
            k._Str_2309.maxChars = _arg_2;
            k.refreshTextImage();
        }

        private static function _Str_24930(k:TextController, _arg_2:Boolean):void
        {
            k._Str_2309.mouseWheelEnabled = _arg_2;
        }

        private static function _Str_17885(k:TextController, _arg_2:Boolean):void
        {
            k._Str_2309.multiline = _arg_2;
            k.refreshTextImage();
        }

        private static function _Str_17907(k:TextController, _arg_2:String):void
        {
            k._Str_2309.restrict = _arg_2;
        }

        private static function _Str_16622(k:TextController, _arg_2:Number):void
        {
            k._Str_2309.sharpness = _arg_2;
            k.refreshTextImage();
            k._Str_3808.sharpness = _arg_2;
        }

        private static function _Str_9915(k:TextController, _arg_2:Number):void
        {
            var _local_3:TextFormat = k.defaultTextFormat;
            _local_3.letterSpacing = _arg_2;
            var _local_4:TextFormat = new TextFormat(_local_3.font, _local_3.size, _local_3.color, _local_3.bold, _local_3.italic, _local_3.underline, _local_3.url, _local_3.target, _local_3.align, _local_3.leftMargin, _local_3.rightMargin, _local_3.indent, _local_3.leading);
            _local_4.letterSpacing = _arg_2;
            k.setTextFormat(_local_4);
            k.defaultTextFormat = _local_3;
            k._Str_3808.letterSpacing = _arg_2;
        }

        private static function _Str_16363(k:TextController, _arg_2:int):void
        {
            k._Str_22084 = _arg_2;
            k.refreshTextImage();
        }

        private static function _Str_18703(k:TextController, _arg_2:Number):void
        {
            var _local_3:TextFormat = k.defaultTextFormat;
            _local_3.leading = _arg_2;
            var _local_4:TextFormat = new TextFormat(_local_3.font, _local_3.size, _local_3.color, _local_3.bold, _local_3.italic, _local_3.underline, _local_3.url, _local_3.target, _local_3.align, _local_3.leftMargin, _local_3.rightMargin, _local_3.indent, _local_3.leading);
            _local_4.leading = _arg_2;
            k.setTextFormat(_local_4);
            k.defaultTextFormat = _local_3;
            k._Str_3808.leading = _arg_2;
        }

        private static function _Str_18306(k:TextController, _arg_2:uint):void
        {
            k._Str_2309.textColor = _arg_2;
            k.refreshTextImage();
            k._Str_3808.color = _arg_2;
        }

        private static function _Str_15545(k:TextController, _arg_2:TextStyle):void
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
                k._Str_4040 = _local_3.name;
                _Str_6964(k);
                k.refreshTextImage();
            }
        }

        private static function _Str_25567(k:TextController, _arg_2:String):void
        {
            var _local_4:TextFormat;
            var _local_3:TextStyle = TextStyleManager.getStyle(_arg_2);
            if (!_local_3)
            {
                _local_3 = TextStyleManager.findMatchingTextStyle(_arg_2);
            }
            if (_local_3)
            {
                k._Str_4040 = _local_3.name;
                _Str_6964(k);
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
                    _Str_15545(k, _local_3);
                }
            }
            if (k._Str_4318 == TextFieldAutoSize.CENTER)
            {
                _local_4 = new TextFormat();
                _local_4.align = TextFormatAlign.CENTER;
                k._Str_2309.setTextFormat(_local_4);
            }
        }

        private static function _Str_18660(k:TextController, _arg_2:Number):void
        {
            k._Str_2309.thickness = _arg_2;
            k.refreshTextImage();
            k._Str_3808.thickness = _arg_2;
        }

        private static function _Str_16916(k:TextController, _arg_2:Boolean):void
        {
            var _local_3:TextFormat = k.defaultTextFormat;
            _local_3.underline = _arg_2;
            k.setTextFormat(new TextFormat(_local_3.font, _local_3.size, _local_3.color, _local_3.bold, _local_3.italic, _local_3.underline, _local_3.url, _local_3.target, _local_3.align, _local_3.leftMargin, _local_3.rightMargin, _local_3.indent, _local_3.leading));
            k.defaultTextFormat = _local_3;
            k._Str_3808.textDecoration = ((_arg_2) ? TextStyle.UNDERLINE : TextStyle.NONE);
        }

        private static function _Str_16858(k:TextController, _arg_2:Boolean):void
        {
            k._Str_2309.wordWrap = _arg_2;
            k.refreshTextImage();
        }

        private static function _Str_18098(k:TextController, _arg_2:String):void
        {
            k._Str_16655 = _arg_2;
            k.refreshTextImage();
        }

        protected static function _Str_6964(k:TextController):void
        {
            var _local_2:TextField = k._Str_2309;
            var _local_3:String = k._Str_4040;
            var _local_4:TextStyle = k._Str_3808;
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
            k._Str_22881 = _local_6;
        }

        protected static function _Str_19301():Dictionary
        {
            var k:Dictionary = new Dictionary();
            k[PropertyKeys.ALWAYS_SHOW_SELECTION] = _Str_23745;
            k["background"] = _Str_16638;
            k["background_color"] = _Str_16255;
            k[PropertyKeys.BOLD] = _Str_17644;
            k[PropertyKeys.BORDER] = _Str_18639;
            k[PropertyKeys.BORDER_COLOR] = _Str_18700;
            k[PropertyKeys.CONDENSE_WHITE] = _Str_23959;
            k["default_text_format"] = _Str_18477;
            k[PropertyKeys.ETCHING_COLOR] = _Str_16906;
            k[PropertyKeys.ETCHING_POSITION] = _Str_18207;
            k[PropertyKeys.FONT_FACE] = _Str_16898;
            k[PropertyKeys.FONT_SIZE] = _Str_16385;
            k[PropertyKeys.GRID_FIT_TYPE] = _Str_18868;
            k[PropertyKeys.ITALIC] = _Str_17524;
            k[PropertyKeys.KERNING] = _Str_18973;
            k[PropertyKeys.MAX_CHARS] = _Str_18813;
            k[PropertyKeys.MULTILINE] = _Str_17885;
            k[PropertyKeys.RESTRICT] = _Str_17907;
            k[PropertyKeys.SPACING] = _Str_9915;
            k[PropertyKeys.SHARPNESS] = _Str_16622;
            k[PropertyKeys.THICKNESS] = _Str_18660;
            k[PropertyKeys.UNDERLINE] = _Str_16916;
            k[PropertyKeys.WORD_WRAP] = _Str_16858;
            k["margins"] = _Str_18664;
            k[PropertyKeys.MAX_LINES] = _Str_16363;
            k[PropertyKeys.LEADING] = _Str_18703;
            k[PropertyKeys.ANTIALIAS_TYPE] = _Str_17232;
            k[PropertyKeys.AUTO_SIZE] = _Str_16361;
            k[PropertyKeys.MOUSE_WHEEL_ENABLED] = _Str_24930;
            k[PropertyKeys.TEXT_COLOR] = _Str_18306;
            k[PropertyKeys.TEXT_STYLE] = _Str_25567;
            k[PropertyKeys.MARGIN_LEFT] = _Str_22964;
            k[PropertyKeys.MARGIN_TOP] = _Str_24238;
            k[PropertyKeys.MARGIN_RIGHT] = _Str_22453;
            k[PropertyKeys.MARGIN_BOTTOM] = _Str_24630;
            k[PropertyKeys.OVERFLOW_REPLACE] = _Str_18098;
            return k;
        }

        private static function _Str_16906(k:TextController, _arg_2:uint):void
        {
            k._Str_3778 = _arg_2;
            k.refreshTextImage();
            k._Str_3808.etchingColor = k._Str_3778;
        }

        private static function _Str_18207(k:TextController, _arg_2:String):void
        {
            k._Str_5717 = _arg_2;
            k.refreshTextImage();
            k._Str_3808.etchingPosition = k._Str_5717;
        }


        public function get antiAliasType():String
        {
            return this._Str_2309.antiAliasType;
        }

        public function get autoSize():String
        {
            return this._Str_4318;
        }

        public function get bold():Boolean
        {
            return this._Str_2309.defaultTextFormat.bold;
        }

        public function get border():Boolean
        {
            return this._Str_2309.border;
        }

        public function get borderColor():uint
        {
            return this._Str_2309.borderColor;
        }

        public function get bottomScrollV():int
        {
            return this._Str_2309.bottomScrollV;
        }

        public function get defaultTextFormat():TextFormat
        {
            return this._Str_2309.defaultTextFormat;
        }

        public function get embedFonts():Boolean
        {
            return this._Str_2309.embedFonts;
        }

        public function get fontFace():String
        {
            return this._Str_2309.defaultTextFormat.font;
        }

        public function get fontSize():uint
        {
            return (this._Str_2309.defaultTextFormat.size == null) ? 12 : uint(this._Str_2309.defaultTextFormat.size);
        }

        public function get gridFitType():String
        {
            return this._Str_2309.gridFitType;
        }

        public function get htmlText():String
        {
            return this._Str_2309.htmlText;
        }

        public function get italic():Boolean
        {
            return this._Str_2309.defaultTextFormat.italic;
        }

        public function get kerning():Boolean
        {
            return this._Str_2309.defaultTextFormat.kerning;
        }

        public function get length():int
        {
            return this._Str_2309.length;
        }

        public function get margins():IMargins
        {
            return this._Str_2480;
        }

        public function get maxChars():int
        {
            return this._Str_2309.maxChars;
        }

        public function get multiline():Boolean
        {
            return this._Str_2309.multiline;
        }

        public function get numLines():int
        {
            return this._Str_2309.numLines;
        }

        public function get restrict():String
        {
            return this._Str_2309.restrict;
        }

        public function get sharpness():Number
        {
            return this._Str_2309.sharpness;
        }

        public function get spacing():Number
        {
            return Number(this._Str_2309.defaultTextFormat.letterSpacing);
        }

        public function get text():String
        {
            return (this._Str_2309 != null) ? this._Str_2309.text : "";
        }

        public function get textColor():uint
        {
            return this._Str_2309.textColor;
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
            return this._Str_2309.textHeight;
        }

        public function get textWidth():Number
        {
            return this._Str_2309.textWidth;
        }

        public function get textStyle():TextStyle
        {
            return TextStyleManager.getStyle(this._Str_4040);
        }

        public function get thickness():Number
        {
            return this._Str_2309.thickness;
        }

        public function get underline():Boolean
        {
            return this._Str_2309.defaultTextFormat.underline;
        }

        public function get wordWrap():Boolean
        {
            return this._Str_2309.wordWrap;
        }

        public function get textField():TextField
        {
            return this._Str_2309;
        }

        public function get _Str_9760():int
        {
            return this._Str_22084;
        }

        public function get leading():Number
        {
            return Number(this._Str_2309.defaultTextFormat.leading);
        }

        public function get _Str_24155():Boolean
        {
            return !(this._Str_16655 == "");
        }

        public function get _Str_15348():String
        {
            return this._Str_16655;
        }

        public function get scrollH():Number
        {
            return this._Str_7995;
        }

        public function get scrollV():Number
        {
            return this._Str_3375;
        }

        public function get maxScrollH():int
        {
            return this._Str_2309.maxScrollH;
        }

        public function get maxScrollV():int
        {
            return Math.max((this._Str_2309.textHeight - height), 0);
        }

        public function set antiAliasType(k:String):void
        {
            _Str_17232(this, k);
        }

        public function set autoSize(k:String):void
        {
            _Str_16361(this, k);
        }

        public function set bold(k:Boolean):void
        {
            _Str_17644(this, k);
        }

        public function set border(k:Boolean):void
        {
            _Str_18639(this, k);
        }

        public function set borderColor(k:uint):void
        {
            _Str_18700(this, k);
        }

        public function set defaultTextFormat(k:TextFormat):void
        {
            _Str_18477(this, k);
        }

        public function set embedFonts(k:Boolean):void
        {
            _Str_19185(this, k);
        }

        public function set fontFace(k:String):void
        {
            _Str_16898(this, k);
        }

        public function set fontSize(k:uint):void
        {
            _Str_16385(this, k);
        }

        public function set gridFitType(k:String):void
        {
            _Str_18868(this, k);
        }

        public function set htmlText(k:String):void
        {
            _Str_20777(this, k);
        }

        public function set italic(k:Boolean):void
        {
            _Str_17524(this, k);
        }

        public function set kerning(k:Boolean):void
        {
            _Str_18973(this, k);
        }

        public function set maxChars(k:int):void
        {
            _Str_18813(this, k);
        }

        public function set multiline(k:Boolean):void
        {
            _Str_17885(this, k);
        }

        public function set restrict(k:String):void
        {
            _Str_17907(this, k);
        }

        public function set sharpness(k:Number):void
        {
            _Str_16622(this, k);
        }

        public function set spacing(k:Number):void
        {
            _Str_9915(this, k);
        }

        public function set textColor(k:uint):void
        {
            _Str_18306(this, k);
        }

        public function set _Str_5349(k:Boolean):void
        {
            _Str_16638(this, k);
        }

        public function set _Str_4807(k:uint):void
        {
            _Str_16255(this, k);
        }

        public function set textStyle(k:TextStyle):void
        {
            _Str_15545(this, k);
        }

        public function set thickness(k:Number):void
        {
            _Str_18660(this, k);
        }

        public function set underline(k:Boolean):void
        {
            _Str_16916(this, k);
        }

        public function set wordWrap(k:Boolean):void
        {
            _Str_16858(this, k);
        }

        public function set _Str_9760(k:int):void
        {
            _Str_16363(this, k);
        }

        public function set leading(k:Number):void
        {
            _Str_18703(this, k);
        }

        public function set _Str_15348(k:String):void
        {
            _Str_18098(this, k);
        }

        protected function _Str_8027(k:String):String
        {
            return (this.maxChars > 0) ? k.substr(0, this.maxChars) : k;
        }

        override public function setRectangle(k:int, _arg_2:int, _arg_3:int, _arg_4:int):void
        {
            if ((((this._Str_17282) || (!(this.multiline))) || (!(this.wordWrap))))
            {
                super.setRectangle(k, _arg_2, _arg_3, _arg_4);
                return;
            }
            this._Str_17282 = true;
            var _local_5:String = this.autoSize;
            this.autoSize = TextFieldAutoSize.NONE;
            super.setRectangle(k, _arg_2, _arg_3, _arg_4);
            this.autoSize = _local_5;
            this._Str_17282 = false;
        }

        public function set scrollH(k:Number):void
        {
            this._Str_7995 = k;
            this._Str_2309.scrollH = (this._Str_7995 * Number(this._Str_2309.maxScrollH));
            this.refreshTextImage();
        }

        public function set scrollV(k:Number):void
        {
            if (k > this._Str_3375)
            {
                this._Str_3375 = k;
                this._Str_2309.scrollV = Math.max(this._Str_2309.scrollV, ((k * this._Str_2309.maxScrollV) + 1));
                this.refreshTextImage();
            }
            else
            {
                if (k < this._Str_3375)
                {
                    this._Str_3375 = k;
                    this._Str_2309.scrollV = Math.min(this._Str_2309.scrollV, ((k * this._Str_2309.maxScrollV) - 1));
                    this.refreshTextImage();
                }
            }
        }

        public function get _Str_3707():Rectangle
        {
            return new Rectangle((this._Str_7995 * this.maxScrollH), (this._Str_3375 * this.maxScrollV), width, height);
        }

        public function get visibleRegion():Rectangle
        {
            return new Rectangle(0, 0, (this.maxScrollH + width), (this.maxScrollV + height));
        }

        public function get scrollStepH():Number
        {
            return 10;
        }

        public function get scrollStepV():Number
        {
            return this._Str_2309.textHeight / this._Str_2309.numLines;
        }

        public function set scrollStepH(k:Number):void
        {
        }

        public function set scrollStepV(k:Number):void
        {
        }

        private function _Str_23637(k:String):String
        {
            var _local_4:Font;
            var _local_5:Font;
            var _local_6:String;
            var _local_7:int;
            var _local_8:String;
            var _local_2:TextFormat = this._Str_2309.getTextFormat();
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
                    _local_6 = (_local_6 + _Str_15102[Math.floor((Math.random() * _Str_15102.length))]);
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
            if (this._Str_2959)
            {
                context.removeLocalizationListener(_caption.slice(2, _caption.indexOf("}")), this);
                this._Str_2959 = false;
            }
            _caption = k;
            if ((((!(this._Str_5517)) && (_caption.charAt(0) == "$")) && (_caption.charAt(1) == "{")))
            {
                this._Str_2959 = true;
                context.registerLocalizationListener(_caption.slice(2, _caption.indexOf("}")), this);
            }
            else
            {
                if (this._Str_2309 != null)
                {
                    this._Str_2309.text = this._Str_23637(_caption);
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
            this._Str_2309.backgroundColor = k;
        }

        override public function set background(k:Boolean):void
        {
            super.background = k;
            this._Str_2309.background = k;
        }

        public function set localization(k:String):void
        {
            if (((!(k == null)) && (!(this._Str_2309 == null))))
            {
                this._Str_2309.text = this._Str_8027(k);
                this.refreshTextImage();
            }
        }

        override public function clone():IWindow
        {
            var k:TextController = (super.clone() as TextController);
            k._Str_2309.backgroundColor = color;
            k._Str_2309.background = background;
            k._Str_7995 = this._Str_7995;
            k._Str_3375 = this._Str_3375;
            k._Str_2480 = this._Str_2480.clone(k._Str_5268);
            k._Str_4318 = this._Str_4318;
            k._Str_2959 = this._Str_2959;
            return k;
        }

        override public function dispose():void
        {
            immediateClickMode = false;
            TextStyleManager.events.removeEventListener(Event.CHANGE, this._Str_6721);
            if (this._Str_2959)
            {
                context.removeLocalizationListener(_caption.slice(2, _caption.indexOf("}")), this);
            }
            if (this._Str_2480 != null)
            {
                this._Str_2480.dispose();
                this._Str_2480 = null;
            }
            this._Str_2309 = null;
            super.dispose();
        }

        override public function update(k:WindowController, _arg_2:WindowEvent):Boolean
        {
            if (!this._Str_4263)
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
            if (this._Str_4263)
            {
                return;
            }
            this._Str_4263 = true;
            var _local_2:int = (this._Str_2480.left + this._Str_2480.right);
            var _local_3:int = (this._Str_2480.top + this._Str_2480.bottom);
            var _local_4:int = (_w - _local_2);
            var _local_5:int = (_h - _local_3);
            var _local_6:int = (Math.floor(this._Str_2309.width) + ((this._Str_2309.border) ? 1 : 0));
            var _local_7:Boolean;
            if (((this._Str_4318 == TextFieldAutoSize.NONE) && (this._Str_24155)))
            {
                _local_9 = this._Str_2309.text;
                if ((this._Str_2309.textHeight + _local_3) > _local_5)
                {
                    _local_11 = (this._Str_2309.numLines - 1);
                    while (((this._Str_2309.getCharBoundaries(this._Str_2309.getLineOffset(_local_11)) == null) || (this._Str_2309.getCharBoundaries(this._Str_2309.getLineOffset(_local_11)).bottom > _local_5)))
                    {
                        _local_11--;
                    }
                    _local_12 = this._Str_2309.getLineOffset(_local_11);
                    _local_13 = (_local_12 + this._Str_2309.getLineLength(_local_11));
                    _local_8 = _local_13;
                    while ((((this._Str_2309.textHeight + _local_3) > _local_5) && (_local_8 > 0)))
                    {
                        this._Str_2309.text = (_local_9.slice(0, --_local_8) + this._Str_15348);
                    }
                }
                _local_10 = this._Str_2309.text;
                if ((this._Str_2309.textWidth + _local_2) > _local_4)
                {
                    _local_14 = (this._Str_2309.text.length - 1);
                    while (((this._Str_2309.getCharBoundaries(_local_14) == null) || (this._Str_2309.getCharBoundaries(_local_14).right > _local_4)))
                    {
                        _local_14--;
                    }
                    _local_15 = this.getTextFormat(0, _local_14);
                    _local_8 = _local_14;
                    _local_16 = (((_local_2 + _local_15.indent) + _local_15.leftMargin) + _local_15.rightMargin);
                    while (((((this._Str_2309.textWidth + _local_16) + 2) > _local_4) && (_local_8 > 0)))
                    {
                        this._Str_2309.text = (_local_10.slice(0, --_local_8) + this._Str_15348);
                    }
                }
                _local_6 = (Math.floor(this._Str_2309.width) + ((this._Str_2309.border) ? 1 : 0));
            }
            if (_local_6 != _local_4)
            {
                if (this._Str_4318 == TextFieldAutoSize.LEFT)
                {
                    this.setRectangle(_x, _y, (_local_6 + _local_2), (Math.floor(this._Str_2309.height) + _local_3));
                    _local_7 = true;
                }
                else
                {
                    if (this._Str_4318 != TextFieldAutoSize.RIGHT)
                    {
                        if (this._Str_4318 != TextFieldAutoSize.CENTER)
                        {
                            this._Str_2309.width = (_local_4 - ((this._Str_2309.border) ? 1 : 0));
                            this._Str_2309.height = (_local_5 - ((this._Str_2309.border) ? 1 : 0));
                        }
                    }
                }
            }
            if ((this._Str_2309.height + ((this._Str_2309.border) ? 1 : 0)) < _local_5)
            {
                if (this._Str_4318 == TextFieldAutoSize.NONE)
                {
                    this._Str_2309.height = (_local_5 - ((this._Str_2309.border) ? 1 : 0));
                }
                else
                {
                    height = (Math.floor(this._Str_2309.height) + _local_3);
                    _local_7 = true;
                }
            }
            else
            {
                if ((this._Str_2309.height + ((this._Str_2309.border) ? 1 : 0)) > _local_5)
                {
                    if (this._Str_4318 != TextFieldAutoSize.NONE)
                    {
                        height = (Math.floor(this._Str_2309.height) + _local_3);
                        _local_7 = true;
                    }
                }
            }
            this._Str_4263 = false;
            _context.invalidate(this, null, WindowRedrawFlag.REDRAW);
            if ((((!(_local_7)) && (!(k))) && (_Str_759)))
            {
                _local_17 = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_RESIZED, this, null);
                _Str_759.dispatchEvent(_local_17);
                _local_17.recycle();
            }
        }

        public function appendText(k:String):void
        {
            this._Str_2309.appendText(k);
            this.refreshTextImage();
        }

        public function getCharBoundaries(k:int):Rectangle
        {
            return this._Str_2309.getCharBoundaries(k);
        }

        public function getCharIndexAtPoint(k:Number, _arg_2:Number):int
        {
            return this._Str_2309.getCharIndexAtPoint(k, _arg_2);
        }

        public function getFirstCharInParagraph(k:int):int
        {
            return this._Str_2309.getFirstCharInParagraph(k);
        }

        public function getImageReference(k:String):DisplayObject
        {
            return this._Str_2309.getImageReference(k);
        }

        public function getLineIndexAtPoint(k:Number, _arg_2:Number):int
        {
            return this._Str_2309.getLineIndexAtPoint(k, _arg_2);
        }

        public function getLineIndexOfChar(k:int):int
        {
            return this._Str_2309.getLineIndexOfChar(k);
        }

        public function getLineLength(k:int):int
        {
            return this._Str_2309.getLineLength(k);
        }

        public function getLineMetrics(k:int):TextLineMetrics
        {
            return this._Str_2309.getLineMetrics(k);
        }

        public function getLineOffset(k:int):int
        {
            return this._Str_2309.getLineOffset(k);
        }

        public function getLineText(k:int):String
        {
            return this._Str_2309.getLineText(k);
        }

        public function getParagraphLength(k:int):int
        {
            return this._Str_2309.getParagraphLength(k);
        }

        public function getTextFormat(k:int=-1, _arg_2:int=-1):TextFormat
        {
            return this._Str_2309.getTextFormat(k, _arg_2);
        }

        public function replaceText(k:int, _arg_2:int, _arg_3:String):void
        {
            this._Str_2309.replaceText(k, _arg_2, _arg_3);
            this.refreshTextImage();
        }

        public function setTextFormat(k:TextFormat, _arg_2:int=-1, _arg_3:int=-1):void
        {
            if ((((_arg_2 >= 0) && (_arg_3 > _arg_2)) && (_arg_3 < this._Str_2309.length)))
            {
                this._Str_2309.setTextFormat(k, _arg_2, _arg_3);
                this.refreshTextImage();
            }
        }

        public function _Str_5268(k:IMargins):void
        {
            if (k != this._Str_2480)
            {
                this._Str_2480.dispose();
                this._Str_2480 = new TextMargins(k.left, k.top, k.right, k.bottom, this._Str_5268);
            }
            if (this._Str_4318 == TextFieldAutoSize.LEFT)
            {
                this._Str_2309.width = ((_w - this._Str_2480.left) - this._Str_2480.right);
            }
            this.refreshTextImage();
        }

        private function _Str_6721(k:Event):void
        {
            _Str_6964(this);
            this.refreshTextImage();
        }

        protected function _Str_26328(k:XML):void
        {
            var _local_2:String;
            var _local_3:Function;
            var _local_4:Map;
            if (k != null)
            {
                _local_4 = new Map();
                XMLVariableParser.parseVariableList(k.children(), _local_4);
                this._Str_4263 = true;
                for (_local_2 in _local_4)
                {
                    _local_3 = _Str_13927[_local_2];
                    if (_local_3 != null)
                    {
                        (_local_3(this, _local_4[_local_2]));
                    }
                }
                this._Str_4263 = false;
            }
        }

        override public function set properties(k:Array):void
        {
            var _local_2:Function;
            var _local_3:PropertyStruct;
            this._Str_4263 = true;
            for each (_local_3 in k)
            {
                _local_2 = _Str_13927[_local_3.key];
                if (_local_2 != null)
                {
                    (_local_2(this, _local_3.value));
                }
            }
            this._Str_4263 = false;
            super.properties = k;
            this.refreshTextImage();
        }

        override public function get properties():Array
        {
            var k:Array = super.properties;
            var _local_2:TextStyle = TextStyleManager.getStyle(this._Str_4040);
            k.push(createProperty(PropertyKeys.ALWAYS_SHOW_SELECTION, this._Str_2309.alwaysShowSelection));
            k.push(new PropertyStruct(PropertyKeys.ANTIALIAS_TYPE, this._Str_2309.antiAliasType, PropertyStruct.STRING, (!(this._Str_2309.antiAliasType == _local_2.antiAliasType)), PropertyKeys.ANTIALIAS_TYPE_RANGE));
            k.push(createProperty(PropertyKeys.AUTO_SIZE, this._Str_4318));
            k.push(createProperty(PropertyKeys.BORDER, this._Str_2309.border));
            k.push(createProperty(PropertyKeys.BORDER_COLOR, this._Str_2309.borderColor));
            k.push(new PropertyStruct(PropertyKeys.ETCHING_COLOR, this._Str_3778, PropertyStruct.HEX, (!(this._Str_3778 == uint(_local_2.etchingColor)))));
            k.push(new PropertyStruct(PropertyKeys.ETCHING_POSITION, this._Str_5717, PropertyStruct.STRING, (!(this._Str_5717 == String(_local_2.etchingPosition))), PropertyKeys.ETCHING_POSITION_RANGE));
            k.push(createProperty(PropertyKeys.CONDENSE_WHITE, this._Str_2309.condenseWhite));
            k.push(new PropertyStruct(PropertyKeys.FONT_FACE, this.defaultTextFormat.font, PropertyStruct.STRING, (!(this.defaultTextFormat.font == _local_2.fontFamily))));
            k.push(new PropertyStruct(PropertyKeys.FONT_SIZE, this.defaultTextFormat.size, PropertyStruct.UINT, (!(this.defaultTextFormat.size == _local_2.fontSize))));
            k.push(createProperty(PropertyKeys.GRID_FIT_TYPE, this._Str_2309.gridFitType));
            var _local_3:uint = uint(((_local_2.color != null) ? _local_2.color : getDefaultProperty(PropertyKeys.TEXT_COLOR).value));
            k.push(new PropertyStruct(PropertyKeys.TEXT_COLOR, this._Str_2309.textColor, PropertyStruct.HEX, (!(this._Str_2309.textColor == _local_3))));
            k.push(createProperty(PropertyKeys.TEXT_STYLE, this._Str_4040));
            k.push(createProperty(PropertyKeys.MARGIN_LEFT, this._Str_2480.left));
            k.push(createProperty(PropertyKeys.MARGIN_TOP, this._Str_2480.top));
            k.push(createProperty(PropertyKeys.MARGIN_RIGHT, this._Str_2480.right));
            k.push(createProperty(PropertyKeys.MARGIN_BOTTOM, this._Str_2480.bottom));
            k.push(createProperty(PropertyKeys.MOUSE_WHEEL_ENABLED, this._Str_2309.mouseWheelEnabled));
            k.push(createProperty(PropertyKeys.MAX_CHARS, this._Str_2309.maxChars));
            k.push(createProperty(PropertyKeys.MULTILINE, this._Str_2309.multiline));
            k.push(createProperty(PropertyKeys.RESTRICT, this._Str_2309.restrict));
            k.push(new PropertyStruct(PropertyKeys.SHARPNESS, this._Str_2309.sharpness, PropertyStruct.NUMBER, (!(this._Str_2309.sharpness == _local_2.sharpness))));
            k.push(new PropertyStruct(PropertyKeys.THICKNESS, this._Str_2309.thickness, PropertyStruct.NUMBER, (!(this._Str_2309.thickness == _local_2.thickness))));
            k.push(createProperty(PropertyKeys.WORD_WRAP, this._Str_2309.wordWrap));
            k.push(createProperty(PropertyKeys.MAX_LINES, this._Str_9760));
            k.push(createProperty(PropertyKeys.OVERFLOW_REPLACE, this._Str_15348));
            k.push(new PropertyStruct(PropertyKeys.BOLD, (!(this._Str_2309.defaultTextFormat.bold == false)), PropertyStruct.BOOLEAN, (!(this._Str_2309.defaultTextFormat.bold == (_local_2.fontWeight == FontStyle.BOLD)))));
            k.push(new PropertyStruct(PropertyKeys.ITALIC, (!(this._Str_2309.defaultTextFormat.italic == false)), PropertyStruct.BOOLEAN, (!(this._Str_2309.defaultTextFormat.italic == (_local_2.fontStyle == FontStyle.ITALIC)))));
            k.push(new PropertyStruct(PropertyKeys.UNDERLINE, (!(this._Str_2309.defaultTextFormat.underline == false)), PropertyStruct.BOOLEAN, (!(this._Str_2309.defaultTextFormat.underline == (_local_2.textDecoration == "underline")))));
            k.push(new PropertyStruct(PropertyKeys.KERNING, (!(this._Str_2309.defaultTextFormat.kerning == false)), PropertyStruct.BOOLEAN, (!(this._Str_2309.defaultTextFormat.kerning == _local_2.kerning))));
            k.push(new PropertyStruct(PropertyKeys.SPACING, this._Str_2309.defaultTextFormat.letterSpacing, PropertyStruct.NUMBER, (!(this._Str_2309.defaultTextFormat.letterSpacing == _local_2.letterSpacing))));
            k.push(new PropertyStruct(PropertyKeys.LEADING, this._Str_2309.defaultTextFormat.leading, PropertyStruct.NUMBER, (!(this._Str_2309.defaultTextFormat.leading == _local_2.leading))));
            return k;
        }

        public function get etchingColor():uint
        {
            return this._Str_3778;
        }

        public function set etchingColor(k:uint):void
        {
            _Str_16906(this, k);
        }

        public function set styleSheet(k:StyleSheet):void
        {
            this._Str_25457(this, k);
        }

        private function _Str_25457(k:TextController, _arg_2:StyleSheet):void
        {
            k._Str_2309.styleSheet = _arg_2;
            this.refreshTextImage();
        }

        public function get etchingPosition():String
        {
            return this._Str_5717;
        }

        public function set etchingPosition(k:String):void
        {
            _Str_18207(this, k);
        }

        public function resetExplicitStyle():void
        {
            this._Str_3808 = new TextStyle();
        }
    }
}
