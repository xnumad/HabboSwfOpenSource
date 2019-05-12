package com.sulake.core.window.graphics
{
    import com.sulake.core.utils.Map;
    import com.sulake.core.utils.XMLVariableParser;
    import flash.utils.Dictionary;
    import com.sulake.core.window.graphics.renderer.ISkinRenderer;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.window.graphics.renderer.SkinLayout;
    import com.sulake.core.window.graphics.renderer.SkinLayoutEntity;
    import flash.geom.Rectangle;
    import com.sulake.core.window.graphics.renderer.BitmapSkinTemplate;
    import com.sulake.core.window.graphics.renderer.BitmapSkinTemplateEntity;
    import com.sulake.core.window.graphics.renderer.ISkinLayout;
    import com.sulake.core.window.enum.WindowState;
    import com.sulake.core.window.graphics.renderer.*;

    public class BitmapSkinParser 
    {
        public static const _Str_3752:String = "default"; //"_Str_26452";
        public static const ACTIVE:String = "active";
        public static const FOCUSED:String = "focused";
        public static const HOVERING:String = "hovering";
        public static const SELECTED:String = "selected";
        public static const PRESSED:String = "pressed";
        public static const DISABLED:String = "disabled";
        public static const LOCKED:String = "locked";


        public static function _Str_24598(k:XML, _arg_2:XMLList, _arg_3:ISkinRenderer, _arg_4:String, _arg_5:IAssetLibrary):void
        {
            var _local_12:XML;
            var _local_13:XMLList;
            var _local_14:XMLList;
            var _local_15:uint;
            var _local_16:uint;
            var _local_17:XML;
            var _local_18:XMLList;
            var _local_19:uint;
            var _local_20:uint;
            var _local_21:uint;
            var _local_22:XML;
            var _local_6:Map = new Map();
            var _local_7:XMLList = k.child("variables");
            if (_local_7.length() > 0)
            {
                _local_12 = _local_7[0];
                _local_13 = _local_12.child("variable");
                if (_local_13.length())
                {
                    XMLVariableParser.parseVariableList(_local_13, _local_6);
                }
            }
            var _local_8:Dictionary = new Dictionary();
            var _local_9:XMLList = k.child("templates");
            if (_local_9[0])
            {
                _Str_21258(_arg_3, _local_9[0], _local_8, _local_6, _arg_5);
            }
            var _local_10:Dictionary = new Dictionary();
            var _local_11:XMLList = k.child("layouts");
            if (_local_11[0])
            {
                if (_arg_4 == null)
                {
                    _Str_20069(_arg_3, _local_11[0], _local_10, _local_6);
                }
                else
                {
                    _local_14 = _local_11[0].child("layout");
                    _local_15 = _local_14.length();
                    _local_16 = 0;
                    while (_local_16 < _local_15)
                    {
                        _local_17 = _local_14[_local_16];
                        if (_local_17.attribute("name") == _arg_4)
                        {
                            _Str_14183(_arg_3, _local_17, _local_10, _local_6);
                            break;
                        }
                        _local_16++;
                    }
                }
            }
            if (_arg_2.length() == 0)
            {
                _arg_2 = k.child("states");
            }
            if (_arg_2.length() > 0)
            {
                if (_arg_4 == null)
                {
                    _Str_20407(_arg_3, _arg_2[0], _local_10, _local_6);
                }
                else
                {
                    _local_18 = _arg_2[0].child("state");
                    _local_19 = _local_18.length();
                    _local_20 = 0;
                    _local_21 = 0;
                    while (_local_21 < _local_19)
                    {
                        _local_22 = _local_18[_local_21];
                        if (_local_22.attribute("layout") == _arg_4)
                        {
                            _Str_14229(_arg_3, _local_22, _local_10, _local_6);
                            _local_20++;
                        }
                        _local_21++;
                    }
                }
            }
        }

        protected static function _Str_14183(k:ISkinRenderer, _arg_2:XML, _arg_3:Dictionary, _arg_4:Map):void
        {
            var _local_10:XML;
            var _local_11:XMLList;
            var _local_5:String = _arg_2.attribute("name");
            var _local_6:* = (_arg_2.attribute("transparent") == "true");
            var _local_7:String = _arg_2.attribute("blendMode");
            var _local_8:SkinLayout = new SkinLayout(_local_5, _local_6, _local_7);
            var _local_9:XMLList = _arg_2.child("entities");
            if (_local_9.length() > 0)
            {
                _local_10 = _local_9[0];
                _local_11 = _local_10.child("entity");
                if (_local_11.length())
                {
                    _Str_20380(k, _local_8, _local_11, _arg_4);
                }
            }
            _arg_3[_local_5] = _local_8;
            k._Str_20341(_local_8);
        }

        protected static function _Str_20069(k:ISkinRenderer, _arg_2:XML, _arg_3:Dictionary, _arg_4:Map):void
        {
            var _local_8:XML;
            var _local_5:XMLList = _arg_2.child("layout");
            var _local_6:uint = _local_5.length();
            var _local_7:uint;
            while (_local_7 < _local_6)
            {
                _local_8 = _local_5[_local_7];
                _Str_14183(k, _local_8, _arg_3, _arg_4);
                _local_7++;
            }
        }

        protected static function _Str_21102(k:XML, _arg_2:Map):SkinLayoutEntity
        {
            var _local_3:uint;
            var _local_4:String;
            var _local_5:SkinLayoutEntity;
            var _local_6:String;
            var _local_7:XML;
            var _local_8:XMLList;
            _local_6 = k.attribute("id");
            _local_3 = ((_local_6 == null) ? 0 : uint(_local_6));
            _local_6 = k.attribute("name");
            _local_4 = ((_local_6 == null) ? "" : _local_6);
            _local_5 = new SkinLayoutEntity(_local_3, _local_4);
            _local_6 = k.attribute("colorize");
            _local_5.colorize = ((_local_6 == "") ? true : (_local_6 == "true"));
            _local_6 = null;
            _local_8 = k.child("color");
            if (_local_8.length() > 0)
            {
                _local_7 = _local_8[0];
                _local_6 = String(_local_7);
                if (_local_6 != null)
                {
                    if (_local_6.charAt(0) == "$")
                    {
                        _local_6 = _arg_2[_local_6.slice(1, _local_6.length)];
                    }
                }
            }
            _local_5.color = ((_local_6 == null) ? 0 : uint(_local_6));
            _local_6 = null;
            _local_8 = k.child("blend");
            if (_local_8.length() > 0)
            {
                _local_7 = _local_8[0];
                _local_6 = String(_local_7);
                if (_local_6 != null)
                {
                    if (_local_6.charAt(0) == "$")
                    {
                        _local_6 = _arg_2[_local_6.slice(1, _local_6.length)];
                    }
                }
            }
            _local_5.blend = ((_local_6 == null) ? 0xFFFFFFFF : uint(_local_6));
            _local_8 = k.child("scale");
            if (_local_8.length() > 0)
            {
                _local_7 = _local_8[0];
                _local_6 = _local_7.attribute("horizontal");
                if (_local_6 != null)
                {
                    if (_local_6.charAt(0) == "$")
                    {
                        _local_6 = _arg_2[_local_6.slice(1, _local_6.length)];
                    }
                }
                switch (_local_6.toLowerCase())
                {
                    case "fixed":
                        _local_5.scaleH = SkinLayoutEntity.SCALE_TYPE_FIXED;
                        break;
                    case "move":
                        _local_5.scaleH = SkinLayoutEntity.SCALE_TYPE_MOVE;
                        break;
                    case "strech":
                        _local_5.scaleH = SkinLayoutEntity.SCALE_TYPE_STRECH;
                        break;
                    case "tiled":
                        _local_5.scaleH = SkinLayoutEntity.SCALE_TYPE_TILED;
                        break;
                    case "center":
                        _local_5.scaleH = SkinLayoutEntity.SCALE_TYPE_CENTER;
                        break;
                }
                _local_6 = _local_7.attribute("vertical");
                if (_local_6 != null)
                {
                    if (_local_6.charAt(0) == "$")
                    {
                        _local_6 = _arg_2[_local_6.slice(1, _local_6.length)];
                    }
                }
                switch (_local_6.toLowerCase())
                {
                    case "fixed":
                        _local_5.scaleV = SkinLayoutEntity.SCALE_TYPE_FIXED;
                        break;
                    case "move":
                        _local_5.scaleV = SkinLayoutEntity.SCALE_TYPE_MOVE;
                        break;
                    case "strech":
                        _local_5.scaleV = SkinLayoutEntity.SCALE_TYPE_STRECH;
                        break;
                    case "tiled":
                        _local_5.scaleV = SkinLayoutEntity.SCALE_TYPE_TILED;
                        break;
                    case "center":
                        _local_5.scaleV = SkinLayoutEntity.SCALE_TYPE_CENTER;
                        break;
                }
            }
            _local_8 = k.child("region");
            if (_local_8.length() > 0)
            {
                _local_7 = _local_8[0];
                _local_8 = _local_7.child("Rectangle");
                _local_7 = _local_8[0];
                _local_5.region = new Rectangle();
                _local_6 = _local_7.attribute("x");
                _local_5.region.x = Number(((_local_6.charAt(0) == "$") ? _arg_2[_local_6.slice(1, _local_6.length)] : _local_6));
                _local_6 = _local_7.attribute("y");
                _local_5.region.y = Number(((_local_6.charAt(0) == "$") ? _arg_2[_local_6.slice(1, _local_6.length)] : _local_6));
                _local_6 = _local_7.attribute("width");
                _local_5.region.width = Number(((_local_6.charAt(0) == "$") ? _arg_2[_local_6.slice(1, _local_6.length)] : _local_6));
                _local_6 = _local_7.attribute("height");
                _local_5.region.height = Number(((_local_6.charAt(0) == "$") ? _arg_2[_local_6.slice(1, _local_6.length)] : _local_6));
            }
            return _local_5;
        }

        protected static function _Str_20380(k:ISkinRenderer, _arg_2:SkinLayout, _arg_3:XMLList, _arg_4:Map):void
        {
            var _local_5:SkinLayoutEntity;
            var _local_6:uint;
            var _local_7:uint = _arg_3.length();
            _local_6 = 0;
            while (_local_6 < _local_7)
            {
                _local_5 = _Str_21102(_arg_3[_local_6], _arg_4);
                if (_local_5 != null)
                {
                    _arg_2.addChild(_local_5);
                }
                _local_6++;
            }
        }

        protected static function _Str_21258(k:ISkinRenderer, _arg_2:XML, _arg_3:Dictionary, _arg_4:Map, _arg_5:IAssetLibrary):void
        {
            var _local_9:XML;
            var _local_10:String;
            var _local_11:String;
            var _local_12:BitmapSkinTemplate;
            var _local_13:XMLList;
            var _local_14:XML;
            var _local_15:XMLList;
            var _local_6:XMLList = _arg_2.child("template");
            var _local_7:uint = _local_6.length();
            var _local_8:uint;
            while (_local_8 < _local_7)
            {
                _local_9 = _local_6[_local_8];
                _local_10 = _local_9.attribute("name");
                if (_local_10 != null)
                {
                    if (_local_10.charAt(0) == "$")
                    {
                        _local_10 = _arg_4[_local_10.slice(1, _local_10.length)];
                    }
                }
                _local_11 = _local_9.attribute("asset");
                if (_local_11 != null)
                {
                    if (_local_11.charAt(0) == "$")
                    {
                        _local_11 = _arg_4[_local_11.slice(1, _local_11.length)];
                    }
                }
                _local_12 = new BitmapSkinTemplate(_local_10, _arg_5.getAssetByName(_local_11));
                _local_13 = _local_9.child("entities");
                if (_local_13.length() > 0)
                {
                    _local_14 = _local_13[0];
                    _local_15 = _local_14.child("entity");
                    if (_local_15.length())
                    {
                        _Str_20083(k, _local_12, _local_15, _arg_4);
                    }
                }
                _arg_3[_local_10] = _local_12;
                k._Str_21576(_local_12);
                _local_8++;
            }
        }

        protected static function _Str_20083(k:ISkinRenderer, _arg_2:BitmapSkinTemplate, _arg_3:XMLList, _arg_4:Map):void
        {
            var _local_5:XML;
            var _local_6:XMLList;
            var _local_7:XML;
            var _local_8:XMLList;
            var _local_9:XML;
            var _local_10:String;
            var _local_11:String;
            var _local_12:String;
            var _local_13:uint;
            var _local_14:Rectangle;
            var _local_16:int;
            var _local_15:int = _arg_3.length();
            _local_16 = 0;
            while (_local_16 < _local_15)
            {
                _local_5 = _arg_3[_local_16];
                _local_10 = _local_5.attribute("name");
                _local_11 = ((_local_10.charAt(0) == "$") ? _arg_4[_local_10.slice(1, _local_10.length)] : _local_10);
                _local_10 = _local_5.attribute("type");
                _local_12 = ((_local_10.charAt(0) == "$") ? _arg_4[_local_10.slice(1, _local_10.length)] : _local_10);
                _local_10 = _local_5.attribute("id");
                _local_13 = uint(((_local_10.charAt(0) == "$") ? _arg_4[_local_10.slice(1, _local_10.length)] : _local_10));
                _local_6 = _local_5.child("region");
                if (_local_6.length() > 0)
                {
                    _local_7 = _local_6[0];
                    _local_6 = _local_7.child("Rectangle");
                    _local_7 = _local_6[0];
                    _local_14 = new Rectangle();
                    _local_10 = _local_7.attribute("x");
                    _local_14.x = Number(((_local_10.charAt(0) == "$") ? _arg_4[_local_10.slice(1, _local_10.length)] : _local_10));
                    _local_10 = _local_7.attribute("y");
                    _local_14.y = Number(((_local_10.charAt(0) == "$") ? _arg_4[_local_10.slice(1, _local_10.length)] : _local_10));
                    _local_10 = _local_7.attribute("width");
                    _local_14.width = Number(((_local_10.charAt(0) == "$") ? _arg_4[_local_10.slice(1, _local_10.length)] : _local_10));
                    _local_10 = _local_7.attribute("height");
                    _local_14.height = Number(((_local_10.charAt(0) == "$") ? _arg_4[_local_10.slice(1, _local_10.length)] : _local_10));
                }
                _arg_2.addChild(new BitmapSkinTemplateEntity(_local_11, _local_12, _local_13, _local_14));
                _local_16++;
            }
        }

        protected static function _Str_14229(k:ISkinRenderer, _arg_2:XML, _arg_3:Dictionary, _arg_4:Map):void
        {
            var _local_11:XML;
            var _local_12:XMLList;
            var _local_13:Map;
            var _local_14:String;
            var _local_15:Object;
            var _local_5:String = _arg_2.attribute("name");
            if (_local_5.charAt(0) == "$")
            {
                _local_5 = _arg_4[_local_5.slice(1, _local_5.length)];
            }
            var _local_6:String = _arg_2.attribute("layout");
            if (_local_6.charAt(0) == "$")
            {
                _local_6 = _arg_4[_local_6.slice(1, _local_6.length)];
            }
            var _local_7:String = _arg_2.attribute("template");
            if (_local_7.charAt(0) == "$")
            {
                _local_7 = _arg_4[_local_7.slice(1, _local_7.length)];
            }
            var _local_8:ISkinLayout = _arg_3[_local_6];
            if (_local_8 == null)
            {
                throw (new Error((((("State " + _local_5) + " has invalid layout reference ") + _local_6) + "!")));
            }
            var _local_9:XMLList = _arg_2.child("variables");
            if (_local_9.length() > 0)
            {
                _local_11 = _local_9[0];
                _local_12 = _local_11.child("variable");
                if (_local_12.length())
                {
                    _local_13 = new Map();
                    XMLVariableParser.parseVariableList(_local_12, _local_13);
                    for (_local_14 in _local_13)
                    {
                        _local_15 = _local_13[_local_14];
                        if ((_local_15 is String))
                        {
                            if (String(_local_15).charAt(0) == "$")
                            {
                                _local_15 = _arg_4[_local_15.slice(1, _local_15.length)];
                                _local_13[_local_14] = _local_15;
                            }
                        }
                    }
                }
            }
            var _local_10:uint = WindowState.DEFAULT;
            switch (_local_5)
            {
                case BitmapSkinParser.ACTIVE:
                    _local_10 = WindowState.ACTIVE;
                    break;
                case BitmapSkinParser._Str_3752:
                    _local_10 = WindowState.DEFAULT;
                    break;
                case BitmapSkinParser.FOCUSED:
                    _local_10 = WindowState.FOCUSED;
                    break;
                case BitmapSkinParser.DISABLED:
                    _local_10 = WindowState.DISABLED;
                    break;
                case BitmapSkinParser.HOVERING:
                    _local_10 = WindowState.HOVERING;
                    break;
                case BitmapSkinParser.PRESSED:
                    _local_10 = WindowState.PRESSED;
                    break;
                case BitmapSkinParser.SELECTED:
                    _local_10 = WindowState.SELECTED;
                    break;
                case BitmapSkinParser.LOCKED:
                    _local_10 = WindowState.LOCKED;
                    break;
                default:
                    throw (new Error((('Unknown window state: "' + _local_5) + '"!')));
            }
            k._Str_21977(_local_10, _local_6);
            k._Str_19639(_local_10, _local_7);
        }

        protected static function _Str_20407(k:ISkinRenderer, _arg_2:XML, _arg_3:Dictionary, _arg_4:Map):void
        {
            var _local_5:XMLList = _arg_2.child("state");
            var _local_6:uint = _local_5.length();
            var _local_7:uint;
            while (_local_7 < _local_6)
            {
                _Str_14229(k, _local_5[_local_7], _arg_3, _arg_4);
                _local_7++;
            }
        }
    }
}
