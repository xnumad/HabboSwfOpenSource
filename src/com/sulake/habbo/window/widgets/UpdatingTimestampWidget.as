package com.sulake.habbo.window.widgets
{
    import flash.utils.Timer;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.core.window.components.ILabelWindow;
    import com.sulake.core.window.enum.WindowType;
    import com.sulake.core.window.enum.WindowParam;
    import flash.geom.Rectangle;
    import flash.events.TimerEvent;
    import com.sulake.core.window.iterators.EmptyIterator;
    import com.sulake.core.window.utils.IIterator;
    import com.sulake.habbo.utils.FriendlyTime;

    public class UpdatingTimestampWidget implements _Str_5483 
    {
        public static const UPDATING_TIMESTAMP:String = "updating_timestamp";
        private static const _Str_10472:Timer = new Timer(60000);

        private var _disposed:Boolean;
        private var _Str_2326:IWidgetWindow;
        private var _habboWindowManagerComponent:HabboWindowManagerComponent;
        private var _Str_2302:ILabelWindow;
        private var _timeStamp:Number;

        {
            _Str_10472.start();
        }

        public function UpdatingTimestampWidget(k:IWidgetWindow, _arg_2:HabboWindowManagerComponent)
        {
            this._Str_2326 = k;
            this._habboWindowManagerComponent = _arg_2;
            this._Str_2302 = (this._habboWindowManagerComponent.create("", WindowType.WINDOW_TYPE_LABEL, 100, WindowParam.WINDOW_PARAM_USE_PARENT_GRAPHIC_CONTEXT, new Rectangle()) as ILabelWindow);
            this._Str_2302.textColor = 0x555555;
            this._Str_2326._Str_2429 = this._Str_2302;
            _Str_10472.addEventListener(TimerEvent.TIMER, this._Str_12760);
            this.reset();
        }

        public function reset():void
        {
            this._timeStamp = new Date().getTime();
            this._Str_12760();
        }

        public function get properties():Array
        {
            return [];
        }

        public function set properties(k:Array):void
        {
        }

        public function set align(k:String):void
        {
            this._Str_2302.defaultTextFormat.align = k;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                _Str_10472.removeEventListener(TimerEvent.TIMER, this._Str_12760);
                if (this._Str_2302 != null)
                {
                    this._Str_2302.dispose();
                    this._Str_2302 = null;
                }
                if (this._Str_2326 != null)
                {
                    this._Str_2326._Str_2429 = null;
                    this._Str_2326 = null;
                }
                this._habboWindowManagerComponent = null;
                this._disposed = true;
            }
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get iterator():IIterator
        {
            return EmptyIterator.INSTANCE;
        }

        public function get timeStamp():Number
        {
            return this._timeStamp;
        }

        public function set timeStamp(k:Number):void
        {
            this._timeStamp = k;
            this._Str_12760();
        }

        private function _Str_12760(k:TimerEvent=null):void
        {
            if (((((this._disposed) || (!(this._Str_2302))) || (!(this._habboWindowManagerComponent))) || (!(this._habboWindowManagerComponent.localization))))
            {
                return;
            }
            this._Str_2302.caption = FriendlyTime.format(this._habboWindowManagerComponent.localization, ((new Date().getTime() - this._timeStamp) / 1000), ".ago", 1);
        }
    }
}
