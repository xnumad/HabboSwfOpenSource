package com.sulake.habbo.friendbar.landingview.layout
{
    import com.sulake.core.runtime.IHabboConfigurationManager;

    public class _Str_3198 
    {
        private static const _Str_16303:uint = 0xFF000000;
        private static const _Str_18953:uint = 0xFFFFFFFF;
        private static const BOTTOM:String = "bottom";
        private static const LANDING_VIEW_COMMON_TEXTCOLOR:String = "landing.view.common.textcolor";
        private static const LANDING_VIEW_COMMON_ETCHINGCOLOR:String = "landing.view.common.etchingcolor";
        private static const LANDING_VIEW_COMMON_ETCHINGPOSITION:String = "landing.view.common.etchingposition";

        private var _textColor:uint = 0xFF000000;
        private var _etchingColor:uint = 0xFFFFFFFF;
        private var _etchingPosition:String = "bottom";

        public function _Str_3198(k:IHabboConfigurationManager)
        {
            if (k.getProperty(LANDING_VIEW_COMMON_TEXTCOLOR) != "")
            {
                this._textColor = parseInt(k.getProperty(LANDING_VIEW_COMMON_TEXTCOLOR), 16);
            }
            if (k.getProperty(LANDING_VIEW_COMMON_ETCHINGCOLOR) != "")
            {
                this._etchingColor = parseInt(k.getProperty(LANDING_VIEW_COMMON_ETCHINGCOLOR), 16);
            }
            if (k.getProperty(LANDING_VIEW_COMMON_ETCHINGPOSITION) != "")
            {
                this._etchingPosition = k.getProperty(LANDING_VIEW_COMMON_ETCHINGPOSITION);
            }
        }

        public function get _Str_16938():Boolean
        {
            return !(this._textColor == _Str_16303);
        }

        public function get _Str_16698():Boolean
        {
            return !(this._etchingColor == _Str_18953);
        }

        public function get _Str_18420():Boolean
        {
            return !(this._etchingPosition == BOTTOM);
        }

        public function get textColor():uint
        {
            return this._textColor;
        }

        public function get etchingColor():uint
        {
            return this._etchingColor;
        }

        public function get etchingPosition():String
        {
            return this._etchingPosition;
        }
    }
}
