package com.sulake.habbo.ui.widget.roomchat.style
{
    import com.sulake.core.window.components.IRegionWindow;
    import flash.display.BitmapData;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.window.enum.WindowParam;

    public class ChatBubbleStyle 
    {
        private var _styleId:int;
        private var _styleName:String;
        private var _isSystemStyle:Boolean = false;
        private var _isStaffOverrideable:Boolean = false;
        private var _normalLayout:IRegionWindow;
        private var _whisperLayout:IRegionWindow;
        private var _shoutLayout:IRegionWindow;
        private var _leftBitmapData:BitmapData;
        private var _leftColorBitmapData:BitmapData;
        private var _middleBitmapData:BitmapData;
        private var _rightBitmapData:BitmapData;
        private var _pointerBitmapData:BitmapData;
        private var _selectorPreviewIconBitmapData:BitmapData;

        public function ChatBubbleStyle(k:IAssetLibrary, _arg_2:IHabboWindowManager, _arg_3:XML)
        {
            this._styleId = _arg_3.@id[0];
            this._styleName = _arg_3.@name[0];
            this._isSystemStyle = _arg_3.@systemstyle[0];
            this._isStaffOverrideable = _arg_3.@staffoverride[0];
            var _local_4:XML = _arg_3.child("layouts")[0];
            var _local_5:XML = _arg_3.child("bitmaps")[0];
            this._normalLayout = this._Str_16373(_arg_2, k, _Str_3690(_local_4, "speakLayout"));
            this._whisperLayout = this._Str_16373(_arg_2, k, _Str_3690(_local_4, "whisperLayout"));
            this._shoutLayout = this._Str_16373(_arg_2, k, _Str_3690(_local_4, "shoutLayout"));
            var _local_6:String = _Str_3690(_local_5, "leftBitmap");
            var _local_7:String = _Str_3690(_local_5, "leftColorBitmap");
            var _local_8:String = _Str_3690(_local_5, "middleBitmap");
            var _local_9:String = _Str_3690(_local_5, "rightBitmap");
            var _local_10:String = _Str_3690(_local_5, "pointerBitmap");
            if (_local_6)
            {
                this._leftBitmapData = this._Str_8638(_local_6, k);
            }
            if (_local_7)
            {
                this._leftColorBitmapData = this._Str_8638(_local_7, k);
            }
            if (_local_8)
            {
                this._middleBitmapData = this._Str_8638(_local_8, k);
            }
            if (_local_9)
            {
                this._rightBitmapData = this._Str_8638(_local_9, k);
            }
            if (_local_10)
            {
                this._pointerBitmapData = this._Str_8638(_local_10, k);
            }
            var _local_11:String = _Str_3690(_local_5, "previewIconBitmap");
            if (_local_11)
            {
                this._selectorPreviewIconBitmapData = this._Str_8638(_local_11, k);
            }
        }

        private static function _Str_3690(k:XML, _arg_2:String):String
        {
            var _local_3:XMLList = k.child(_arg_2);
            if (_local_3.length() < 1)
            {
                return null;
            }
            var _local_4:XMLList = XML(_local_3[0]).attribute("assetId");
            if (_local_4.length() < 1)
            {
                return null;
            }
            return _local_4[0];
        }


        public function get _Str_14292():IRegionWindow
        {
            return this._normalLayout;
        }

        public function get whisperLayout():IRegionWindow
        {
            return this._whisperLayout;
        }

        public function get shoutLayout():IRegionWindow
        {
            return this._shoutLayout;
        }

        public function get _Str_13046():BitmapData
        {
            return this._leftBitmapData;
        }

        public function get _Str_20211():BitmapData
        {
            return this._leftColorBitmapData;
        }

        public function get _Str_7450():BitmapData
        {
            return this._middleBitmapData;
        }

        public function get _Str_14107():BitmapData
        {
            return this._rightBitmapData;
        }

        public function get pointerBitmapData():BitmapData
        {
            return this._pointerBitmapData;
        }

        public function get isSystemStyle():Boolean
        {
            return this._isSystemStyle;
        }

        public function get isStaffOverrideable():Boolean
        {
            return this._isStaffOverrideable;
        }

        public function get _Str_24719():BitmapData
        {
            return this._selectorPreviewIconBitmapData;
        }

        private function _Str_16373(k:IHabboWindowManager, _arg_2:IAssetLibrary, _arg_3:String):IRegionWindow
        {
            if (_arg_3 == null)
            {
                return null;
            }
            var _local_4:IAsset = _arg_2.getAssetByName(this._Str_17396((_arg_3 + "_xml")));
            var _local_5:IRegionWindow = (k.buildFromXML((_local_4.content as XML), 1) as IRegionWindow);
            _local_5.tags.push("roomchat_bubble");
            _local_5.x = 0;
            _local_5.y = 0;
            _local_5.width = 0;
            _local_5.background = true;
            _local_5.mouseThreshold = 0;
            _local_5.setParamFlag(WindowParam.WINDOW_PARAM_FORCE_CLIPPING, true);
            return _local_5;
        }

        private function _Str_17396(k:String):String
        {
            var _local_2:String = ((("roomchat_styles_" + this._styleName) + "_") + k);
            return _local_2;
        }

        private function _Str_8638(k:String, _arg_2:IAssetLibrary):BitmapData
        {
            var _local_3:IAsset = _arg_2.getAssetByName(this._Str_17396(k));
            if (_local_3)
            {
                return BitmapData(_local_3.content);
            }
            throw (new Error(("Configured bitmapdata asset missing for chat bubble style: " + this._Str_17396(k))));
        }
    }
}
