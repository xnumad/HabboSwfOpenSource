package com.sulake.habbo.quest
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.runtime.IUpdateReceiver;
    import flash.geom.Point;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.communication.messages.incoming.inventory.achievements.Achievement;
    import flash.utils.Timer;
    import flash.utils.Dictionary;
    import flash.events.TimerEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.quest.events.UnseenAchievementsCountUpdateEvent;
    import com.sulake.habbo.communication.messages.outgoing.achievements.RequestAchievementsMessageComposer;
    import __AS3__.vec.Vector;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.communication.messages.outgoing.tracking.EventLogMessageComposer;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.widgets._Str_2402;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.session.events.BadgeImageReadyEvent;

    public class AchievementController implements IDisposable, IUpdateReceiver 
    {
        private static const _Str_12149:int = 3;
        private static const _Str_18016:int = 8;
        private static const _Str_16554:int = 5;
        private static const _Str_16714:int = 6;
        private static const _Str_18851:int = 3;
        private static const _Str_18502:int = 2;
        private static const _Str_16007:int = 4;
        private static const _Str_10474:int = 6;
        private static const _Str_17339:int = 180;
        private static const _Str_17358:int = 246;
        private static const _Str_18435:uint = 12910463;
        private static const _Str_7408:int = 45;
        private static const _Str_18670:Point = new Point(115, 93);
        private static const _Str_17128:Point = new Point(72, 1);
        private static const _Str_18715:int = 20;
        private static const _Str_18343:int = 3;

        private var _questEngine:HabboQuestEngine;
        private var _window:IFrameWindow;
        private var _categoriesContainer:IWindowContainer;
        private var _achievementsContainer:IWindowContainer;
        private var _achievementContainer:IWindowContainer;
        private var _achievementsHeaderContainer:IWindowContainer;
        private var _categoriesFooterContainer:IWindowContainer;
        private var _categories:AchievementCategories;
        private var _category:AchievementCategory;
        private var _achievement:Achievement;
        private var _badgeRefreshTimer:Timer;
        private var _badgeImages:Dictionary;
        private var _inLevelProgressBar:ProgressBar;
        private var _totalProgressBar:ProgressBar;
        private var _pendingCategorySelect:String = null;
        private var _pendingLevel:Achievement;
        private var _pendingLevelTimer:Timer;
        private var _badgeYPositionFixes:Dictionary;
        private var _requestedShowAchievements:Boolean;
        private var _unseenAchievements:Dictionary;

        public function AchievementController(k:HabboQuestEngine)
        {
            this._badgeImages = new Dictionary();
            this._badgeYPositionFixes = new Dictionary();
            this._unseenAchievements = new Dictionary();
            super();
            this._questEngine = k;
            this._badgeRefreshTimer = new Timer(100, 1);
            this._badgeRefreshTimer.addEventListener(TimerEvent.TIMER, this._Str_19817);
            this._pendingLevelTimer = new Timer(2000, 1);
            this._pendingLevelTimer.addEventListener(TimerEvent.TIMER, this._Str_20234);
            this._badgeYPositionFixes[16] = 1;
            this._badgeYPositionFixes[28] = 6;
            this._badgeYPositionFixes[38] = 4;
            this._badgeYPositionFixes[39] = 3;
            this._badgeYPositionFixes[40] = 1;
        }

        public static function _Str_14509(k:IWindowContainer, _arg_2:int, _arg_3:int):void
        {
            var _local_4:int;
            var _local_5:IWindow;
            while (_local_4 < k.numChildren)
            {
                _local_5 = k.getChildAt(_local_4);
                if ((((!(_local_5 == null)) && (_local_5.visible)) && (_local_5.height > 0)))
                {
                    _local_5.y = _arg_2;
                    _arg_2 = (_arg_2 + (_local_5.height + _arg_3));
                }
                _local_4++;
            }
        }

        public static function _Str_2647(k:IWindowContainer):int
        {
            var _local_4:IWindow;
            var _local_2:int;
            var _local_3:int;
            while (_local_3 < k.numChildren)
            {
                _local_4 = k.getChildAt(_local_3);
                if (_local_4.visible)
                {
                    _local_2 = Math.max(_local_2, (_local_4.y + _local_4.height));
                }
                _local_3++;
            }
            return _local_2;
        }


        public function dispose():void
        {
            this._questEngine = null;
            this._badgeImages = null;
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
            if (this._badgeRefreshTimer)
            {
                this._badgeRefreshTimer.removeEventListener(TimerEvent.TIMER, this._Str_19817);
                this._badgeRefreshTimer.reset();
                this._badgeRefreshTimer = null;
            }
            if (this._pendingLevelTimer)
            {
                this._pendingLevelTimer.removeEventListener(TimerEvent.TIMER, this._Str_20234);
                this._pendingLevelTimer.reset();
                this._pendingLevelTimer = null;
            }
            if (this._inLevelProgressBar)
            {
                this._inLevelProgressBar.dispose();
                this._inLevelProgressBar = null;
            }
            if (this._totalProgressBar)
            {
                this._totalProgressBar.dispose();
                this._totalProgressBar = null;
            }
            this._categoriesContainer = null;
            this._achievementContainer = null;
            this._achievementContainer = null;
            this._achievementsHeaderContainer = null;
            this._categoriesFooterContainer = null;
        }

        public function get disposed():Boolean
        {
            return this._questEngine == null;
        }

        public function isVisible():Boolean
        {
            return (this._window) && (this._window.visible);
        }

        public function close():void
        {
            this._unseenAchievements = new Dictionary();
            this._Str_18521();
            if (this._window)
            {
                this._window.visible = false;
            }
        }

        private function _Str_18521():void
        {
            var _local_2:Achievement;
            var k:int;
            for each (_local_2 in this._unseenAchievements)
            {
                if (this._Str_25504(_local_2.badgeId))
                {
                }
                else
                {
                    k++;
                }
            }
            this._questEngine.events.dispatchEvent(new UnseenAchievementsCountUpdateEvent(k));
        }

        public function _Str_2960():void
        {
            this.close();
        }

        public function onToolbarClick():void
        {
            if (this.isVisible())
            {
                this.close();
            }
            else
            {
                this.show();
            }
        }

        public function _Str_12909():void
        {
            if (this._categories == null)
            {
                this._questEngine.send(new RequestAchievementsMessageComposer());
            }
        }

        public function show():void
        {
            if (this._categories == null)
            {
                this._questEngine.send(new RequestAchievementsMessageComposer());
                this._requestedShowAchievements = true;
            }
            else
            {
                this.refresh();
                this._window.visible = true;
                this._window.activate();
            }
        }

        public function _Str_17329(k:Array, _arg_2:String):void
        {
            if (this._categories == null)
            {
                this._categories = new AchievementCategories(k);
            }
            if (!this._requestedShowAchievements)
            {
                return;
            }
            this._requestedShowAchievements = false;
            this.refresh();
            this._window.visible = true;
            this._window.activate();
            var _local_3:String = ((this._pendingCategorySelect == null) ? _arg_2 : this._pendingCategorySelect);
            var _local_4:AchievementCategory = this._categories._Str_16342(_local_3);
            if (_local_4 != null)
            {
                this._Str_17738(_local_4);
                this._pendingCategorySelect = null;
            }
        }

        public function _Str_12011(k:Achievement):void
        {
            var _local_2:Boolean;
            if (this._categories != null)
            {
                _local_2 = ((this._achievement) && (this._achievement.achievementId == k.achievementId));
                if (((!(_local_2)) && (!(k.achievementId in this._unseenAchievements))))
                {
                    this._unseenAchievements[k.achievementId] = k;
                    this._Str_18521();
                }
                if (((_local_2) && (k.level > this._achievement.level)))
                {
                    this._achievement._Str_24410();
                    this._pendingLevel = k;
                    this._pendingLevelTimer.start();
                }
                else
                {
                    this._categories.update(k);
                    if (_local_2)
                    {
                        this._achievement = k;
                    }
                }
                if (((this._window) && (this._window.visible)))
                {
                    this.refresh();
                }
            }
        }

        private function _Str_24797(k:String):int
        {
            var _local_3:Achievement;
            var _local_2:int;
            for each (_local_3 in this._unseenAchievements)
            {
                if (_local_3.category == k)
                {
                    _local_2++;
                }
            }
            return _local_2;
        }

        private function refresh():void
        {
            this._Str_2755();
            this._Str_20399();
            this._Str_23920();
            this._Str_25170();
            this._Str_24736();
            this._Str_22606();
            _Str_14509(this._window.content, 0, 4);
            this._window.height = (_Str_2647(this._window.content) + _Str_7408);
        }

        private function _Str_20399():void
        {
            var _local_3:Boolean;
            if (this._category != null)
            {
                this._categoriesContainer.visible = false;
                return;
            }
            this._categoriesContainer.visible = true;
            var k:Vector.<AchievementCategory> = this._categories._Str_16947;
            var _local_2:int;
            while (true)
            {
                if (_local_2 < k.length)
                {
                    this._Str_12989(_local_2, k[_local_2]);
                }
                else
                {
                    _local_3 = this._Str_12989(_local_2, null);
                    if (_local_3)
                    {
                        break;
                    }
                }
                _local_2++;
            }
            this._categoriesContainer.height = _Str_2647(this._categoriesContainer);
        }

        private function _Str_23920():void
        {
            if (this._category != null)
            {
                this._categoriesFooterContainer.visible = false;
                return;
            }
            this._categoriesFooterContainer.visible = true;
            this._totalProgressBar.refresh(this._categories._Str_9594(), this._categories._Str_10932(), 0, 0);
        }

        private function _Str_24736():void
        {
            var _local_4:IWindow;
            var _local_5:Boolean;
            var k:IWindow = this._window.findChildByName("achievements_list");
            if (this._category == null)
            {
                k.visible = false;
                return;
            }
            k.visible = true;
            Logger.log((((this._category.code + " has ") + this._category.achievements.length) + " achievemenets"));
            var _local_2:Vector.<Achievement> = this._category.achievements;
            while (this._achievementsContainer.numChildren > 0)
            {
                this._achievementsContainer.removeChildAt(0);
            }
            var _local_3:int;
            while (true)
            {
                if (_local_3 < _local_2.length)
                {
                    this._Str_19385(_local_3, _local_2[_local_3]);
                }
                else
                {
                    _local_5 = this._Str_19385(_local_3, null);
                    if (_local_5)
                    {
                        break;
                    }
                }
                _local_3++;
            }
            this._achievementsContainer.height = _Str_2647(this._achievementsContainer);
            k.height = (this._achievementsContainer.height + 1);
            this._window.findChildByName("achievements_scrollarea").height = k.height;
            _local_4 = this._window.findChildByName("achievements_scrollbar");
            _local_4.visible = this._Str_18649;
            _local_4.height = k.height;
        }

        private function _Str_25170():void
        {
            if (this._category == null)
            {
                this._achievementsHeaderContainer.visible = false;
                return;
            }
            this._achievementsHeaderContainer.visible = true;
            this._achievementsHeaderContainer.findChildByName("category_name_txt").caption = this._questEngine._Str_21442(this._category.code);
            this._questEngine.localization.registerParameter("achievements.details.categoryprogress", "progress", this._category._Str_9594().toString());
            this._questEngine.localization.registerParameter("achievements.details.categoryprogress", "limit", this._category._Str_10932().toString());
            this._questEngine._Str_21694(this._achievementsHeaderContainer, this._category, false);
        }

        private function _Str_22606():void
        {
            if (this._achievement == null)
            {
                this._achievementContainer.visible = false;
                return;
            }
            this._achievementContainer.visible = true;
            var k:String = this._Str_16394(this._achievement);
            this._achievementContainer.findChildByName("achievement_name_txt").caption = this._questEngine.localization.getBadgeName(k);
            var _local_2:String = this._questEngine.localization.getBadgeDesc(k);
            this._achievementContainer.findChildByName("achievement_desc_txt").caption = ((_local_2 == null) ? "" : _local_2);
            this._questEngine.localization.registerParameter("achievements.details.level", "level", ((this._achievement._Str_7518) ? this._achievement.level.toString() : (this._achievement.level - 1).toString()));
            this._questEngine.localization.registerParameter("achievements.details.level", "limit", this._achievement._Str_20475.toString());
            this._questEngine._Str_19816((!(this._achievement._Str_7518)), this._achievementContainer, this._achievement._Str_21187, this._achievement._Str_20874);
            this._Str_16547(this._achievementContainer, this._achievement);
            this._inLevelProgressBar.refresh(this._achievement._Str_22939, this._achievement._Str_24142, ((this._achievement.achievementId * 10000) + this._achievement.level), this._achievement._Str_25209);
            this._inLevelProgressBar.visible = ((!(this._achievement._Str_24874 == Achievement._Str_15908)) && (!(this._achievement._Str_7518)));
        }

        private function _Str_2755():void
        {
            if (this._window != null)
            {
                return;
            }
            this._window = IFrameWindow(this._questEngine.getXmlWindow("Achievements"));
            this._window.findChildByTag("close").procedure = this._Str_3046;
            this._window.findChildByName("back_button").procedure = this._Str_24533;
            this._window.center();
            this._window.y = _Str_18715;
            this._categoriesContainer = IWindowContainer(this._window.findChildByName("categories_cont"));
            this._achievementsHeaderContainer = IWindowContainer(this._window.findChildByName("achievements_header_cont"));
            this._achievementsContainer = IWindowContainer(this._window.findChildByName("achievements_cont"));
            this._achievementContainer = IWindowContainer(this._window.findChildByName("achievement_cont"));
            this._categoriesFooterContainer = IWindowContainer(this._window.findChildByName("categories_footer_cont"));
            this._inLevelProgressBar = new ProgressBar(this._questEngine, this._achievementContainer, _Str_17339, "achievements.details.progress", true, _Str_18670);
            this._totalProgressBar = new ProgressBar(this._questEngine, this._categoriesFooterContainer, _Str_17358, "achievements.categories.totalprogress", true, _Str_17128);
        }

        private function _Str_12989(k:int, _arg_2:AchievementCategory):Boolean
        {
            var _local_6:int;
            var _local_3:IWindowContainer = IWindowContainer(this._categoriesContainer.getChildByName(k.toString()));
            var _local_4:int = Math.floor((k / _Str_12149));
            var _local_5:* = (_local_4 < _Str_18851);
            if (_local_3 == null)
            {
                if (((_arg_2 == null) && (!(_local_5))))
                {
                    return true;
                }
                _local_3 = IWindowContainer(this._questEngine.getXmlWindow("AchievementCategory"));
                _local_3.name = k.toString();
                this._categoriesContainer.addChild(_local_3);
                _local_3.findChildByName("category_region").procedure = this._Str_16433;
                _local_3.x = ((_local_3.width + _Str_18016) * (k % _Str_12149));
                _local_3.y = (((_local_3.height + _Str_16554) * Math.floor((k / _Str_12149))) + _Str_16714);
            }
            _local_3.findChildByName("category_region").id = k;
            _local_3.findChildByName("category_region").visible = (!(_arg_2 == null));
            _local_3.findChildByName("category_bg_inact").visible = (_arg_2 == null);
            _local_3.findChildByName("category_bg_act").visible = (!(_arg_2 == null));
            _local_3.findChildByName("category_bg_act_hover").visible = false;
            _local_3.findChildByName("header_txt").visible = (!(_arg_2 == null));
            _local_3.findChildByName("completion_txt").visible = (!(_arg_2 == null));
            _local_3.findChildByName("category_pic_bitmap").visible = (!(_arg_2 == null));
            _local_3.findChildByName("unseen_count_border").visible = false;
            if (_arg_2)
            {
                _local_3.findChildByName("header_txt").caption = this._questEngine._Str_21442(_arg_2.code);
                _local_3.findChildByName("completion_txt").caption = ((_arg_2._Str_9594() + "/") + _arg_2._Str_10932());
                this._questEngine._Str_21694(_local_3, _arg_2, true);
                _local_6 = this._Str_24797(_arg_2.code);
                if (_local_6 > 0)
                {
                    _local_3.findChildByName("unseen_count_border").visible = true;
                    _local_3.findChildByName("unseen_count").caption = _local_6.toString();
                }
                _local_3.visible = true;
            }
            else
            {
                _local_3.visible = _local_5;
            }
            return false;
        }

        private function _Str_19385(k:int, _arg_2:Achievement):Boolean
        {
            var _local_3:int = (k / this._Str_17014);
            var _local_4:* = (_local_3 < _Str_18502);
            if (((_arg_2 == null) && (!(_local_4))))
            {
                return true;
            }
            var _local_5:IWindowContainer = (this._questEngine.getXmlWindow("Achievement") as IWindowContainer);
            this._achievementsContainer.addChild(_local_5);
            _local_5.x = ((_local_5.width + ((this._Str_18649) ? 5 : 0)) * (k % this._Str_17014));
            Logger.log(((((((("Refreshing " + k) + " where count is ") + this._category.achievements.length) + ", row=") + _local_3) + ", column=") + (k % this._Str_17014)));
            _local_5.y = ((_local_5.height * _local_3) + _Str_18343);
            _local_5.findChildByName("bg_region").procedure = this._Str_25399;
            var _local_6:IWindow = _local_5.findChildByName("bg_region");
            _local_6.id = k;
            _local_6.visible = (!(_arg_2 == null));
            var _local_7:IWindow = _local_5.findChildByName("bg_unselected_bitmap");
            var _local_8:IWindow = _local_5.findChildByName("bg_selected_bitmap");
            this._Str_9242(_local_5, _arg_2);
            _local_7.color = (((!(_arg_2 == null)) && (_arg_2.achievementId in this._unseenAchievements)) ? _Str_18435 : 0xFFFFFF);
            if (_arg_2)
            {
                _local_7.visible = (!(_arg_2 == this._achievement));
                _local_8.visible = (_arg_2 == this._achievement);
                _local_5.visible = true;
            }
            else
            {
                if (_local_4)
                {
                    _local_8.visible = false;
                    _local_7.visible = true;
                    _local_5.visible = true;
                }
                else
                {
                    _local_5.visible = false;
                }
            }
            return false;
        }

        private function _Str_3046(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this.close();
            }
        }

        private function _Str_16433(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:int = _arg_2.id;
            Logger.log(("Category index: " + _local_3));
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._Str_17738(this._categories._Str_16947[_local_3]);
            }
            else
            {
                if (k.type == WindowMouseEvent.OUT)
                {
                    this._Str_21751(-999);
                }
                else
                {
                    if (k.type == WindowMouseEvent.OVER)
                    {
                        this._Str_21751(_local_3);
                    }
                }
            }
        }

        private function _Str_17738(k:AchievementCategory):void
        {
            this._category = k;
            this._achievement = this._category.achievements[0];
            Logger.log(("Category: " + this._category.code));
            this.refresh();
            this._questEngine.send(new EventLogMessageComposer("Achievements", this._category.code, "Category selected"));
        }

        public function _Str_23567(k:String):void
        {
            var _local_2:AchievementCategory = ((this._categories != null) ? this._categories._Str_16342(k) : null);
            if (_local_2 != null)
            {
                this._Str_17738(_local_2);
            }
            else
            {
                this._pendingCategorySelect = k;
            }
        }

        private function _Str_21751(k:int):void
        {
            var _local_3:Boolean;
            var _local_4:IWindowContainer;
            var _local_5:IWindow;
            var _local_2:int;
            while (_local_2 < this._categoriesContainer.numChildren)
            {
                _local_3 = (_local_2 == k);
                _local_4 = IWindowContainer(this._categoriesContainer.getChildAt(_local_2));
                _local_4.findChildByName("category_bg_act").visible = ((!(_local_3)) && (_local_2 < this._categories._Str_16947.length));
                _local_4.findChildByName("category_bg_act_hover").visible = _local_3;
                _local_5 = _local_4.findChildByName("hover_container");
                _local_5.x = ((_local_3) ? 0 : 1);
                _local_5.y = ((_local_3) ? 0 : 1);
                _local_2++;
            }
        }

        private function _Str_25399(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            var _local_3:int = _arg_2.id;
            this._achievement = this._category.achievements[_local_3];
            this.refresh();
            this._questEngine.send(new EventLogMessageComposer("Achievements", this._achievement.achievementId.toString(), "Achievement selected"));
        }

        private function _Str_24533(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:Array;
            var _local_4:Achievement;
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            if (this._category != null)
            {
                _local_3 = [];
                for each (_local_4 in this._unseenAchievements)
                {
                    if (_local_4.category != this._category.code)
                    {
                        _local_3.push(_local_4);
                    }
                }
                this._unseenAchievements = new Dictionary();
                for each (_local_4 in _local_3)
                {
                    this._unseenAchievements[_local_4.achievementId] = _local_4;
                }
                this._Str_18521();
            }
            this._category = null;
            this._achievement = null;
            this.refresh();
        }

        private function _Str_9242(k:IWindowContainer, _arg_2:Achievement):void
        {
            var _local_3:IWidgetWindow = (k.findChildByName("achievement_pic_bitmap") as IWidgetWindow);
            var _local_4:_Str_2402 = (_local_3.widget as _Str_2402);
            if (_arg_2 == null)
            {
                _local_3.visible = false;
                return;
            }
            IStaticBitmapWrapperWindow(IWindowContainer(_local_3._Str_2429).findChildByName("bitmap")).assetUri = "common_loading_icon";
            _local_4.badgeId = this._Str_16394(_arg_2);
            _local_4.greyscale = (!(_arg_2._Str_10438));
            _local_3.visible = true;
        }

        private function _Str_16547(k:IWindowContainer, _arg_2:Achievement):void
        {
            var _local_3:IWidgetWindow = (k.findChildByName("achievement_pic_bitmap") as IWidgetWindow);
            var _local_4:_Str_2402 = (_local_3.widget as _Str_2402);
            IStaticBitmapWrapperWindow(IWindowContainer(_local_3._Str_2429).findChildByName("bitmap")).assetUri = "common_loading_icon";
            _local_4.badgeId = this._Str_16394(_arg_2);
            _local_4.greyscale = (!(_arg_2._Str_10438));
            _local_3.visible = true;
        }

        private function _Str_19817(k:TimerEvent):void
        {
            this._badgeRefreshTimer.reset();
            this.refresh();
        }

        private function _Str_20234(k:TimerEvent):void
        {
            this._achievement = this._pendingLevel;
            this._categories.update(this._pendingLevel);
            this._pendingLevel = null;
            this.refresh();
        }

        public function onBadgeImageReady(k:BadgeImageReadyEvent):void
        {
            if (this._window == null)
            {
                return;
            }
            this._badgeImages[k.badgeId] = k.badgeImage;
            if (!this._badgeRefreshTimer.running)
            {
                this._badgeRefreshTimer.start();
            }
        }

        public function update(k:uint):void
        {
            if (this._inLevelProgressBar != null)
            {
                this._inLevelProgressBar._Str_2491();
            }
            if (this._totalProgressBar != null)
            {
                this._totalProgressBar._Str_2491();
            }
        }

        private function _Str_16394(k:Achievement):String
        {
            return (k._Str_7518) ? k.badgeId : this._questEngine.localization._Str_18179(k.badgeId);
        }

        private function _Str_26271(k:int):int
        {
            return (this._badgeYPositionFixes[k]) ? this._badgeYPositionFixes[k] : 0;
        }

        private function get _Str_17014():int
        {
            if (this._Str_18649)
            {
                return _Str_10474 - 1;
            }
            return _Str_10474;
        }

        private function get _Str_18649():Boolean
        {
            return (!(this._category == null)) && (this._category.achievements.length > (_Str_16007 * _Str_10474));
        }

        private function _Str_25504(badgeId:String):Boolean
        {
            var isSkipped:Boolean;
            var unseendSkippedBadgesIds:Array = this._questEngine.getProperty("toolbar.unseen_notification.skipped_badge_ids").split(",");
            unseendSkippedBadgesIds.forEach(function (k:*):*
            {
                if (badgeId.search(k) != -1)
                {
                    isSkipped = true;
                }
            }, null);
            return isSkipped;
        }

        public function _Str_13119(k:String, _arg_2:String):int
        {
            var _local_3:AchievementCategory;
            var _local_4:Achievement;
            if (this._categories != null)
            {
                _local_3 = this._categories._Str_16342(k);
                if (_local_3 != null)
                {
                    for each (_local_4 in _local_3.achievements)
                    {
                        if (_local_4.badgeId.indexOf(_arg_2) == 0)
                        {
                            return (_local_4._Str_7518) ? _local_4.level : Math.max(0, (_local_4.level - 1));
                        }
                    }
                }
            }
            return 0;
        }
    }
}
