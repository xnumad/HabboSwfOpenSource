package org.openvideoads.regions.view
{
    import org.openvideoads.util.NetworkResource;
    import flash.text.StyleSheet;

    public class _Str_5987 extends NetworkResource 
    {
        private var _Str_16019:Function;
        private var _stylesheet:StyleSheet;

        public function _Str_5987(k:String=null, _arg_2:Function=null)
        {
            this._Str_16019 = _arg_2;
            this._stylesheet = new StyleSheet();
            if (k != null)
            {
                url = k;
                call();
            }
        }

        override protected function loadComplete(k:String):void
        {
            this._stylesheet = new StyleSheet();
            this.parseCSS(k);
            if (this._Str_16019 != null)
            {
                this._Str_16019();
            }
        }

        public function parseCSS(k:String):void
        {
            this._stylesheet.parseCSS(k);
        }

        public function get stylesheet():StyleSheet
        {
            return this._stylesheet;
        }
    }
}
