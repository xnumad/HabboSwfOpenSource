package org.openvideoads.vast.overlay.button.skip
{
    import flash.events.Event;

    public class _Str_4790 extends Event 
    {
        public static const _Str_3831:String = "display-skip-button";
        public static const _Str_2703:String = "hide-skip-button";

        protected var _Str_2442:String = null;
        protected var _Str_668:String = null;
        protected var _Str_7282:Function = null;

        public function _Str_4790(k:String, _arg_2:String, _arg_3:String=null, _arg_4:Function=null, _arg_5:Boolean=false, _arg_6:Boolean=false)
        {
            super(k, _arg_5, _arg_6);
            this._Str_2442 = _arg_2;
            this._Str_668 = _arg_3;
            this._Str_7282 = _arg_4;
        }

        public function get region():String
        {
            return this._Str_2442;
        }

        public function get resource():String
        {
            return this._Str_668;
        }

        public function get _Str_25545():Function
        {
            return this._Str_7282;
        }

        public function _Str_26221():Boolean
        {
            return true;
        }

        public function _Str_19315():Boolean
        {
            return false;
        }

        override public function clone():Event
        {
            return new _Str_4790(type, this._Str_2442, this._Str_668, this._Str_7282, bubbles, cancelable);
        }
    }
}
