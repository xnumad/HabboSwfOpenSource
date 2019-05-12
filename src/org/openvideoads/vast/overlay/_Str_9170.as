package org.openvideoads.vast.overlay
{
    import org.openvideoads.regions.view._Str_8872;
    import flash.utils.Timer;
    import org.openvideoads.util.Animator;
    import org.openvideoads.regions.RegionController;
    import org.openvideoads.regions.config.RegionViewConfig;
    import org.openvideoads.vast.config.groupings.ClickSignConfig;
    import org.openvideoads.util.Display;
    import flash.events.TimerEvent;
    import flash.events.MouseEvent;

    public class _Str_9170 extends OverlayView 
    {
        protected static var _Str_18233:Number = 3000;

        protected var _Str_5660:_Str_8872;
        protected var _Str_2850:Timer = null;
        protected var _Str_10361:Animator = null;
        protected var _Str_20142:Number = 0;

        public function _Str_9170(k:RegionController, _arg_2:RegionViewConfig, _arg_3:ClickSignConfig, _arg_4:Display)
        {
            super(k, _arg_2, _arg_4);
            this._Str_10361 = new Animator();
            this._Str_5660 = new _Str_8872(_arg_3, _arg_4);
            this._Str_5660.visible = false;
            this._Str_20142 = this.alpha;
            addChild(this._Str_5660);
            setChildIndex(this._Str_5660, (this.numChildren - 1));
        }

        protected function _Str_12757():void
        {
            if (!this._Str_24282())
            {
                this._Str_2850 = new Timer(_Str_18233, 1);
                this._Str_2850.addEventListener(TimerEvent.TIMER_COMPLETE, this.onTimer);
                this._Str_2850.start();
            }
        }

        protected function onTimer(timerEvent:TimerEvent):void
        {
            this._Str_10361.fade(this, {
                "alpha":0,
                "rate":50,
                "times":15,
                "onComplete":function ():void
                {
                    _Str_5660.visible = false;
                }
            });
            this._Str_2850 = null;
        }

        protected function _Str_7465():void
        {
            if (this._Str_2850 != null)
            {
                this._Str_2850.stop();
            }
            this._Str_2850 = null;
        }

        protected function _Str_24282():Boolean
        {
            return !(this._Str_2850 == null);
        }

        override public function resize(k:Display=null):void
        {
            super.resize(k);
            if (this._Str_5660 != null)
            {
                this._Str_5660.resize(k);
            }
        }

        override protected function onMouseOver(k:MouseEvent):void
        {
            this._Str_10361.stop();
            this.alpha = this._Str_20142;
            this._Str_12757();
            this._Str_5660.visible = true;
        }

        override protected function onMouseOut(k:MouseEvent):void
        {
            this._Str_10361.stop();
            this._Str_7465();
            this._Str_5660.visible = false;
        }

        override protected function onClick(k:MouseEvent):void
        {
            this._Str_10361.stop();
            this._Str_7465();
            (_Str_2278 as OverlayController)._Str_17469(_Str_5530);
        }
    }
}
