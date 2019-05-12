package com.sulake.habbo.friendbar.landingview.layout
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.runtime.IUpdateReceiver;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.utils.Map;
    import flash.events.EventDispatcher;
    import com.sulake.habbo.friendbar.landingview.layout.backgroundobjects._Str_5115;
    import com.sulake.habbo.friendbar.landingview.layout.backgroundobjects._Str_3317;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.friendbar.landingview.interfaces.elements.*;

    public class MovingBackgroundObjects implements IDisposable, IUpdateReceiver 
    {
        private static const _Str_18679:int = 20;

        private var _landingView:HabboLandingView;
        private var _objects:Array;
        private var _objectTypeMap:Map;
        private var _events:EventDispatcher;
        private var _timingCode:String = "";

        public function MovingBackgroundObjects(k:HabboLandingView)
        {
            this._objects = [];
            this._objectTypeMap = new Map();
            this._events = new EventDispatcher();
            super();
            this._landingView = k;
            this._Str_23618();
        }

        private function _Str_23618():void
        {
            this._objectTypeMap.add(_Str_5115.LINEAR, _Str_5115._Str_18208);
            this._objectTypeMap.add(_Str_5115.SPIRAL, _Str_5115._Str_16125);
            this._objectTypeMap.add(_Str_5115.ANIMATED, _Str_5115._Str_17529);
            this._objectTypeMap.add(_Str_5115.RANDOMWALK, _Str_5115._Str_18412);
        }

        public function dispose():void
        {
            var k:_Str_3317;
            this._landingView = null;
            for each (k in this._objects)
            {
                k.dispose();
            }
            this._objects = null;
            this._objectTypeMap.reset();
            this._objectTypeMap = null;
            this._events = null;
        }

        public function get disposed():Boolean
        {
            return this._landingView == null;
        }

        public function initialize(k:IWindowContainer):void
        {
            var _local_3:String;
            var _local_4:_Str_3317;
            k = IWindowContainer(k.findChildByName("moving_objects_container"));
            if (k == null)
            {
                return;
            }
            if (this._objects.length > 0)
            {
                return;
            }
            var _local_2:int = 1;
            while (_local_2 <= _Str_18679)
            {
                if (this._timingCode == "")
                {
                    _local_3 = this._landingView.getProperty(("landing.view.bgobject." + _local_2));
                }
                else
                {
                    _local_3 = this._landingView.getProperty(((("landing.view." + this._timingCode) + ".bgobject.") + _local_2));
                }
                if (_local_3 != "")
                {
                    _local_4 = this._Str_22559(_local_2, _local_3, k);
                    if (_local_4 != null)
                    {
                        this._objects.push(_local_4);
                    }
                }
                _local_2++;
            }
        }

        public function update(k:uint):void
        {
            var _local_2:_Str_3317;
            for each (_local_2 in this._objects)
            {
                _local_2.update(k);
            }
        }

        private function _Str_22559(k:int, _arg_2:String, _arg_3:IWindowContainer):_Str_3317
        {
            var _local_5:String;
            var _local_6:Class;
            var _local_4:Array = _arg_2.split(";");
            if (_local_4.length >= 2)
            {
                _local_5 = _local_4[1];
                _local_6 = this._objectTypeMap.getValue(_local_5);
                if (_local_6 != null)
                {
                    return new _local_6(k, _arg_3, this._events, this._landingView, _arg_2);
                }
            }
            return null;
        }

        public function set _Str_23132(k:String):void
        {
            this._timingCode = k;
        }
    }
}
