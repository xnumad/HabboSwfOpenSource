package org.openvideoads.vast.events
{
    import org.openvideoads.vast.model.NonLinearVideoAd;
    import org.openvideoads.vast.VASTController;

    public class _Str_3019 
    {
        private var _ad:NonLinearVideoAd = null;
        private var _Str_7867:Object;
        private var _controller:VASTController = null;
        private var _width:int = -1;
        private var _height:int = -1;

        public function _Str_3019(k:VASTController=null, _arg_2:int=-1, _arg_3:int=-1, _arg_4:Object=null)
        {
            this._Str_7867 = new Object();
            super();
            this._controller = k;
            this._width = _arg_2;
            this._height = _arg_3;
            if (_arg_4 != null)
            {
                this._Str_7867 = _arg_4;
            }
        }

        public function set controller(k:VASTController):void
        {
            this._controller = k;
        }

        public function get controller():VASTController
        {
            return this._controller;
        }

        public function set width(k:int):void
        {
            this._width = k;
        }

        public function get width():int
        {
            return this._width;
        }

        public function set height(k:int):void
        {
            this._height = k;
        }

        public function get height():int
        {
            return this._height;
        }

        public function _Str_19052():Boolean
        {
            return !(this._ad == null);
        }

        public function set ad(k:NonLinearVideoAd):void
        {
            this._ad = k;
        }

        public function get ad():NonLinearVideoAd
        {
            return this._ad;
        }

        public function set _Str_3073(k:Object):void
        {
            this._Str_7867 = k;
        }

        public function get _Str_3073():Object
        {
            return this._Str_7867;
        }
    }
}
