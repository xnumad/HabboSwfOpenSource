package com.sulake.habbo.notifications.singular
{
	import com.sulake.habbo.notifications.singular.HabboNotificationItemStyle;
	
    public class HabboNotificationItem 
    {
        private var _style:HabboNotificationItemStyle;
        private var _content:String;
        private var _controller:SingularNotificationController;

        public function HabboNotificationItem(k:String, _arg_2:HabboNotificationItemStyle, _arg_3:SingularNotificationController)
        {
            this._content = k;
            this._style = _arg_2;
            this._controller = _arg_3;
        }

        public function get style():HabboNotificationItemStyle
        {
            return this._style;
        }

        public function get content():String
        {
            return this._content;
        }

        public function dispose():void
        {
            this._content = null;
            if (this._style != null)
            {
                this._style.dispose();
                this._style = null;
            }
            this._controller = null;
        }

        public function _Str_25246():void
        {
            if (this._style.internalLink)
            {
                this._controller._Str_22352(this._style.internalLink);
            }
        }
    }
}
