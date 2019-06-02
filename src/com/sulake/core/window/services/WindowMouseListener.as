package com.sulake.core.window.services
{
    import com.sulake.core.window.enum.MouseListenerType;
    import flash.display.DisplayObject;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import flash.geom.Point;
    import flash.events.Event;

    public class WindowMouseListener extends WindowMouseOperator implements IMouseListenerService 
    {
        private var _eventTypes:Array;
        private var _areaLimit:uint;

        public function WindowMouseListener(k:DisplayObject)
        {
            this._eventTypes = new Array();
            this._areaLimit = MouseListenerType.EVENT_INSIDE_STAGE;
            super(k);
        }

        public function get eventTypes():Array
        {
            return this._eventTypes;
        }

        public function get _Str_14321():uint
        {
            return this._areaLimit;
        }

        public function set _Str_14321(k:uint):void
        {
            this._areaLimit = k;
        }

        override public function end(k:IWindow):IWindow
        {
            var _local_2:int = this._eventTypes.length;
            while (_local_2 > 0)
            {
                this._eventTypes.pop();
                _local_2--;
            }
            return super.end(k);
        }

        override protected function handler(k:Event):void
        {
            var _local_2:Boolean;
            if (((_Str_5527) && (!(window.disposed))))
            {
                if (this._eventTypes.indexOf(k.type) >= 0)
                {
                    if ((k is WindowMouseEvent))
                    {
                        _local_2 = window.hitTestGlobalPoint(new Point(WindowMouseEvent(k).stageX, WindowMouseEvent(k).stageY));
                        if (((this._areaLimit == MouseListenerType.EVENTS_INSIDE_WINDOW) && (!(_local_2))))
                        {
                            return;
                        }
                        if (((this._areaLimit == MouseListenerType.EVENTS_OUTSIDE_WINDOW) && (_local_2)))
                        {
                            return;
                        }
                    }
                    window.update(null, WindowMouseEvent(k));
                }
            }
        }

        override public function operate(k:int, _arg_2:int):void
        {
        }
    }
}
