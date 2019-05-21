package com.sulake.core.window.motion
{
    import __AS3__.vec.Vector;
    import flash.utils.Timer;
    import com.sulake.core.Core;
    import com.sulake.core.window.IWindow;
    import flash.utils.getTimer;
    import flash.events.TimerEvent;
    import __AS3__.vec.*;

    public class Motions 
    {
        private static const _Str_5358:Vector.<Motion> = new Vector.<Motion>();
        private static const _Str_3932:Vector.<Motion> = new Vector.<Motion>();
        private static const _Str_10731:Vector.<Motion> = new Vector.<Motion>();
        private static const _Str_5307:Timer = new Timer((1000 / Core.instance.displayObjectContainer.stage.frameRate), 0);
        private static var _Str_7507:Boolean;


        public static function _Str_4598(k:Motion):Motion
        {
            if (((_Str_3932.indexOf(k) == -1) && (_Str_5358.indexOf(k) == -1)))
            {
                if (_Str_7507)
                {
                    _Str_5358.push(k);
                }
                else
                {
                    _Str_3932.push(k);
                    k.start();
                }
                _Str_12757();
            }
            return k;
        }

        public static function _Str_15790(k:Motion):void
        {
            var _local_2:int = _Str_3932.indexOf(k);
            if (_local_2 > -1)
            {
                if (_Str_7507)
                {
                    _local_2 = _Str_10731.indexOf(k);
                    if (_local_2 == -1)
                    {
                        _Str_10731.push(k);
                    }
                }
                else
                {
                    _Str_3932.splice(_local_2, 1);
                    if (k.running)
                    {
                        k.stop();
                    }
                    if (_Str_3932.length == 0)
                    {
                        _Str_7465();
                    }
                }
            }
            else
            {
                _local_2 = _Str_5358.indexOf(k);
                if (_local_2 > -1)
                {
                    _Str_5358.splice(_local_2, 1);
                }
            }
        }

        public static function _Str_19320(k:String):Motion
        {
            var _local_2:Motion;
            for each (_local_2 in _Str_3932)
            {
                if (_local_2.tag == k)
                {
                    return _local_2;
                }
            }
            for each (_local_2 in _Str_5358)
            {
                if (_local_2.tag == k)
                {
                    return _local_2;
                }
            }
            return null;
        }

        public static function _Str_9810(k:IWindow):Motion
        {
            var _local_2:Motion;
            for each (_local_2 in _Str_3932)
            {
                if (_local_2.target == k)
                {
                    return _local_2;
                }
            }
            for each (_local_2 in _Str_5358)
            {
                if (_local_2.target == k)
                {
                    return _local_2;
                }
            }
            return null;
        }

        public static function _Str_26365(k:String, _arg_2:IWindow):Motion
        {
            var _local_3:Motion;
            for each (_local_3 in _Str_3932)
            {
                if (((_local_3.tag == k) && (_local_3.target == _arg_2)))
                {
                    return _local_3;
                }
            }
            for each (_local_3 in _Str_5358)
            {
                if (((_local_3.tag == k) && (_local_3.target == _arg_2)))
                {
                    return _local_3;
                }
            }
            return null;
        }

        public static function get isRunning():Boolean
        {
            return (_Str_5307) ? _Str_5307.running : false;
        }

        public static function get _Str_26314():Boolean
        {
            return _Str_7507;
        }

        private static function _Str_21055(k:TimerEvent):void
        {
            var _local_3:Motion;
            _Str_7507 = true;
            var _local_2:int = getTimer();
            while ((_local_3 = _Str_5358.pop()) != null)
            {
                _Str_3932.push(_local_3);
            }
            while ((_local_3 = _Str_10731.pop()) != null)
            {
                _Str_3932.splice(_Str_3932.indexOf(_local_3), 1);
                if (_local_3.running)
                {
                    _local_3.stop();
                }
            }
            for each (_local_3 in _Str_3932)
            {
                if (_local_3.running)
                {
                    _local_3.tick(_local_2);
                    if (_local_3.complete)
                    {
                        _Str_15790(_local_3);
                    }
                }
                else
                {
                    _Str_15790(_local_3);
                }
            }
            if (_Str_3932.length == 0)
            {
                _Str_7465();
            }
            _Str_7507 = false;
        }

        private static function _Str_12757():void
        {
            if (!_Str_5307.running)
            {
                _Str_5307.addEventListener(TimerEvent.TIMER, _Str_21055);
                _Str_5307.start();
            }
        }

        private static function _Str_7465():void
        {
            if (_Str_5307.running)
            {
                _Str_5307.removeEventListener(TimerEvent.TIMER, _Str_21055);
                _Str_5307.stop();
            }
        }


        public function _Str_25883(k:IWindow):int
        {
            var _local_3:Motion;
            var _local_2:int;
            for each (_local_3 in _Str_3932)
            {
                if (_local_3.target == k)
                {
                    _local_2++;
                }
            }
            return _local_2;
        }
    }
}
