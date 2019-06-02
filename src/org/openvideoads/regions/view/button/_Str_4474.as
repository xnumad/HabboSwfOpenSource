package org.openvideoads.regions.view.button
{
    import flash.display.Sprite;
    import org.openvideoads.regions.view.RegionView;
    import flash.events.MouseEvent;

    public class _Str_4474 extends Sprite 
    {
        private var _id:String;
        private var _Str_16355:RegionView = null;
        protected var _Str_16578:int = 0;
        protected var _Str_16974:int = 0;

        public function _Str_4474(k:String=null, _arg_2:RegionView=null, _arg_3:int=0, _arg_4:int=0)
        {
            this._id = k;
            this._Str_16355 = _arg_2;
            this._Str_16578 = _arg_3;
            this._Str_16974 = _arg_4;
            this.drawButton();
            addEventListener(MouseEvent.ROLL_OVER, this.onMouseOver);
            addEventListener(MouseEvent.ROLL_OUT, this.onMouseOut);
            addEventListener(MouseEvent.CLICK, this.onMouseClick);
            buttonMode = true;
            this.mouseChildren = true;
        }

        public function set _Str_17906(k:int):void
        {
            this._Str_16578 = k;
        }

        public function get _Str_17906():int
        {
            return this._Str_16578;
        }

        public function set _Str_16283(k:int):void
        {
            this._Str_16974 = k;
        }

        public function get _Str_16283():int
        {
            return this._Str_16974;
        }

        public function calculateLayoutPosition(k:int, _arg_2:int):void
        {
            x = ((k - this._Str_17906) - (_arg_2 / 5));
            y = ((_arg_2 > 0) ? (this._Str_16283 + (_arg_2 / 5)) : this._Str_16283);
        }

        protected function drawButton():void
        {
        }

        protected function onMouseOut(k:MouseEvent):void
        {
            this.alpha = 0.7;
        }

        protected function onMouseOver(k:MouseEvent):void
        {
            this.alpha = 1;
        }

        protected function onMouseClick(k:MouseEvent):void
        {
            k.stopPropagation();
            if (this._Str_16355 != null)
            {
                this._Str_16355._Str_14359();
            }
        }
    }
}
