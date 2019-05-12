package com.sulake.habbo.notifications.feed.view.pane
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.notifications.feed.NotificationView;
    import com.sulake.core.runtime.exceptions.Exception;

    public class AbstractPane implements IPane 
    {
        public static const PANE_VIEW_LEVEL_BASE:int = 0;
        public static const PANE_VIEW_LEVEL_FEED:int = 1;
        public static const PANE_VIEW_LEVEL_MODAL:int = 2;

        protected var _Str_580:Boolean;
        protected var _Str_3816:Boolean;
        private var _Str_20734:int;
        protected var window:IWindowContainer;
        protected var _Str_2439:NotificationView;
        protected var _name:String;

        public function AbstractPane(k:String, _arg_2:NotificationView, _arg_3:IWindowContainer, _arg_4:int)
        {
            if (_arg_3 == null)
            {
                throw (new Exception(("Window was null for feed pane: " + k)));
            }
            this._name = k;
            this._Str_2439 = _arg_2;
            this._Str_20734 = _arg_4;
            this.window = _arg_3;
        }

        public function dispose():void
        {
            this._Str_580 = true;
        }

        public function get disposed():Boolean
        {
            return this._Str_580;
        }

        public function get name():String
        {
            return this._name;
        }

        public function get _Str_16687():int
        {
            return this._Str_20734;
        }

        public function set _Str_2719(k:Boolean):void
        {
            this._Str_3816 = k;
            this.window.visible = this._Str_3816;
        }

        public function get _Str_2719():Boolean
        {
            return this._Str_3816;
        }
    }
}
