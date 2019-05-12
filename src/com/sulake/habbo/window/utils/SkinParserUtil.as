package com.sulake.habbo.window.utils
{
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.window.graphics.renderer.ISkinRenderer;
    import com.sulake.core.window.utils.DefaultAttStruct;
    import flash.utils.Dictionary;
    import com.sulake.core.window.utils.TypeCodeTable;
    import com.sulake.core.window.utils.StateCodeTable;
    import com.sulake.core.window.graphics.renderer.BitmapSkinRenderer;
    import com.sulake.core.window.graphics.renderer.BitmapDataRenderer;
    import com.sulake.core.window.graphics.renderer.FillSkinRenderer;
    import com.sulake.core.window.graphics.renderer.TextSkinRenderer;
    import com.sulake.core.window.graphics.renderer.LabelRenderer;
    import com.sulake.core.window.graphics.renderer.ShapeSkinRenderer;
    import com.sulake.core.window.graphics.renderer.SkinRenderer;
    import com.sulake.core.window.graphics.renderer.NullSkinRenderer;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.window.graphics.SkinContainer;

    public class SkinParserUtil 
    {
        private static const SKIN:String = "skin";
        private static const BITMAP:String = "bitmap";
        private static const FILL:String = "fill";
        private static const TEXT:String = "text";
        private static const LABEL:String = "label";
        private static const SHAPE:String = "shape";
        private static const UNKNOWN:String = "unknown";
        private static const NULL:String = "null";


        public static function parse(k:XML, _arg_2:IAssetLibrary, _arg_3:SkinContainer):void
        {
            var _local_9:XMLList;
            var _local_10:uint;
            var _local_11:XML;
            var _local_12:XMLList;
            var _local_13:String;
            var _local_14:String;
            var _local_15:uint;
            var _local_16:uint;
            var _local_17:String;
            var _local_18:String;
            var _local_19:IAsset;
            var _local_20:ISkinRenderer;
            var _local_21:String;
            var _local_22:Class;
            var _local_23:DefaultAttStruct;
            var _local_24:Array;
            var _local_25:String;
            var _local_26:IAsset;
            var _local_27:XML;
            var _local_28:String;
            var _local_29:uint;
            var _local_30:IAsset;
            var _local_4:Dictionary = new Dictionary();
            var _local_5:Dictionary = new Dictionary();
            TypeCodeTable.fillTables(_local_4, _local_5);
            var _local_6:Dictionary = new Dictionary();
            var _local_7:Dictionary = new Dictionary();
            StateCodeTable.fillTables(_local_6, _local_7);
            var _local_8:Dictionary = new Dictionary();
            _local_8[SKIN] = BitmapSkinRenderer;
            _local_8[BITMAP] = BitmapDataRenderer;
            _local_8[FILL] = FillSkinRenderer;
            _local_8[TEXT] = TextSkinRenderer;
            _local_8[LABEL] = LabelRenderer;
            _local_8[SHAPE] = ShapeSkinRenderer;
            _local_8[UNKNOWN] = SkinRenderer;
            _local_8[NULL] = NullSkinRenderer;
            if (k != null)
            {
                _local_9 = k.child("window");
                _local_10 = _local_9.length();
                _local_24 = [];
                if (_local_10 > 0)
                {
                    _local_29 = 0;
                    while (_local_29 < _local_10)
                    {
                        _local_11 = _local_9[_local_29];
                        _local_13 = _local_11.attribute("type");
                        _local_28 = _local_11.attribute("intent");
                        _local_14 = _local_11.attribute("style");
                        _local_15 = (_local_11.attribute("blend") as uint);
                        _local_16 = (_local_11.attribute("color") as uint);
                        _local_17 = _local_11.attribute("asset");
                        _local_18 = _local_11.attribute("layout");
                        _local_25 = _local_11.attribute("window_layout");
                        _local_21 = _local_11.attribute("renderer");
                        _local_12 = _local_11.child("states");
                        _local_22 = _local_8[_local_21];
                        if (_local_22)
                        {
                            _local_20 = new _local_22(_local_18);
                            if (_local_20)
                            {
                                _local_19 = _arg_2.getAssetByName(_local_17);
                                _local_20.parse(_local_19, _local_12, _arg_2);
                                if (((_local_19) && (_local_24.indexOf(_local_19) == -1)))
                                {
                                    _local_24.push(_local_19);
                                }
                            }
                        }
                        _local_23 = new DefaultAttStruct();
                        _local_23.threshold = ((_local_11.@treshold[0]) ? uint(_local_11.@treshold[0]) : 10);
                        _local_23.background = ((_local_11.@background[0]) ? (_local_11.@background[0] == "true") : false);
                        _local_23.blend = ((_local_11.@blend[0]) ? Number(_local_11.@blend[0]) : 1);
                        _local_23.color = ((_local_11.@color[0]) ? uint(_local_11.@color[0]) : 0xFFFFFF);
                        _local_23.width_min = ((_local_11.@width_min[0]) ? int(_local_11.@width_min[0]) : int.MIN_VALUE);
                        _local_23.width_max = ((_local_11.@width_max[0]) ? int(_local_11.@width_max[0]) : int.MAX_VALUE);
                        _local_23.height_min = ((_local_11.@height_min[0]) ? int(_local_11.@height_min[0]) : int.MIN_VALUE);
                        _local_23.height_max = ((_local_11.@height_max[0]) ? int(_local_11.@height_max[0]) : int.MAX_VALUE);
                        _local_27 = null;
                        if (_local_25 != null)
                        {
                            _local_26 = _arg_2.getAssetByName(_local_25);
                            if (_local_26 != null)
                            {
                                _local_27 = (_local_26.content as XML);
                            }
                        }
                        _arg_3._Str_23324(_local_4[_local_13], uint(_local_14), _local_28, _local_20, _local_27, _local_23);
                        _local_29++;
                    }
                    for each (_local_30 in _local_24)
                    {
                        _local_30.dispose();
                    }
                }
            }
        }
    }
}

