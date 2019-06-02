package com.sulake.habbo.ui.widget.roomchat.style
{
    import com.sulake.core.utils.Map;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.habbo.ui.widget.enums.ChatTypeEnum;
    import flash.display.BitmapData;
    import flash.geom.Point;
    import flash.geom.ColorTransform;
    import flash.display.BlendMode;
    import flash.geom.Matrix;
    import flash.geom.Rectangle;

    public class ChatBubbleFactory 
    {
        private static const _Str_15957:int = 0;

        private var _styles:Map;

        public function ChatBubbleFactory(assets:IAssetLibrary, windowManager:IHabboWindowManager, config:XML)
        {
            var child:XML;
            var styleId:int;
            var assetId:String;
            var configXmlAssetName:String;
            var configXml:XML;
            var style:ChatBubbleStyle;
            this._styles = new Map();
            super();
            for each (child in config.child("style"))
            {
                styleId = child.@id[0];
                assetId = child.@assetId[0];
                configXmlAssetName = (("roomchat_styles_" + assetId) + "_style_xml");
                configXml = XML(assets.getAssetByName(configXmlAssetName).content);
                try
                {
                    style = new ChatBubbleStyle(assets, windowManager, configXml);
                    this._styles.add(styleId, style);
                }
                catch(e:Error)
                {
                    Logger.log(((("Error initializing chat style: " + styleId) + ", error message: ") + e.message));
                }
            }
        }

        public function _Str_25575(k:int, _arg_2:int):IRegionWindow
        {
            var _local_3:ChatBubbleStyle = this._Str_12308(k);
            switch (_arg_2)
            {
                case ChatTypeEnum._Str_16471:
                    return IRegionWindow(_local_3._Str_14292.clone());
                case ChatTypeEnum._Str_17535:
                    if (_local_3.shoutLayout != null)
                    {
                        return IRegionWindow(_local_3.shoutLayout.clone());
                    }
                    return IRegionWindow(_local_3._Str_14292.clone());
                case ChatTypeEnum._Str_16837:
                    if (_local_3.whisperLayout != null)
                    {
                        return IRegionWindow(_local_3.whisperLayout.clone());
                    }
                    return IRegionWindow(_local_3._Str_14292.clone());
                default:
                    if (_local_3.whisperLayout != null)
                    {
                        return IRegionWindow(_local_3.whisperLayout.clone());
                    }
                    return IRegionWindow(_local_3._Str_14292.clone());
            }
        }

        public function _Str_23013(k:int):BitmapData
        {
            return this._Str_12308(k).pointerBitmapData;
        }

        public function _Str_25059(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:uint):BitmapData
        {
            var _local_12:uint;
            var _local_13:uint;
            var _local_14:uint;
            var _local_15:int;
            var _local_16:int;
            var _local_6:ChatBubbleStyle = this._Str_12308(k);
            var _local_7:int;
            var _local_8:Point = new Point();
            var _local_9:BitmapData = new BitmapData(((_local_6._Str_13046.width + _arg_3) + _local_6._Str_14107.width), _arg_4, true, 0);
            _local_7 = (_local_7 + _local_6._Str_13046.width);
            _local_9.copyPixels(_local_6._Str_13046, _local_6._Str_13046.rect, _local_8);
            if (_local_6._Str_20211 != null)
            {
                _local_12 = 232;
                _local_13 = 177;
                _local_14 = 55;
                if (_arg_5 != 0)
                {
                    _local_12 = ((_arg_5 >> 16) & 0xFF);
                    _local_13 = ((_arg_5 >> 8) & 0xFF);
                    _local_14 = ((_arg_5 >> 0) & 0xFF);
                }
                _local_9.draw(_local_6._Str_20211, null, new ColorTransform((_local_12 / 0xFF), (_local_13 / 0xFF), (_local_14 / 0xFF)), BlendMode.DARKEN);
            }
            var _local_10:Matrix = new Matrix();
            if (_local_6._Str_7450.width == 1)
            {
                _local_10.scale((_arg_3 / _local_6._Str_7450.width), 1);
                _local_10.translate(_local_7, 0);
                _local_9.draw(_local_6._Str_7450, _local_10);
            }
            else
            {
                _local_10.translate(_local_7, 0);
                _local_15 = ((_arg_3 / _local_6._Str_7450.width) + 1);
                _local_16 = 0;
                while (_local_16 < _local_15)
                {
                    _local_9.draw(_local_6._Str_7450, _local_10);
                    _local_10.translate(_local_6._Str_7450.width, 0);
                    _local_16++;
                }
            }
            _local_7 = (_local_7 + _arg_3);
            _local_8.x = _local_7;
            _local_9.copyPixels(_local_6._Str_14107, _local_6._Str_14107.rect, _local_8);
            var _local_11:Rectangle = _local_6._Str_14107.rect.clone();
            _local_11.offsetPoint(_local_8);
            return _local_9;
        }

        public function getStyleIds():Array
        {
            return this._styles.getKeys();
        }

        public function _Str_25949():Array
        {
            var _local_2:int;
            var _local_3:ChatBubbleStyle;
            var k:Array = new Array();
            for each (_local_2 in this.getStyleIds())
            {
                _local_3 = this._styles.getValue(_local_2);
                if (((!(_local_3.isSystemStyle)) && (!(_local_3.isStaffOverrideable))))
                {
                    k.push(_local_2);
                }
            }
            return k;
        }

        public function _Str_26286():Array
        {
            var _local_2:int;
            var _local_3:ChatBubbleStyle;
            var k:Array = new Array();
            for each (_local_2 in this.getStyleIds())
            {
                _local_3 = this._styles.getValue(_local_2);
                if (_local_3.isStaffOverrideable)
                {
                    k.push(_local_2);
                }
            }
            return k;
        }

        public function _Str_26232(k:int):BitmapData
        {
            var _local_2:ChatBubbleStyle = this._Str_12308(k);
            return _local_2._Str_24719;
        }

        public function _Str_24902(k:int):int
        {
            var _local_2:ChatBubbleStyle = this._Str_12308(k);
            return _local_2._Str_7450.height;
        }

        private function _Str_12308(k:int):ChatBubbleStyle
        {
            if (!this._styles.hasKey(k))
            {
                k = _Str_15957;
            }
            return ChatBubbleStyle(this._styles.getValue(k));
        }
    }
}
