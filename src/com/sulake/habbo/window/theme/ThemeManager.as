package com.sulake.habbo.window.theme
{
    import com.sulake.core.window.theme.IThemeManager;
    import flash.utils.Dictionary;
    import com.sulake.core.window.graphics.SkinContainer;
    import com.sulake.core.window.theme.PropertyMap;
    import com.sulake.core.window.theme.PropertyKeys;
    import flash.text.AntiAliasType;
    import flash.text.TextFieldAutoSize;
    import com.sulake.core.window.enum.Direction;
    import flash.text.GridFitType;
    import com.sulake.core.window.enum.LinkTarget;
    import com.sulake.core.window.enum.PivotPoint;
    import com.sulake.core.window.utils.TextStyleManager;
    import com.sulake.habbo.window.widgets.WidgetClasses;
    import com.sulake.habbo.window.widgets.IlluminaBorderWidget;
    import com.sulake.core.window.enum.WindowType;
    import com.sulake.core.window.theme.IPropertyMap;

    public class ThemeManager implements IThemeManager 
    {
        private static const THEMES:Array = [Theme.NONE, Theme.VOLTER, Theme.UBUNTU, Theme.ILLUMINA_LIGHT, Theme.ILLUMINA_DARK, Theme.ICON, Theme.LEGACY_BORDER];
        private static const LEGACY_STYLE_UPPER_BOUND:int = 100;

        private var _themes:Dictionary;
        private var _skinContainer:SkinContainer;

        public function ThemeManager(k:SkinContainer):void
        {
            var properties:PropertyMap;
            var propertyDefaults:PropertyMap;
            super();
            this._skinContainer = k;
            properties = new PropertyMap();
            properties.addBoolean(PropertyKeys.ALWAYS_SHOW_SELECTION, false);
            properties.addEnumeration(PropertyKeys.ANTIALIAS_TYPE, AntiAliasType.NORMAL, [AntiAliasType.NORMAL, AntiAliasType.ADVANCED]);
            properties.addString(PropertyKeys.ASSET_URI, null);
            properties.addBoolean(PropertyKeys.AUTO_ARRANGE_ITEMS, true);
            properties.addEnumeration(PropertyKeys.AUTO_SIZE, TextFieldAutoSize.NONE, [TextFieldAutoSize.NONE, TextFieldAutoSize.LEFT, TextFieldAutoSize.CENTER, TextFieldAutoSize.RIGHT]);
            properties.addString(PropertyKeys.BITMAP_ASSET_NAME, null);
            properties.addBoolean(PropertyKeys.BORDER, false);
            properties.addHex(PropertyKeys.BORDER_COLOR, 0);
            properties.addBoolean(PropertyKeys.CONDENSE_WHITE, false);
            properties.addBoolean(PropertyKeys.CONTAINER_RESIZE_TO_COLUMNS, false);
            properties.addEnumeration(PropertyKeys.DIRECTION, Direction.DOWN, [Direction.UP, Direction.DOWN, Direction.LEFT, Direction.RIGHT]);
            properties.addBoolean(PropertyKeys.DISPLAY_AS_PASSWORD, false);
            properties.addBoolean(PropertyKeys.DISPLAY_RAW, false);
            properties.addBoolean(PropertyKeys.EDITABLE, true);
            properties.addHex(PropertyKeys.ETCHING_COLOR, 0);
            properties.addBoolean(PropertyKeys.FIT_SIZE_TO_CONTENTS, false);
            properties.addBoolean(PropertyKeys.FOCUS_CAPTURER, false);
            properties.addBoolean(PropertyKeys.GREYSCALE, false);
            properties.addEnumeration(PropertyKeys.GRID_FIT_TYPE, GridFitType.PIXEL, [GridFitType.PIXEL, GridFitType.NONE, GridFitType.SUBPIXEL]);
            properties.addBoolean(PropertyKeys.HANDLE_BITMAP_DISPOSING, true);
            properties.addString(PropertyKeys.HELP_PAGE, "");
            properties.addEnumeration(PropertyKeys.LINK_TARGET, LinkTarget.DEFAULT, [LinkTarget.DEFAULT, LinkTarget.BLANK, LinkTarget.PARENT, LinkTarget.SELF, LinkTarget.TOP, LinkTarget.INTERNAL]);
            properties.addInt(PropertyKeys.SPACING, 0);
            properties.addInt(PropertyKeys.MARGIN_LEFT, 0);
            properties.addInt(PropertyKeys.MARGIN_TOP, 0);
            properties.addInt(PropertyKeys.MARGIN_RIGHT, 0);
            properties.addInt(PropertyKeys.MARGIN_BOTTOM, 0);
            properties.addInt(PropertyKeys.MAX_CHARS, 0);
            properties.addInt(PropertyKeys.MAX_LINES, 0);
            properties.addArray(PropertyKeys.MENU_ITEM_ARRAY, []);
            properties.addBoolean(PropertyKeys.MOUSE_WHEEL_ENABLED, true);
            properties.addBoolean(PropertyKeys.MULTILINE, false);
            properties.addEnumeration(PropertyKeys.PIVOT_POINT, PivotPoint.PIVOT_NAMES[PivotPoint.TOP_LEFT], PropertyKeys.PIVOT_POINT_RANGE);
            properties.addInt(PropertyKeys.POINTER_OFFSET, 0);
            properties.addBoolean(PropertyKeys.RESIZE_ON_ITEM_UPDATE, false);
            properties.addString(PropertyKeys.RESTRICT, null);
            properties.addBoolean(PropertyKeys.SCALE_TO_FIT_ITEMS, false);
            properties.addString(PropertyKeys.SCROLLABLE, "");
            properties.addNumber(PropertyKeys.SCROLL_STEP_HORIZONTAL, -1);
            properties.addNumber(PropertyKeys.SCROLL_STEP_VERTICAL, -1);
            properties.addBoolean(PropertyKeys.SELECTABLE, true);
            properties.addBoolean(PropertyKeys.STRETCHED_X, true);
            properties.addBoolean(PropertyKeys.STRETCHED_Y, true);
            properties.addHex(PropertyKeys.TEXT_COLOR, 0);
            properties.addEnumeration(PropertyKeys.TEXT_STYLE, TextStyleManager.REGULAR, TextStyleManager.getStyleNameArrayRef());
            properties.addString(PropertyKeys.TOOL_TIP_CAPTION, "");
            properties.addUint(PropertyKeys.TOOL_TIP_DELAY, 500);
            properties.addBoolean(PropertyKeys.TOOL_TIP_IS_DYNAMIC, false);
            properties.addBoolean(PropertyKeys.VERTICAL, false);
            properties.addEnumeration(PropertyKeys.WIDGET_TYPE, "", WidgetClasses._Str_10619);
            properties.addBoolean(PropertyKeys.WORD_WRAP, false);
            properties.addNumber(PropertyKeys.ZOOM_X, 1);
            properties.addNumber(PropertyKeys.ZOOM_Y, 1);
            properties.addBoolean(PropertyKeys.OPEN_UPWARD, false);
            properties.addBoolean(PropertyKeys.KEEP_OPEN_ON_DEACTIVATE, false);
            properties.addInt(PropertyKeys.PADDING_HORIZONTAL, 6);
            properties.addInt(PropertyKeys.PADDING_VERTICAL, 6);
            properties.addString(PropertyKeys.OVERFLOW_REPLACE, "");
            properties.addBoolean(PropertyKeys.WRAP_X, false);
            properties.addBoolean(PropertyKeys.WRAP_Y, false);
            properties.addEnumeration(IlluminaBorderWidget._Str_7804, IlluminaBorderWidget.ILLUMINA_LIGHT, IlluminaBorderWidget._Str_14195);
            this._themes = new Dictionary();
            this._themes[Theme.NONE] = new Theme(Theme.NONE, false, 0, uint.MAX_VALUE, properties);
            var iconCount:int;
            while (this._skinContainer._Str_20972(WindowType.WINDOW_TYPE_ICON, iconCount))
            {
                iconCount++;
            }
            this._themes[Theme.ICON] = new Theme(Theme.ICON, false, 0, iconCount, properties);
            var borderCount:int;
            while (((this._skinContainer._Str_20972(WindowType.WINDOW_TYPE_BORDER, borderCount)) && (borderCount < LEGACY_STYLE_UPPER_BOUND)))
            {
                borderCount++;
            }
            this._themes[Theme.LEGACY_BORDER] = new Theme(Theme.LEGACY_BORDER, false, 0, borderCount, properties);
            this._themes[Theme.VOLTER] = new Theme(Theme.VOLTER, true, 0, 3, properties.clone());
            propertyDefaults = properties.clone();
            propertyDefaults.addEnumeration(PropertyKeys.ANTIALIAS_TYPE, AntiAliasType.ADVANCED, [AntiAliasType.NORMAL, AntiAliasType.ADVANCED]);
            propertyDefaults.addEnumeration(PropertyKeys.TEXT_STYLE, "u_regular", TextStyleManager.getStyleNameArrayRef());
            this._themes[Theme.UBUNTU] = new Theme(Theme.UBUNTU, true, 3, 5, propertyDefaults);
            propertyDefaults = properties.clone();
            propertyDefaults.addEnumeration(PropertyKeys.ANTIALIAS_TYPE, AntiAliasType.ADVANCED, [AntiAliasType.NORMAL, AntiAliasType.ADVANCED]);
            properties.addHex(PropertyKeys.ETCHING_COLOR, 3003121663);
            propertyDefaults.addEnumeration(PropertyKeys.TEXT_STYLE, "il_regular", TextStyleManager.getStyleNameArrayRef());
            this._themes[Theme.ILLUMINA_LIGHT] = new Theme(Theme.ILLUMINA_LIGHT, true, 100, 100, propertyDefaults);
            propertyDefaults = propertyDefaults.clone();
            properties.addEnumeration(IlluminaBorderWidget._Str_7804, IlluminaBorderWidget.ILLUMINA_DARK, IlluminaBorderWidget._Str_14195);
            this._themes[Theme.ILLUMINA_DARK] = new Theme(Theme.ILLUMINA_DARK, true, 200, 100, propertyDefaults);
        }

        public function getStyle(k:String, _arg_2:uint, _arg_3:String):uint
        {
            var _local_6:uint;
            if (k == Theme.NONE)
            {
                return int(_arg_3);
            }
            var _local_4:Theme = this._themes[k];
            if (_local_4 == null)
            {
                return 0;
            }
            var _local_5:int;
            while (_local_5 < _local_4.styleCount)
            {
                _local_6 = (_local_4.baseStyle + _local_5);
                if (_arg_3 == this._skinContainer._Str_16505(_arg_2, _local_6))
                {
                    return _local_6;
                }
                _local_5++;
            }
            return _local_4.baseStyle;
        }

        public function getThemeAndIntent(k:uint, _arg_2:uint):Object
        {
            var _local_4:Theme;
            var _local_3:String = this._skinContainer._Str_16505(k, _arg_2);
            if (k == WindowType.WINDOW_TYPE_ICON)
            {
                return ({
                    "theme":Theme.ICON,
                    "intent":_local_3
                });
            }
            if (((k == WindowType.WINDOW_TYPE_BORDER) && (_arg_2 < LEGACY_STYLE_UPPER_BOUND)))
            {
                return ({
                    "theme":Theme.LEGACY_BORDER,
                    "intent":_local_3
                });
            }
            for each (_local_4 in this._themes)
            {
                if (((_local_4.isReal) && (_local_4.coversStyle(_arg_2))))
                {
                    return ({
                        "theme":_local_4.name,
                        "intent":_local_3
                    });
                }
            }
            return ({
                "theme":Theme.NONE,
                "intent":_local_3
            });
        }

        public function getIntents(k:uint, _arg_2:String, _arg_3:uint):Array
        {
            var _local_5:Theme;
            var _local_6:int;
            var _local_7:String;
            var _local_4:Array = [];
            if (_arg_2 != Theme.NONE)
            {
                _local_5 = this._themes[_arg_2];
                _local_6 = 0;
                while (_local_6 < _local_5.styleCount)
                {
                    _local_7 = this._skinContainer._Str_16505(k, (_local_5.baseStyle + _local_6));
                    if (_local_7 != null)
                    {
                        _local_4.push(_local_7);
                    }
                    _local_6++;
                }
            }
            if (_local_4.length == 0)
            {
                _local_4.push(_arg_3.toString());
            }
            return _local_4;
        }

        public function getPropertyDefaults(k:uint):IPropertyMap
        {
            var _local_2:PropertyMap;
            var _local_3:Theme;
            for each (_local_3 in this._themes)
            {
                if (((_local_3.isReal) && (_local_3.coversStyle(k))))
                {
                    _local_2 = _local_3.propertyDefaults;
                    break;
                }
            }
            if (_local_2 == null)
            {
                _local_2 = new PropertyMap();
            }
            return _local_2;
        }

        public function getThemes():Array
        {
            return THEMES;
        }
    }
}
