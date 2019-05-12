package org.openvideoads.vast.schedule.ads.templates
{
    import org.openvideoads.base.Debuggable;
    import flash.display.DisplayObject;
    import org.openvideoads.vast.model.NonLinearVideoAd;

    public class _Str_3048 extends Debuggable 
    {
        public static const _Str_6497:String = "html5";
        public static const FLASH:String = "flash";

        protected var _Str_2620:String = "_code_";
        protected var _Str_3875:DisplayObject = null;
        protected var _Str_4491:String = "flash";

        public function _Str_3048(k:String="flash", _arg_2:String=null)
        {
            this._Str_4491 = k;
            if (_arg_2 != null)
            {
                this._Str_2620 = _arg_2;
            }
        }

        protected function replace(k:String, _arg_2:String, _arg_3:String):String
        {
            var _local_4:RegExp = new RegExp((("_" + _arg_2) + "_"), "g");
            return k.replace(_local_4, _arg_3);
        }

        public function getContent(k:NonLinearVideoAd):String
        {
            if (k != null)
            {
                if (k._Str_3937())
                {
                    return this.replace(this._Str_2620, "code", k.codeBlock);
                }
                if (k.url != null)
                {
                    return this.replace(this._Str_2620, "code", k.url.url);
                }
                return "";
            }
            return "Non-linear video ad not available";
        }

        public function set template(k:String):void
        {
            this._Str_2620 = k;
        }

        public function get template():String
        {
            return this._Str_2620;
        }
    }
}
