package com.sulake.habbo.quest
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.components.IFrameWindow;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.inventory.achievements.AchievementResolution;
    import com.sulake.core.window.components.IItemGridWindow;
    import com.sulake.habbo.communication.messages.outgoing._Str_295._Str_4406;
    import com.sulake.habbo.communication.messages.incoming.notifications._Str_6768;
    import com.sulake.habbo.communication.messages.incoming.inventory.achievements.Achievement;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.communication.messages.outgoing._Str_295._Str_9826;
    import com.sulake.habbo.window.utils._Str_2910;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.widgets._Str_2961;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.window.widgets._Str_2402;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;

    public class AchievementsResolutionController implements IDisposable 
    {
        private static const HEADER_BUTTON_CLOSE:String = "header_button_close";
        private static const SAVE_BUTTON:String = "save_button";
        private static const CANCEL_BUTTON:String = "cancel_button";
        private static const OK_BUTTON:String = "ok_button";
        private static const DISABLED_REASON:String = "disabled.reason";

        private var _questEngine:HabboQuestEngine;
        private var _window:IFrameWindow;
        private var _progressView:AchievementResolutionProgressView;
        private var _completedView:AchievementResolutionCompletedView;
        private var _stuffId:int;
        private var _achievements:Vector.<AchievementResolution>;
        private var _selectedAchievementId:int = -1;
        private var _endTime:int = -1;

        public function AchievementsResolutionController(k:HabboQuestEngine)
        {
            this._questEngine = k;
        }

        public function dispose():void
        {
            var k:IItemGridWindow;
            this._questEngine = null;
            if (this._window)
            {
                k = (this._window.findChildByName("achievements") as IItemGridWindow);
                if (k)
                {
                    k.destroyGridItems();
                }
                if (this._progressView)
                {
                    this._progressView.dispose();
                    this._progressView = null;
                }
                if (this._completedView)
                {
                    this._completedView.dispose();
                    this._completedView = null;
                }
                this._window.dispose();
                this._window = null;
            }
        }

        public function get disposed():Boolean
        {
            return this._questEngine == null;
        }

        public function _Str_23538(k:int, _arg_2:Vector.<AchievementResolution>, _arg_3:int):void
        {
            this._stuffId = k;
            this._achievements = _arg_2;
            this._endTime = _arg_3;
            if (_arg_2.length == 0)
            {
                return;
            }
            this.refresh();
            this._window.visible = true;
            this._selectedAchievementId = this._achievements[0].achievementId;
            this._Str_23858();
            this._Str_20512(this._selectedAchievementId);
        }

        public function _Str_24205(k:int, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:int, _arg_6:int):void
        {
            if (!this._progressView)
            {
                this._progressView = new AchievementResolutionProgressView(this);
            }
            this._progressView.show(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6);
        }

        public function _Str_25733(k:String, _arg_2:String):void
        {
            if (!this._completedView)
            {
                this._completedView = new AchievementResolutionCompletedView(this);
            }
            this._completedView.show(_arg_2, k);
        }

        public function _Str_11598(k:_Str_6768):void
        {
            if ((((this._progressView) && (this._progressView.visible)) && (k.type == this._progressView.achievementId)))
            {
                this._questEngine.send(new _Str_4406(this._progressView.stuffId, 0));
            }
        }

        public function _Str_12011(k:Achievement):void
        {
            if ((((this._progressView) && (this._progressView.visible)) && (k.achievementId == this._progressView.achievementId)))
            {
                this._questEngine.send(new _Str_4406(this._progressView.stuffId, 0));
            }
        }

        public function _Str_23910(stuffId:int):void
        {
            var title:String;
            var summary:String;
            if ((((this._progressView) && (this._progressView.visible)) && (stuffId == this._progressView.stuffId)))
            {
                title = "${resolution.reset.confirmation.title}";
                summary = "${resolution.reset.confirmation.text}";
                this._questEngine.windowManager.confirm(title, summary, 0, function (k:_Str_2910, _arg_2:WindowEvent):void
                {
                    k.dispose();
                    if (_arg_2.type == WindowEvent.WINDOW_EVENT_OK)
                    {
                        _questEngine.send(new _Str_9826(stuffId));
                        _questEngine.send(new _Str_4406(_progressView.stuffId, 0));
                    }
                });
            }
        }

        private function refresh():void
        {
            if (this._window == null)
            {
                this._Str_2755();
            }
            var k:IWidgetWindow = IWidgetWindow(this._window.findChildByName("countdown_widget"));
            var _local_2:_Str_2961 = _Str_2961(k.widget);
            _local_2.seconds = this._endTime;
            _local_2.running = true;
        }

        private function _Str_2755():void
        {
            if (this._window != null)
            {
                return;
            }
            this._window = IFrameWindow(this._questEngine.getXmlWindow("AchievementsResolutions"));
            this._window.findChildByTag("close").procedure = this._Str_3046;
            this._window.center();
            this._window.visible = true;
            this._Str_2471(HEADER_BUTTON_CLOSE);
            this._Str_2471(SAVE_BUTTON);
            this._Str_2471(CANCEL_BUTTON);
        }

        private function _Str_3046(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this.close();
            }
        }

        private function _Str_2471(k:String):void
        {
            var _local_2:IWindow = this._window.findChildByName(k);
            if (_local_2 != null)
            {
                _local_2.addEventListener(WindowMouseEvent.CLICK, this.onMouseClick);
            }
        }

        private function onMouseClick(event:WindowMouseEvent):void
        {
            var title:String;
            var summary:String;
            switch (event.target.name)
            {
                case HEADER_BUTTON_CLOSE:
                case CANCEL_BUTTON:
                    this.close();
                    return;
                case OK_BUTTON:
                    return;
                case SAVE_BUTTON:
                    title = "${resolution.confirmation.title}";
                    summary = "${resolution.confirmation.text}";
                    this.close();
                    this._questEngine.windowManager.confirm(title, summary, 0, function (k:_Str_2910, _arg_2:WindowEvent):void
                    {
                        k.dispose();
                        if (_arg_2.type == WindowEvent.WINDOW_EVENT_OK)
                        {
                            _questEngine.send(new _Str_4406(_stuffId, _selectedAchievementId));
                        }
                        else
                        {
                            _window.visible = true;
                        }
                    });
                    return;
            }
        }

        public function isVisible():Boolean
        {
            return (this._window) && (this._window.visible);
        }

        public function close():void
        {
            if (this._window)
            {
                this._window.visible = false;
            }
        }

        private function _Str_23858():void
        {
            var _local_3:AchievementResolution;
            var _local_4:IWindowContainer;
            var k:IItemGridWindow = (this._window.findChildByName("achievements") as IItemGridWindow);
            k.destroyGridItems();
            var _local_2:IWindow = this._questEngine.getXmlWindow("AchievementSimple");
            for each (_local_3 in this._achievements)
            {
                _local_4 = (_local_2.clone() as IWindowContainer);
                _local_4.id = _local_3.achievementId;
                this._Str_9242(_local_4, _local_3);
                _local_4.findChildByName("bg_region").procedure = this._Str_25036;
                _local_4.findChildByName("bg_selected_bitmap").visible = false;
                k._Str_2816(_local_4);
            }
        }

        private function _Str_22239(k:int, _arg_2:Boolean):void
        {
            var _local_3:IItemGridWindow = (this._window.findChildByName("achievements") as IItemGridWindow);
            var _local_4:IWindowContainer = (_local_3._Str_15490(k) as IWindowContainer);
            if (_local_4)
            {
                _local_4.findChildByName("bg_selected_bitmap").visible = _arg_2;
            }
        }

        private function _Str_20512(k:int):void
        {
            if (this._selectedAchievementId != -1)
            {
                this._Str_22239(this._selectedAchievementId, false);
            }
            var _local_2:AchievementResolution = this._Str_23000(k);
            if (_local_2 == null)
            {
                return;
            }
            this._selectedAchievementId = k;
            this._Str_22239(this._selectedAchievementId, true);
            this._window.findChildByName("achievement.name").caption = this._questEngine.localization.getBadgeName(_local_2.badgeId);
            this._window.findChildByName("achievement.description").caption = this._questEngine.localization.getBadgeDesc(_local_2.badgeId);
            this._window.findChildByName("achievement.level").caption = _local_2.level.toString();
            this._questEngine.localization.registerParameter("resolution.achievement.target.value", "level", _local_2._Str_20240.toString());
            this._Str_16547(_local_2);
            if (_local_2.enabled)
            {
                this.enable();
            }
            else
            {
                this.disable(_local_2.state);
            }
        }

        private function disable(k:int):void
        {
            this._window.setVisibleChildren(false, [SAVE_BUTTON]);
            this._window.setVisibleChildren(true, [DISABLED_REASON]);
            this._window.findChildByName(DISABLED_REASON).caption = (("${resolution.disabled." + k) + "}");
        }

        public function enable():void
        {
            this._window.setVisibleChildren(true, [SAVE_BUTTON]);
            this._window.setVisibleChildren(false, [DISABLED_REASON]);
        }

        private function _Str_25036(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._Str_20512(_arg_2.parent.id);
        }

        private function _Str_9242(k:IWindowContainer, _arg_2:AchievementResolution):void
        {
            var _local_3:IWidgetWindow = (k.findChildByName("achievement_pic_bitmap") as IWidgetWindow);
            var _local_4:_Str_2402 = (_local_3.widget as _Str_2402);
            if (_arg_2 == null)
            {
                _local_3.visible = false;
                return;
            }
            IStaticBitmapWrapperWindow(IWindowContainer(_local_3._Str_2429).findChildByName("bitmap")).assetUri = "common_loading_icon";
            _local_4.badgeId = _arg_2.badgeId;
            _local_4.greyscale = (!(_arg_2.enabled));
            _local_3.visible = true;
        }

        private function _Str_16547(k:AchievementResolution):void
        {
            var _local_2:IWidgetWindow = (this._window.findChildByName("achievement_badge") as IWidgetWindow);
            var _local_3:_Str_2402 = (_local_2.widget as _Str_2402);
            IStaticBitmapWrapperWindow(IWindowContainer(_local_2._Str_2429).findChildByName("bitmap")).assetUri = "common_loading_icon";
            _local_3.badgeId = k.badgeId;
            _local_3.greyscale = (!(k.enabled));
            _local_2.visible = true;
        }

        private function _Str_23000(k:int):AchievementResolution
        {
            var _local_2:AchievementResolution;
            for each (_local_2 in this._achievements)
            {
                if (_local_2.achievementId == k)
                {
                    return _local_2;
                }
            }
            return null;
        }

        public function get questEngine():HabboQuestEngine
        {
            return this._questEngine;
        }
    }
}
