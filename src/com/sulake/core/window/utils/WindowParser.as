package com.sulake.core.window.utils
{
    import flash.utils.Dictionary;
    import com.sulake.core.utils.Map;
    import com.sulake.core.window.IWindowContext;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.utils.XMLVariableParser;
    import com.sulake.core.window.WindowController;
    import flash.geom.Rectangle;
    import flash.filters.BitmapFilter;
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.core.window.components.IBoxSizerWindow;
    import flash.filters.DropShadowFilter;
    import flash.utils.*;

    public class WindowParser implements IWindowParser 
    {
        public static const _EXCLUDE:String = "_EXCLUDE";
        public static const _INCLUDE:String = "_INCLUDE";
        public static const _TEMP:String = "_TEMP";
        private static const LAYOUT:String = "layout";
        private static const WINDOW:String = "window";
        private static const VARIABLES:String = "variables";
        private static const FILTERS:String = "filters";
        private static const NAME:String = "name";
        private static const STYLE:String = "style";
        private static const DYNAMIC_STYLE:String = "dynamic_style";
        private static const PARAMS:String = "params";
        private static const TAGS:String = "tags";
        private static const X:String = "x";
        private static const Y:String = "y";
        private static const WIDTH:String = "width";
        private static const HEIGHT:String = "height";
        private static const VISIBLE:String = "visible";
        private static const CAPTION:String = "caption";
        private static const ID:String = "id";
        private static const BACKGROUND:String = "background";
        private static const BLEND:String = "blend";
        private static const CLIPPING:String = "clipping";
        private static const COLOR:String = "color";
        private static const TRESHOLD:String = "treshold";
        private static const CHILDREN:String = "children";
        private static const WIDTH_MIN:String = "width_min";
        private static const WIDTH_MAX:String = "width_max";
        private static const HEIGHT_MIN:String = "height_min";
        private static const HEIGHT_MAX:String = "height_max";
        private static const TRUE:String = "true";
        private static const _Str_3625:String = "0";
        private static const _Str_17504:String = "$";
        private static const COMMA:String = ",";
        private static const EMPTY:String = "";
        private static const _Str_18567:RegExp = /^(\s|\n|\r|\t|\v)*/m;
        private static const _Str_16066:RegExp = /(\s|\n|\r|\t|\v)*$/;

        protected var _typeStringToCodeTable:Dictionary;
        protected var _typeCodeToStringTable:Dictionary;
        protected var _paramStringToCodeTable:Dictionary;
        protected var _paramCoreToStringTable:Dictionary;
        protected var _parsedLayoutCache:Map;
        protected var _context:IWindowContext;
        private var _disposed:Boolean = false;

        public function WindowParser(context:IWindowContext)
        {
            this._context = context;
            this._typeStringToCodeTable = new Dictionary();
            this._typeCodeToStringTable = new Dictionary();
            TypeCodeTable.fillTables(this._typeStringToCodeTable, this._typeCodeToStringTable);
            this._paramStringToCodeTable = new Dictionary();
            this._paramCoreToStringTable = new Dictionary();
            ParamCodeTable._Str_8871(this._paramStringToCodeTable, this._paramCoreToStringTable);
            this._parsedLayoutCache = new Map();
        }

        private static function filterToXmlString(k:String):String
        {
            k = k.replace(_Str_16066, EMPTY);
            k = k.replace(_Str_18567, EMPTY);
            return k;
        }


        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function dispose():void
        {
            var key:Object;
            if (!this._disposed)
            {
                for (key in this._typeStringToCodeTable)
                {
                    delete this._typeStringToCodeTable[key];
                }
                for (key in this._typeCodeToStringTable)
                {
                    delete this._typeCodeToStringTable[key];
                }
                for (key in this._paramStringToCodeTable)
                {
                    delete this._paramStringToCodeTable[key];
                }
                for (key in this._paramCoreToStringTable)
                {
                    delete this._paramCoreToStringTable[key];
                }
                this._parsedLayoutCache.dispose();
                this._parsedLayoutCache = null;
                this._context = null;
                this._disposed = true;
            }
        }

        public function parseAndConstruct(xml:XML, window:IWindow, variableList:Map):IWindow
        {
            var children:XMLList;
			var i:uint = 0;
			var singleWindowEntity:IWindow;
            if (xml.localName() == LAYOUT)
            {
            	var variables:XMLList = xml.child(VARIABLES);
                if (variables.length() > 0)
                {
            		var firstVariable:XML = variables[0];
                    var childVariables:XMLList = XML(firstVariable[0]).children();
                    if (childVariables.length() > 0)
                    {
                        if (variableList == null)
                        {
                            variableList = new Map();
                        }
                        XMLVariableParser.parseVariableList(childVariables, variableList);
                    }
                }
                var filters:XMLList = xml.child(FILTERS).children();
                if (filters.length() > 0)
                {
                    var windowFilters:Array = new Array();
                    for (i = 0; i < filters.length(); i++ )
                    {
                        windowFilters.push(this._Str_20744(filters[i]));
                    }
                    window.filters = windowFilters;
                }
                children = xml.child(WINDOW);
                switch (children.length())
                {
                    case 0:
                        return null;
                    case 1:
                        xml = children[0];
                        break;
                    default:
                        for (i = 0; i < children.length(); i++)
                        {
                            singleWindowEntity = this.parseSingleWindowEntity(children[i], WindowController(window), variableList);
                        }
                        return singleWindowEntity;
                }
            }
            if (xml.localName() == WINDOW)
            {
                children = xml.children();
                if (children.length() > 1)
                {
                    for (i = 0; i < children.length(); i++)
                    {
                        singleWindowEntity = this.parseSingleWindowEntity(children[i], WindowController(window), variableList);
                    }
                    return singleWindowEntity;
                }
                xml = xml.children()[0];
            }
            return (xml != null) ? this.parseSingleWindowEntity(xml, WindowController(window), variableList) : null;
        }

        private function parseSingleWindowEntity(xml:XML, window:WindowController, variableList:Map):IWindow
        {
            var _local_4:WindowController;
            var _local_19:XML;
            var _local_20:XMLList;
            var _local_21:uint;
            var _local_23:uint;
            var _local_24:Array;
            var _local_26:String;
            var _local_27:Array;
            var _local_28:BitmapFilter;
            var _local_29:IIterator;
            var _local_7:String = EMPTY;
            var _local_9:Boolean = true;
            var _local_10:String = "0x00ffffff";
            var _local_11:Number = 1;
            var _local_12:Boolean;
            var _local_13:uint = 10;
			
            var typeCode:uint = this._typeStringToCodeTable[xml.localName()];
            var unescapedXml:String = unescape(String(this.parseAttribute(xml, NAME, variableList, "")));
			var windowStyle:uint = ((window != null) ? window.style : 0);
            windowStyle = uint(this.parseAttribute(xml, STYLE, variableList, windowStyle));
            var dynamicStyle:String = String(this.parseAttribute(xml, DYNAMIC_STYLE, variableList, ""));
            var _local_16:uint = uint(this.parseAttribute(xml, PARAMS, variableList, 0));
            var _local_18:String = unescape(String(this.parseAttribute(xml, TAGS, variableList, EMPTY)));
            var _local_17:Rectangle = new Rectangle();
            _local_17.x = Number(this.parseAttribute(xml, X, variableList, _Str_3625));
            _local_17.y = Number(this.parseAttribute(xml, Y, variableList, _Str_3625));
            _local_17.width = Number(this.parseAttribute(xml, WIDTH, variableList, _Str_3625));
            _local_17.height = Number(this.parseAttribute(xml, HEIGHT, variableList, _Str_3625));
            var _local_8:Boolean = (this.parseAttribute(xml, VISIBLE, variableList, "true") == TRUE);
            var _local_22:int = int(this.parseAttribute(xml, ID, variableList, "0"));
            if (xml.child(PARAMS).length() > 0)
            {
                _local_20 = xml.child(PARAMS).children();
                _local_21 = _local_20.length();
                _local_23 = 0;
                while (_local_23 < _local_21)
                {
                    _local_19 = _local_20[_local_23];
                    _local_26 = (this.parseAttribute(_local_19, NAME, variableList, "") as String);
                    if (this._paramStringToCodeTable[_local_26] != null)
                    {
                        _local_16 = (_local_16 | this._paramStringToCodeTable[_local_26]);
                    }
                    else
                    {
                        throw (new Error((('Unknown window parameter "' + String(_local_19.attribute(NAME))) + '"!')));
                    }
                    _local_23++;
                }
            }
            _local_7 = ((_local_16 & WindowParam.WINDOW_PARAM_INHERIT_CAPTION) ? ((window) ? window.caption : EMPTY) : EMPTY);
            _local_7 = unescape(String(this.parseAttribute(xml, CAPTION, variableList, _local_7)));
            if (_local_18 != EMPTY)
            {
                _local_24 = _local_18.split(COMMA);
                _local_21 = _local_24.length;
                _local_23 = 0;
                while (_local_23 < _local_21)
                {
                    _local_24[_local_23] = WindowParser.filterToXmlString(_local_24[_local_23]);
                    _local_23++;
                }
            }
            _local_4 = (this._context.create(unescapedXml, null, typeCode, windowStyle, _local_16, _local_17, null, ((window is IIterable) ? null : (window)), _local_22, this.parseProperties(xml.child(VARIABLES)[0]), dynamicStyle, _local_24) as WindowController);
            if (this.hasAttribute(xml, WIDTH_MIN))
            {
                _local_4.limits.minWidth = int(this.parseAttribute(xml, WIDTH_MIN, variableList, _local_4.limits.minWidth));
            }
            if (this.hasAttribute(xml, WIDTH_MAX))
            {
                _local_4.limits.maxWidth = int(this.parseAttribute(xml, WIDTH_MAX, variableList, _local_4.limits.maxWidth));
            }
            if (this.hasAttribute(xml, HEIGHT_MIN))
            {
                _local_4.limits.minHeight = int(this.parseAttribute(xml, HEIGHT_MIN, variableList, _local_4.limits.minHeight));
            }
            if (this.hasAttribute(xml, HEIGHT_MAX))
            {
                _local_4.limits.maxHeight = int(this.parseAttribute(xml, HEIGHT_MAX, variableList, _local_4.limits.maxHeight));
            }
            _local_4.limits.limit();
            _local_12 = (this.parseAttribute(xml, BACKGROUND, variableList, _local_4.background.toString()) == TRUE);
            _local_11 = Number(this.parseAttribute(xml, BLEND, variableList, _local_4.blend.toString()));
            _local_9 = (this.parseAttribute(xml, CLIPPING, variableList, _local_4.clipping.toString()) == TRUE);
            _local_10 = String(this.parseAttribute(xml, COLOR, variableList, _local_4.color.toString()));
            _local_13 = uint(this.parseAttribute(xml, TRESHOLD, variableList, _local_4.mouseThreshold.toString()));
            if (_local_4.caption != _local_7)
            {
                _local_4.caption = _local_7;
            }
            if (_local_4.blend != _local_11)
            {
                _local_4.blend = _local_11;
            }
            if (_local_4.visible != _local_8)
            {
                _local_4.visible = _local_8;
            }
            if (_local_4.clipping != _local_9)
            {
                _local_4.clipping = _local_9;
            }
            if (_local_4.background != _local_12)
            {
                _local_4.background = _local_12;
            }
            if (_local_4.mouseThreshold != _local_13)
            {
                _local_4.mouseThreshold = _local_13;
            }
            var _local_25:uint = ((_local_10.charAt(1) == X) ? parseInt(_local_10, 16) : uint(_local_10));
            if (_local_4.color != _local_25)
            {
                _local_4.color = _local_25;
            }
            _local_20 = xml.child(FILTERS).children();
            _local_21 = _local_20.length();
            if (_local_21 > 0)
            {
                _local_27 = new Array();
                _local_23 = 0;
                while (_local_23 < _local_21)
                {
                    _local_28 = (this._Str_20744(_local_20[_local_23]) as BitmapFilter);
                    if (_local_28 != null)
                    {
                        _local_27.push(_local_28);
                    }
                    _local_23++;
                }
                _local_4.filters = _local_27;
            }
            if (_local_4 != null)
            {
                if (window != null)
                {
                    if ((window is IIterable))
                    {
                        if (((((!(_local_4.x == _local_17.x)) || (!(_local_4.y == _local_17.y))) || (!(_local_4.width == _local_17.width))) || (!(_local_4.height == _local_17.height))))
                        {
                            if ((_local_16 & WindowParam.WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_CENTER) == WindowParam.WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_CENTER)
                            {
                                _local_4.x = _local_17.x;
                            }
                            if ((_local_16 & WindowParam.WINDOW_PARAM_RELATIVE_VERTICAL_SCALE_CENTER) == WindowParam.WINDOW_PARAM_RELATIVE_VERTICAL_SCALE_CENTER)
                            {
                                _local_4.y = _local_17.y;
                            }
                        }
                        try
                        {
                            _local_29 = IIterable(window).iterator;
                        }
                        catch(e:Error)
                        {
                        }
                        if (_local_29 != null)
                        {
                            _local_29[_local_29.length] = _local_4;
                        }
                        else
                        {
                            window.addChild(_local_4);
                        }
                    }
                }
            }
            _local_20 = xml.child(CHILDREN);
            if (_local_20.length() > 0)
            {
                _local_19 = _local_20[0];
                _local_20 = _local_19.children();
                _local_21 = _local_20.length();
                if ((_local_4 is IBoxSizerWindow))
                {
                    IBoxSizerWindow(_local_4)._Str_18113(false);
                }
                _local_23 = 0;
                while (_local_23 < _local_21)
                {
                    this.parseAndConstruct(_local_20[_local_23], _local_4, variableList);
                    _local_23++;
                }
            }
            if ((_local_4 is IBoxSizerWindow))
            {
                IBoxSizerWindow(_local_4)._Str_18113(true);
            }
            return _local_4;
        }

        private function hasAttribute(xml:XML, attribute:String):Boolean
        {
            return xml.attribute(attribute).length() > 0;
        }

        private function parseAttribute(k:XML, _arg_2:String, _arg_3:Map, _arg_4:Object):Object
        {
            var _local_5:XMLList = k.attribute(_arg_2);
            if (_local_5.length() == 0)
            {
                return _arg_4;
            }
            var _local_6:String = String(_local_5);
            if (_arg_3 != null)
            {
                if (_local_6.charAt(0) == _Str_17504)
                {
                    _local_6 = _arg_3[_local_6.slice(1, _local_6.length)];
                    if (_local_6 == null)
                    {
                        throw (new Error((('Shared variable not defined: "' + k.attribute(_arg_2)) + '"!')));
                    }
                }
            }
            return _local_6;
        }

        private function parseProperties(k:XML):Array
        {
            return (k != null) ? XMLPropertyArrayParser.parse(k.children()) : new Array();
        }

        public function windowToXMLString(k:IWindow):String
        {
            var _local_8:IIterator;
            var _local_10:IWindow;
            var _local_12:uint;
            var _local_14:PropertyStruct;
            var _local_15:BitmapFilter;
            var _local_16:String;
            var _local_17:Boolean;
            if (k.dynamicStyle.length < 3)
            {
                k.dynamicStyle = "";
            }
            if (k.dynamicStyle != "")
            {
                k.setParamFlag(WindowParam.WINDOW_PARAM_USE_PARENT_GRAPHIC_CONTEXT, false);
            }
            var _local_2:String = EMPTY;
            var _local_3:String = this._typeCodeToStringTable[k.type];
            var _local_4:uint = k.param;
            var _local_5:uint = k.style;
            var _local_6:IRectLimiter = k.limits;
            var _local_7:WindowController = (k as WindowController);
            _local_2 = (_local_2 + ((((((((((((((((((((((((((((((((((("<" + _local_3) + ' x="') + k.x) + '"') + ' y="') + k.y) + '"') + ' width="') + k.width) + '"') + ' height="') + k.height) + '"') + ' params="') + k.param) + '"') + ' style="') + k.style) + '"') + ((k.dynamicStyle != EMPTY) ? ((' dynamic_style="' + k.dynamicStyle) + '"') : EMPTY)) + ((k.name != EMPTY) ? ((' name="' + escape(k.name)) + '"') : EMPTY)) + ((k.caption != EMPTY) ? ((' caption="' + escape(k.caption)) + '"') : EMPTY)) + ((k.id != 0) ? ((' id="' + k.id.toString()) + '"') : EMPTY)) + ((k.color != 0xFFFFFF) ? ((((' color="' + "0x") + k.alpha.toString(16)) + k.color.toString(16)) + '"') : EMPTY)) + ((k.blend != 1) ? ((' blend="' + k.blend.toString()) + '"') : EMPTY)) + ((k.visible != true) ? ((' visible="' + k.visible.toString()) + '"') : EMPTY)) + ((k.clipping != true) ? ((' clipping="' + k.clipping.toString()) + '"') : EMPTY)) + ((k.background != false) ? ((' background="' + k.background.toString()) + '"') : EMPTY)) + ((k.mouseThreshold != 10) ? ((' treshold="' + k.mouseThreshold.toString()) + '"') : EMPTY)) + ((k.tags.length > 0) ? ((' tags="' + escape(k.tags.toString())) + '"') : EMPTY)) + ((_local_6.minWidth > int.MIN_VALUE) ? ((' width_min="' + _local_6.minWidth) + '"') : EMPTY)) + ((_local_6.maxWidth < int.MAX_VALUE) ? ((' width_max="' + _local_6.maxWidth) + '"') : EMPTY)) + ((_local_6.minHeight > int.MIN_VALUE) ? ((' height_min="' + _local_6.minHeight) + '"') : EMPTY)) + ((_local_6.maxHeight < int.MAX_VALUE) ? ((' height_max="' + _local_6.maxHeight) + '"') : EMPTY)) + ">\r"));
            if (((k.filters) && (k.filters.length > 0)))
            {
                _local_2 = (_local_2 + "\t<filters>\r");
                for each (_local_15 in k.filters)
                {
                    _local_2 = (_local_2 + (("\t\t" + this.buildBitmapFilter(_local_15)) + "\r"));
                }
                _local_2 = (_local_2 + "\t</filters>\r");
            }
            var _local_9:uint = _local_7.numChildren;
            var _local_11:String = EMPTY;
            if ((_local_7 is IIterable))
            {
                _local_8 = IIterable(_local_7).iterator;
                _local_9 = _local_8.length;
                if (_local_9 > 0)
                {
                    _local_12 = 0;
                    while (_local_12 < _local_9)
                    {
                        _local_10 = (_local_8[_local_12] as IWindow);
                        if (_local_10.tags.indexOf(WindowParser._EXCLUDE) == -1)
                        {
                            _local_11 = (_local_11 + this.windowToXMLString(_local_10));
                        }
                        _local_12++;
                    }
                }
            }
            else
            {
                _local_9 = _local_7.numChildren;
                if (_local_9 > 0)
                {
                    _local_12 = 0;
                    while (_local_12 < _local_9)
                    {
                        _local_10 = _local_7.getChildAt(_local_12);
                        if (_local_10.tags.indexOf(WindowParser._EXCLUDE) == -1)
                        {
                            _local_11 = (_local_11 + this.windowToXMLString(_local_10));
                        }
                        _local_12++;
                    }
                }
            }
            if (_local_11.length > 0)
            {
                _local_2 = (_local_2 + (("\t<children>\r" + _local_11) + "\t</children>\r"));
            }
            var _local_13:Array = k.properties;
            if (((!(_local_13 == null)) && (_local_13.length > 0)))
            {
                _local_16 = "\t<variables>\r";
                _local_17 = false;
                _local_12 = 0;
                while (_local_12 < _local_13.length)
                {
                    _local_14 = (_local_13[_local_12] as PropertyStruct);
                    if (_local_14.valid)
                    {
                        _local_16 = (_local_16 + (("\t\t" + _local_14.toXMLString()) + "\r"));
                        _local_17 = true;
                    }
                    _local_12++;
                }
                _local_16 = (_local_16 + "\t</variables>\r");
                if (_local_17)
                {
                    _local_2 = (_local_2 + _local_16);
                }
            }
            _local_2 = (_local_2 + (("</" + _local_3) + ">\r"));
            return _local_2;
        }

        private function _Str_20744(k:XML):BitmapFilter
        {
            var _local_3:BitmapFilter;
            var _local_2:String = (k.localName() as String);
            switch (_local_2)
            {
                case "DropShadowFilter":
                    _local_3 = new DropShadowFilter(Number(this.parseAttribute(k, "distance", null, "0")), Number(this.parseAttribute(k, "angle", null, "45")), uint(this.parseAttribute(k, "color", null, "0")), Number(this.parseAttribute(k, "alpha", null, "1")), Number(this.parseAttribute(k, "blurX", null, "0")), Number(this.parseAttribute(k, "blurY", null, "0")), Number(this.parseAttribute(k, "strength", null, "1")), int(this.parseAttribute(k, "quality", null, "1")), Boolean((this.parseAttribute(k, "inner", null, "false") == "true")), Boolean((this.parseAttribute(k, "knockout", null, "false") == "true")), Boolean((this.parseAttribute(k, "hideObject", null, "false") == "true")));
                    break;
            }
            return _local_3;
        }

        private function buildBitmapFilter(k:BitmapFilter):String
        {
            var _local_2:String;
            if ((k is DropShadowFilter))
            {
                _local_2 = "<DropShadowFilter";
                _local_2 = (_local_2 + ((DropShadowFilter(k).distance != 0) ? ((' distance="' + DropShadowFilter(k).distance) + '"') : ""));
                _local_2 = (_local_2 + ((DropShadowFilter(k).angle != 45) ? ((' angle="' + DropShadowFilter(k).angle) + '"') : ""));
                _local_2 = (_local_2 + ((DropShadowFilter(k).color != 0) ? ((' color="' + DropShadowFilter(k).color) + '"') : ""));
                _local_2 = (_local_2 + ((DropShadowFilter(k).alpha != 1) ? ((' alpha="' + DropShadowFilter(k).alpha) + '"') : ""));
                _local_2 = (_local_2 + ((DropShadowFilter(k).blurX != 0) ? ((' blurX="' + DropShadowFilter(k).blurX) + '"') : ""));
                _local_2 = (_local_2 + ((DropShadowFilter(k).blurY != 0) ? ((' blurY="' + DropShadowFilter(k).blurY) + '"') : ""));
                _local_2 = (_local_2 + ((DropShadowFilter(k).strength != 1) ? ((' strength="' + DropShadowFilter(k).strength) + '"') : ""));
                _local_2 = (_local_2 + ((DropShadowFilter(k).quality != 1) ? ((' quality="' + DropShadowFilter(k).quality) + '"') : ""));
                _local_2 = (_local_2 + ((DropShadowFilter(k).inner != false) ? ((' inner="' + DropShadowFilter(k).inner) + '"') : ""));
                _local_2 = (_local_2 + ((DropShadowFilter(k).knockout != false) ? ((' knockout="' + DropShadowFilter(k).knockout) + '"') : ""));
                _local_2 = (_local_2 + ((DropShadowFilter(k).hideObject != false) ? ((' hideObject="' + DropShadowFilter(k).hideObject) + '"') : ""));
                _local_2 = (_local_2 + " />");
            }
            return _local_2;
        }
    }
}
