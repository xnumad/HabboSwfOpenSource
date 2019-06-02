package com.sulake.habbo.quest
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.widgets._Str_2402;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.window.widgets._Str_2961;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class AchievementResolutionProgressView implements IDisposable 
    {
        private static const ACHIEVED_LEFT:String = "achieved_left";
        private static const ACHIEVED_MID:String = "achieved_mid";
        private static const ACHIEVED_RIGHT:String = "achieved_right";

        private var _progressSteps:int;
        private var _controller:AchievementsResolutionController;
        private var _window:IFrameWindow;
        private var _stuffId:int;
        private var _achievementId:int;
        private var _badgeCode:String;

        public function AchievementResolutionProgressView(k:AchievementsResolutionController)
        {
            this._controller = k;
        }

        public function dispose():void
        {
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
            this._controller = null;
        }

        public function get disposed():Boolean
        {
            return this._controller == null;
        }

        public function get achievementId():int
        {
            return this._achievementId;
        }

        public function get stuffId():int
        {
            return this._stuffId;
        }

        public function get visible():Boolean
        {
            if (!this._window)
            {
                return false;
            }
            return this._window.visible;
        }

        public function show(k:int, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:int, _arg_6:int):void
        {
            if (this._window == null)
            {
                this.createWindow();
            }
            if (_arg_2 != this._achievementId)
            {
                this._Str_10233();
                this._window.center();
            }
            this._stuffId = k;
            this._achievementId = _arg_2;
            this._badgeCode = _arg_3;
            this._Str_11199(_arg_4, _arg_5);
            this._Str_5605(this._badgeCode);
            this._Str_24386();
            this._Str_23834(_arg_6);
            this._window.visible = true;
        }

        private function _Str_11199(k:int, _arg_2:int):void
        {
            var _local_3:Number = Math.min(1, (Number(k) / _arg_2));
            if (_local_3 > 0)
            {
                this._window.setVisibleChildren(true, [ACHIEVED_LEFT, ACHIEVED_MID]);
                this._window.findChildByName(ACHIEVED_RIGHT).visible = (_local_3 == 1);
            }
            this._window.findChildByName(ACHIEVED_MID).width = (this._progressSteps * _local_3);
            this._controller.questEngine.localization.registerParameter("resolution.progress.progress", "progress", k.toString());
            this._controller.questEngine.localization.registerParameter("resolution.progress.progress", "total", _arg_2.toString());
        }

        private function _Str_5605(k:String):void
        {
            var _local_2:IWidgetWindow = (this._window.findChildByName("achievement_badge") as IWidgetWindow);
            var _local_3:_Str_2402 = (_local_2.widget as _Str_2402);
            IStaticBitmapWrapperWindow(IWindowContainer(_local_2._Str_2429).findChildByName("bitmap")).assetUri = "common_loading_icon";
            _local_3.badgeId = k;
            _local_2.visible = true;
        }

        private function _Str_24386():void
        {
            this._window.findChildByName("achievement.name").caption = this._controller.questEngine.localization.getBadgeName(this._badgeCode);
            this._window.findChildByName("achievement.desc").caption = this._controller.questEngine.localization.getBadgeDesc(this._badgeCode);
        }

        private function _Str_23834(k:int):void
        {
            var _local_2:IWidgetWindow = IWidgetWindow(this._window.findChildByName("time_left_widget"));
            var _local_3:_Str_2961 = _Str_2961(_local_2.widget);
            _local_3.seconds = k;
            _local_3.running = true;
        }

        private function createWindow():void
        {
            this._window = IFrameWindow(this._controller.questEngine.getXmlWindow("AchievementResolutionProgress"));
            this._window.findChildByTag("close").procedure = this._Str_3046;
            this._window.findChildByName("reset_button").procedure = this._Str_25050;
            this._progressSteps = this._window.findChildByName(ACHIEVED_MID).width;
        }

        private function _Str_10233():void
        {
            this._window.center();
            this._window.setVisibleChildren(false, [ACHIEVED_LEFT, ACHIEVED_MID, ACHIEVED_RIGHT]);
        }

        public function close():void
        {
            if (this._window)
            {
                this._window.visible = false;
            }
        }

        private function _Str_3046(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this.close();
            }
        }

        private function _Str_25050(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._controller._Str_23910(this._stuffId);
                this.close();
            }
        }
    }
}
