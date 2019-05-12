package com.sulake.core.window.utils.tablet
{
    import com.sulake.core.window.utils.MouseEventProcessor;
    import com.sulake.core.window.WindowController;
    import com.sulake.core.window.utils.EventProcessorState;
    import com.sulake.core.window.utils.IEventQueue;

    public class TabletEventProcessor extends MouseEventProcessor 
    {
        private var _lastEventType:String = "";


        override public function process(k:EventProcessorState, _arg_2:IEventQueue):void
        {
            if (_arg_2.length == 0)
            {
                return;
            }
            _Str_2867 = k.desktop;
            _Str_3275 = (k.hoverWindow as WindowController);
            _Str_3558 = (k.lastClickTarget as WindowController);
            _Str_2884 = k.renderer;
            _Str_8811 = k.eventTrackers;
            _arg_2.begin();
            _arg_2.end();
            k.desktop = _Str_2867;
            k.hoverWindow = _Str_3275;
            k.lastClickTarget = _Str_3558;
            k.renderer = _Str_2884;
            k.eventTrackers = _Str_8811;
        }
    }
}
