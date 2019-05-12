package org.openvideoads.vast.overlay
{
    import org.openvideoads.base.Debuggable;
    import org.openvideoads.regions.view.RegionView;
    import flash.utils.Timer;

    public class _Str_10839 extends Debuggable 
    {
        protected var _Str_14323:String = null;
        protected var _Str_2467:int = 0;
        protected var _Str_4771:RegionView = null;
        protected var _Str_2364:Timer = null;

        public function _Str_10839(k:String, _arg_2:int, _arg_3:RegionView)
        {
            this._Str_14323 = k;
            this._Str_2467 = _arg_2;
            this._Str_4771 = _arg_3;
        }

        public function show():void
        {
            if (this._Str_25183())
            {
                this._Str_25022();
            }
            else
            {
                this._Str_25805();
            }
        }

        public function hide():void
        {
            this._Str_24263();
        }

        protected function _Str_25183():Boolean
        {
            if (this._Str_14323 != null)
            {
                return this._Str_14323.indexOf("_countdown_") > -1;
            }
            return false;
        }

        protected function _Str_25022():void
        {
            if (this._Str_4771 != null)
            {
                this._Str_21375(this._Str_2467);
            }
        }

        protected function _Str_24263():void
        {
            if (this._Str_2364 != null)
            {
                this._Str_2364.stop();
                this._Str_2364 = null;
            }
            if (this._Str_4771 != null)
            {
                this._Str_4771.hide();
            }
        }

        protected function _Str_19421(k:String, _arg_2:int):String
        {
            var _local_3:RegExp = new RegExp(k, "g");
            return this._Str_14323.replace(_local_3, _arg_2);
        }

        protected function _Str_25805():void
        {
            if (this._Str_4771 != null)
            {
                this._Str_4771._Str_19536();
                this._Str_4771.html = this._Str_19421("_seconds_", this._Str_2467);
                this._Str_4771.visible = true;
            }
        }

        public function _Str_21375(k:int):void
        {
            if (this._Str_4771 != null)
            {
                this._Str_4771._Str_19536();
                this._Str_4771.html = this._Str_19421("_countdown_", k);
                this._Str_4771.visible = true;
            }
        }
    }
}
