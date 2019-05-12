package com.sulake.core.window.graphics
{
    import flash.utils.Dictionary;
    import com.sulake.core.window.enum.WindowState;
    import com.sulake.core.window.graphics.renderer.ISkinRenderer;
    import com.sulake.core.window.utils.DefaultAttStruct;
    import com.sulake.core.window.enum.WindowStyle;
    import com.sulake.core.window.graphics.renderer.*;

    public class SkinContainer implements ISkinContainer 
    {
        private static const _Str_8830:uint = 100;
        protected static var _Str_4802:Array;

        private var _disposed:Boolean = false;
        private var _skinRendererTable:Dictionary;
        private var _defaultAttrTable:Dictionary;
        private var _windowLayoutTable:Dictionary;
        private var _intentTable:Dictionary;

        public function SkinContainer()
        {
            this._skinRendererTable = new Dictionary();
            this._defaultAttrTable = new Dictionary();
            this._windowLayoutTable = new Dictionary();
            this._intentTable = new Dictionary();
            if (_Str_4802 == null)
            {
                _Str_4802 = new Array();
                _Str_4802.push(WindowState.LOCKED);
                _Str_4802.push(WindowState.DISABLED);
                _Str_4802.push(WindowState.PRESSED);
                _Str_4802.push(WindowState.SELECTED);
                _Str_4802.push(WindowState.HOVERING);
                _Str_4802.push(WindowState.FOCUSED);
                _Str_4802.push(WindowState.ACTIVE);
                _Str_4802.push(WindowState.DEFAULT);
            }
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function dispose():void
        {
            this._skinRendererTable = null;
            this._defaultAttrTable = null;
            this._windowLayoutTable = null;
            this._intentTable = null;
            this._disposed = true;
        }

        public function _Str_23324(k:uint, _arg_2:uint, _arg_3:String, _arg_4:ISkinRenderer, _arg_5:XML, _arg_6:DefaultAttStruct):void
        {
            if (this._skinRendererTable[k] == null)
            {
                this._skinRendererTable[k] = new Array(_Str_8830);
            }
            this._skinRendererTable[k][_arg_2] = _arg_4;
            if (this._defaultAttrTable[k] == null)
            {
                this._defaultAttrTable[k] = new Array(_Str_8830);
            }
            this._defaultAttrTable[k][_arg_2] = _arg_6;
            if (this._windowLayoutTable[k] == null)
            {
                this._windowLayoutTable[k] = new Array(_Str_8830);
            }
            this._windowLayoutTable[k][_arg_2] = _arg_5;
            if (this._intentTable[k] == null)
            {
                this._intentTable[k] = new Array(_Str_8830);
            }
            this._intentTable[k][_arg_2] = (((!(_arg_3 == null)) && (_arg_3.length > 0)) ? _arg_3 : _arg_2.toString());
        }

        public function _Str_18054(k:uint, _arg_2:uint):ISkinRenderer
        {
            var _local_4:ISkinRenderer;
            var _local_3:Array = this._skinRendererTable[k];
            if (_local_3)
            {
                _local_4 = _local_3[_arg_2];
                if (((!(_local_4)) && (!(_arg_2 == WindowStyle.WINDOW_STYLE_DEFAULT))))
                {
                    _local_4 = _local_3[WindowStyle.WINDOW_STYLE_DEFAULT];
                }
            }
            return _local_4;
        }

        public function _Str_20972(k:uint, _arg_2:uint):Boolean
        {
            return (this._skinRendererTable[k]) && (this._skinRendererTable[k][_arg_2]);
        }

        public function _Str_21732(k:uint, _arg_2:uint):DefaultAttStruct
        {
            var _local_4:DefaultAttStruct;
            var _local_3:Array = this._defaultAttrTable[k];
            if (_local_3)
            {
                _local_4 = _local_3[_arg_2];
                if (((!(_local_4)) && (!(_arg_2 == WindowStyle.WINDOW_STYLE_DEFAULT))))
                {
                    _local_4 = _local_3[WindowStyle.WINDOW_STYLE_DEFAULT];
                }
            }
            return _local_4;
        }

        public function _Str_23436(k:uint, _arg_2:uint):XML
        {
            var _local_3:Array = this._windowLayoutTable[k];
            if (_local_3 == null)
            {
                return null;
            }
            if (_local_3[_arg_2] == null)
            {
                return _local_3[0];
            }
            return _local_3[_arg_2];
        }

        public function _Str_16505(k:uint, _arg_2:uint):String
        {
            var _local_3:Array = this._intentTable[k];
            return ((!(_local_3 == null)) && (!(_local_3[_arg_2] == null))) ? _local_3[_arg_2] : null;
        }

        public function _Str_15965(k:uint, _arg_2:uint, _arg_3:uint):uint
        {
            var _local_5:uint;
            var _local_4:ISkinRenderer = this._Str_18054(k, _arg_2);
            if (_local_4)
            {
                for each (_local_5 in _Str_4802)
                {
                    if ((_arg_3 & _local_5) == _local_5)
                    {
                        if (_local_4.isStateDrawable(_local_5))
                        {
                            return _local_5;
                        }
                    }
                }
            }
            return 0;
        }
    }
}
