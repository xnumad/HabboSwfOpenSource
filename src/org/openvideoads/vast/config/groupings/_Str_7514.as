package org.openvideoads.vast.config.groupings
{
    import org.openvideoads.util.NetworkResource;
    import org.openvideoads.vast.config._Str_2741;

    public class _Str_7514 extends NetworkResource implements _Str_2741 
    {
        protected var _Str_23188:String = "http://tracker.openvideoads.org/log-event.php";
        protected var _Str_26384:String = "http://debug.openvideoads.org/log-debug.php";

        public function _Str_7514()
        {
            this._Str_24796();
        }

        public function initialise(k:Object=null):void
        {
            this.onOVAConfigLoaded();
        }

        public function isOVAConfigLoading():Boolean
        {
            return false;
        }

        public function _Str_6073():Boolean
        {
            return false;
        }

        public function onOVAConfigLoaded():void
        {
        }

        public function _Str_3144():void
        {
        }

        private function _Str_24796():void
        {
        }

        public function get _Str_26167():String
        {
            return this._Str_23188;
        }
    }
}
