package com.sulake.habbo.ui.widget.crafting.controller
{
    import com.sulake.habbo.ui.widget.crafting.CraftingWidget;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindowContainer;

    public class CraftingProgressBarController 
    {
        private var _widget:CraftingWidget;
        private var _progressTimer:Timer;
        private var _progress:Number;

        public function CraftingProgressBarController(k:CraftingWidget)
        {
            this._widget = k;
            this._progressTimer = new Timer(70);
            this._progressTimer.addEventListener(TimerEvent.TIMER, this._Str_24900);
        }

        public function dispose():void
        {
            this._widget = null;
        }

        private function _Str_11199(k:Number):void
        {
            var _local_4:IWindow;
            var _local_2:IWindow = this.container.findChildByName("btn_cancel");
            var _local_3:IWindow = ((this.container) ? this.container.findChildByName("bar") : null);
            if (_local_3)
            {
                _local_4 = _local_3.parent;
                _local_3.width = (_local_2.width * k);
            }
        }

        private function _Str_24900(k:TimerEvent):void
        {
            this._Str_11199((this._progress = (this._progress + 0.02)));
            if (this._progress >= 1)
            {
                this.hide();
                this._widget._Str_11931._Str_25541();
            }
        }

        public function hide():void
        {
            if (this._progressTimer)
            {
                this._progressTimer.stop();
            }
            if (this.container)
            {
                this.container.visible = false;
                this.container.procedure = null;
            }
        }

        public function show():void
        {
            this._progressTimer.start();
            this._progress = 0;
            if (this.container)
            {
                this.container.visible = true;
                this.container.procedure = this.onTriggered;
            }
        }

        private function onTriggered(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.DOWN)
            {
                return;
            }
            this._widget._Str_11931._Str_19691();
        }

        private function get container():IWindowContainer
        {
            if (((!(this._widget)) || (!(this._widget.window))))
            {
                return null;
            }
            return this._widget.window.findChildByName("progress_bar") as IWindowContainer;
        }
    }
}
