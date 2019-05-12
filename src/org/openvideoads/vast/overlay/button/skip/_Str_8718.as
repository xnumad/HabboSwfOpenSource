package org.openvideoads.vast.overlay.button.skip
{
    import org.openvideoads.vast.overlay.OverlayView;
    import org.openvideoads.regions.RegionController;
    import org.openvideoads.regions.config.RegionViewConfig;
    import org.openvideoads.util.Display;
    import flash.events.MouseEvent;

    public class _Str_8718 extends OverlayView 
    {
        protected var _Str_7282:Function = null;
        protected var _active:Boolean = false;

        public function _Str_8718(k:RegionController, _arg_2:RegionViewConfig, _arg_3:Display, _arg_4:int=-1, _arg_5:int=-1)
        {
            super(k, _arg_2, _arg_3);
            if (_arg_2._Str_24560())
            {
                if (((_arg_2._Str_24467()) || (_arg_2._Str_23156())))
                {
                    this.alpha = 0.8;
                    this.addChild(_arg_2.image);
                }
            }
            else
            {
                if (_arg_2._Str_23612())
                {
                }
            }
        }

        public function _Str_23238(k:Function):void
        {
            this._Str_7282 = k;
        }

        override protected function onMouseOver(k:MouseEvent):void
        {
            this.alpha = 1;
        }

        override protected function onMouseOut(k:MouseEvent):void
        {
            this.alpha = 0.8;
        }

        override protected function onClick(k:MouseEvent):void
        {
            if (this._Str_7282 != null)
            {
                this._Str_7282();
            }
        }

        public function get active():Boolean
        {
            return this._active;
        }

        public function activate():void
        {
            this._active = true;
            show();
        }

        public function deactivate():void
        {
            this._active = false;
            hide();
        }
    }
}
