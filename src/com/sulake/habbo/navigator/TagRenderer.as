package com.sulake.habbo.navigator
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.window.*;
    import com.sulake.core.window.components.*;
    import com.sulake.core.window.events.*;
    import com.sulake.core.window.enum.*;

    public class TagRenderer 
    {
        private var _navigator:IHabboTransitionalNavigator;
        private var _tagClickProc:Function;
        private var _useHashTags:Boolean = false;

        public function TagRenderer(k:IHabboTransitionalNavigator, _arg_2:Function=null)
        {
            this._navigator = k;
            this._tagClickProc = _arg_2;
        }

        public function dispose():void
        {
            this._navigator = null;
            this._tagClickProc = null;
        }

        public function set _Str_8651(k:Boolean):void
        {
            this._useHashTags = k;
        }

        public function _Str_19120(k:IWindowContainer, _arg_2:Array):void
        {
            var _local_3:IWindowContainer = IWindowContainer(k.findChildByName("tags"));
            var _local_4:int;
            while (_local_4 < 4)
            {
                this._Str_22102(_local_3, _local_4, _arg_2[_local_4]);
                _local_4++;
            }
            var _local_5:int = (k.width - _local_3.x);
            Util._Str_7173(_local_3, _local_5, 14);
            _local_3.height = Util._Str_2647(_local_3);
            _local_3.visible = (_arg_2.length > 0);
        }

        public function _Str_22102(k:IWindowContainer, _arg_2:int, _arg_3:String):void
        {
            var _local_6:ITextWindow;
            var _local_4:String = ("tag." + _arg_2);
            var _local_5:IWindowContainer = IWindowContainer(k.getChildByName(_local_4));
            if (((_arg_3 == null) || (_arg_3 == "")))
            {
                if (_local_5 != null)
                {
                    _local_5.visible = false;
                }
            }
            else
            {
                if (_local_5 == null)
                {
                    _local_5 = IWindowContainer(this._navigator.getXmlWindow("iro_tag"));
                    _local_5.name = _local_4;
                    k.addChild(_local_5);
                    _local_5.procedure = this._Str_24264;
                }
                _local_6 = ITextWindow(_local_5.findChildByName("txt"));
                _local_6.text = (((this._useHashTags) ? "#" : "") + _arg_3);
                _local_6.width = (_local_6.textWidth + 5);
                _local_5.width = (_local_6.width + 3);
                this._Str_16579(_local_5, false);
                _local_5.visible = true;
            }
        }

        private function _Str_16579(k:IWindowContainer, _arg_2:Boolean):void
        {
            this._Str_17728(k, "l", _arg_2);
            this._Str_17728(k, "m", _arg_2);
            this._Str_17728(k, "r", _arg_2);
        }

        private function _Str_24264(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_4:ITextWindow;
            var _local_5:String;
            var _local_3:IWindowContainer = (_arg_2 as IWindowContainer);
            if (_local_3 == null)
            {
                return;
            }
            if (k.type == WindowMouseEvent.OVER)
            {
                this._Str_16579(_local_3, true);
            }
            else
            {
                if (k.type == WindowMouseEvent.OUT)
                {
                    this._Str_16579(_local_3, false);
                }
                else
                {
                    if (k.type == WindowMouseEvent.CLICK)
                    {
                        _local_4 = ITextWindow(_local_3.findChildByName("txt"));
                        _local_5 = ((this._useHashTags) ? _local_4.text.substr(1, (_local_4.text.length - 1)) : _local_4.text);
                        Logger.log(("TAG CLICKED: " + _local_5));
                        this._navigator.performTagSearch(_local_5);
                        if (this._tagClickProc != null)
                        {
                            this._tagClickProc();
                        }
                    }
                }
            }
        }

        private function _Str_17728(k:IWindowContainer, _arg_2:String, _arg_3:Boolean):void
        {
            var _local_5:String;
            var _local_4:IBitmapWrapperWindow = IBitmapWrapperWindow(k.findChildByName(("bg_" + _arg_2)));
            if (_local_4.tags[0] != ("" + _arg_3))
            {
                _local_4.tags.splice(0, _local_4.tags.length);
                _local_4.tags.push(("" + _arg_3));
                _local_5 = (("tag_" + _arg_2) + ((_arg_3) ? "_reactive" : ""));
                _local_4.bitmap = this._navigator._Str_3122(_local_5);
                _local_4.disposesBitmap = false;
                _local_4.invalidate();
            }
        }
    }
}

