package com.sulake.habbo.moderation
{
    import flash.utils.Dictionary;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.IFrameWindow;

    public class WindowTracker 
    {
        public static const _Str_17385:int = 1;
        public static const _Str_18900:int = 2;
        public static const _Str_15411:int = 3;
        public static const _Str_10414:int = 4;
        public static const _Str_15435:int = 5;
        public static const _Str_14197:int = 6;
        public static const _Str_18770:int = 7;
        public static const _Str_18611:int = 8;
        public static const _Str_16350:int = 9;

        private var _windowsByType:Dictionary;

        public function WindowTracker()
        {
            this._windowsByType = new Dictionary();
            super();
        }

        public function show(k:ITrackedWindow, _arg_2:IFrameWindow, _arg_3:Boolean, _arg_4:Boolean, _arg_5:Boolean, _arg_6:Boolean=false, _arg_7:int=0, _arg_8:int=0, _arg_9:int=0, _arg_10:int=0):void
        {
            var _local_12:IWindow;
            var _local_13:int;
            var _local_14:IWindow;
            var _local_11:ITrackedWindow = this.removeWindow(k.getType(), k.getId());
            if (((!(_local_11 == null)) && (!(_local_11.disposed))))
            {
                if (_arg_5)
                {
                    k.dispose();
                    _local_11.dispose();
                    return;
                }
                k.show();
                _local_12 = _local_11.getFrame();
                k.getFrame().x = ((_arg_6) ? _arg_7 : _local_12.x);
                k.getFrame().y = ((_arg_6) ? _arg_8 : _local_12.y);
                k.getFrame().width = ((_arg_6) ? _arg_9 : _local_12.width);
                k.getFrame().height = ((_arg_6) ? _arg_10 : _local_12.height);
                this._Str_17883(k.getType())[k.getId()] = k;
                _local_11.dispose();
            }
            else
            {
                if (!_arg_4)
                {
                    k.show();
                    if (_arg_2 != null)
                    {
                        _local_13 = 5;
                        if (_arg_3)
                        {
                            k.getFrame().x = ((_arg_6) ? _arg_7 : _arg_2.x);
                            k.getFrame().y = ((_arg_6) ? _arg_8 : ((_arg_2.y + _arg_2.height) + _local_13));
                        }
                        else
                        {
                            k.getFrame().x = ((_arg_6) ? _arg_7 : ((_arg_2.x + _arg_2.width) + _local_13));
                            k.getFrame().y = ((_arg_6) ? _arg_8 : _arg_2.y);
                        }
                    }
                    else
                    {
                        if (_arg_6)
                        {
                            k.getFrame().x = _arg_7;
                            k.getFrame().y = _arg_8;
                        }
                        else
                        {
                            _local_14 = k.getFrame().desktop;
                            k.getFrame().x = ((_local_14.width / 2) - (k.getFrame().width / 2));
                            k.getFrame().y = ((_local_14.height / 2) - (k.getFrame().height / 2));
                        }
                    }
                    k.getFrame().x = Math.max(0, Math.min(k.getFrame().x, (k.getFrame().desktop.width - k.getFrame().width)));
                    k.getFrame().y = Math.max(0, Math.min(k.getFrame().y, (k.getFrame().desktop.height - k.getFrame().height)));
                    this._Str_17883(k.getType())[k.getId()] = k;
                }
            }
        }

        private function removeWindow(k:int, _arg_2:String):ITrackedWindow
        {
            var _local_3:Dictionary = this._Str_17883(k);
            var _local_4:ITrackedWindow = _local_3[_arg_2];
            _local_3[_arg_2] = null;
            return _local_4;
        }

        private function _Str_17883(k:int):Dictionary
        {
            var _local_2:Dictionary = this._windowsByType[k];
            if (_local_2 == null)
            {
                _local_2 = new Dictionary();
                this._windowsByType[k] = _local_2;
            }
            return _local_2;
        }
    }
}
