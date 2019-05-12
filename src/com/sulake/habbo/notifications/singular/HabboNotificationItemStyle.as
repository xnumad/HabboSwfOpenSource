package com.sulake.habbo.notifications.singular
{
    import flash.display.BitmapData;
    import com.sulake.core.utils.Map;

    public class HabboNotificationItemStyle 
    {
        private var _icon:BitmapData;
        private var _disposeIcon:Boolean;
        private var _iconSrc:String;
        private var _internalLink:String;
        private var _iconAssetUri:String;

        public function HabboNotificationItemStyle(k:Map, _arg_2:BitmapData, _arg_3:String, _arg_4:Boolean, _arg_5:String)
        {
            this._iconAssetUri = _arg_3;
            if (((!(k == null)) && (_arg_3 == null)))
            {
                this._icon = k["icon"];
                this._internalLink = k["internallink"];
            }
            if (_arg_2 != null)
            {
                this._icon = _arg_2;
                this._disposeIcon = _arg_4;
            }
            else
            {
                this._disposeIcon = false;
            }
            this._iconSrc = _arg_5;
        }

        public function dispose():void
        {
            if (((this._disposeIcon) && (!(this._icon == null))))
            {
                this._icon.dispose();
                this._icon = null;
            }
        }

        public function get icon():BitmapData
        {
            return this._icon;
        }

        public function get internalLink():String
        {
            return this._internalLink;
        }

        public function set internalLink(k:String):void
        {
            this._internalLink = k;
        }

        public function get _Str_25821():String
        {
            return this._iconSrc;
        }

        public function get _Str_21712():String
        {
            return this._iconAssetUri;
        }
    }
}
