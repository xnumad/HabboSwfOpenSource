package com.sulake.habbo.quest
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.widgets._Str_2402;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.IWindowContainer;

    public class AchievementResolutionCompletedView implements IDisposable 
    {
        private static const HEADER_BUTTON_CLOSE:String = "header_button_close";
        private static const CANCEL_BUTTON:String = "cancel_button";

        private var _controller:AchievementsResolutionController;
        private var _window:IFrameWindow;
        private var _badgeCode:String;
        private var _stuffCode:String;

        public function AchievementResolutionCompletedView(k:AchievementsResolutionController)
        {
            this._controller = k;
        }

        public function dispose():void
        {
            this._controller = null;
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
        }

        public function get disposed():Boolean
        {
            return !(this._controller == null);
        }

        public function get visible():Boolean
        {
            if (!this._window)
            {
                return false;
            }
            return this._window.visible;
        }

        public function show(k:String, _arg_2:String):void
        {
            if (this._window == null)
            {
                this.createWindow();
            }
            this._Str_10233();
            this._stuffCode = k;
            this._badgeCode = _arg_2;
            this._Str_5605(this._badgeCode);
            this._window.visible = true;
        }

        private function createWindow():void
        {
            this._window = IFrameWindow(this._controller.questEngine.getXmlWindow("AchievementResolutionCompleted"));
            this._Str_2471(HEADER_BUTTON_CLOSE);
            this._Str_2471(CANCEL_BUTTON);
        }

        private function _Str_2471(k:String):void
        {
            var _local_2:IWindow = this._window.findChildByName(k);
            if (_local_2 != null)
            {
                _local_2.addEventListener(WindowMouseEvent.CLICK, this.onMouseClick);
            }
        }

        private function onMouseClick(k:WindowMouseEvent):void
        {
            switch (k.target.name)
            {
                case HEADER_BUTTON_CLOSE:
                case CANCEL_BUTTON:
                    this.close();
                    return;
            }
        }

        private function _Str_10233():void
        {
            this._window.center();
        }

        private function _Str_5605(k:String):void
        {
            var _local_2:IWidgetWindow = (this._window.findChildByName("achievement_badge") as IWidgetWindow);
            var _local_3:_Str_2402 = (_local_2.widget as _Str_2402);
            IStaticBitmapWrapperWindow(IWindowContainer(_local_2._Str_2429).findChildByName("bitmap")).assetUri = "common_loading_icon";
            _local_3.badgeId = k;
            _local_2.visible = true;
        }

        public function close():void
        {
            if (this._window)
            {
                this._window.visible = false;
            }
        }
    }
}
