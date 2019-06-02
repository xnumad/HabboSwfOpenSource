package com.sulake.habbo.quest
{
    import com.sulake.core.runtime.IDisposable;
    import flash.geom.Point;
    import com.sulake.habbo.communication.messages.incoming.quest._Str_2455;
    import com.sulake.core.window.IWindowContainer;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.communication.messages.outgoing._Str_223._Str_7551;
    import com.sulake.habbo.communication.messages.outgoing._Str_223._Str_7568;
    import com.sulake.core.window.components.IDesktopWindow;
    import com.sulake.core.window.components.IFrameWindow;

    public class QuestTracker implements IDisposable 
    {
        private static const _Str_5976:int = 0;
        private static const _Str_26462:int = 1;
        private static const _Str_10202:int = 2;
        private static const _Str_12853:int = 3;
        private static const _Str_12878:int = 4;
        private static const _Str_14692:int = 5;
        private static const _Str_12665:int = 6;
        private static const _Str_14164:Array = [-2, -3, -2, 0, 2, 3, 2, 0, 2, 1, 0, 1];
        private static const _Str_13085:Array = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 4];
        private static const _Str_16918:int = 6;
        private static const _Str_16162:int = 4;
        private static const _Str_11367:int = 2;
        private static const _Str_14887:int = 200;
        private static const _Str_6593:Array = ["a", "b", "c", "d"];
        private static const _Str_15461:int = 10000;
        private static const _Str_17632:int = 0;
        private static const _Str_11814:int = -1;
        private static const _Str_16086:Point = new Point(10, 87);
        private static const _Str_17513:int = 162;
        private static const _Str_18252:Number = 0.01;
        private static const _Str_16329:Number = 100;
        private static const _Str_16069:int = 1000;
        private static const QUEST_TRACKER:String = "quest_tracker";
        private static const _Str_16708:int = 10;

        private var _questEngine:HabboQuestEngine;
        private var _questInTracker:_Str_2455;
        private var _window:IWindowContainer;
        private var _startQuestTimer:Timer;
        private var _progressBar:ProgressBar;
        private var _trackerAnimationStatus:int = 0;
        private var _nudgeIndex:int = 0;
        private var _remainingWait:int = 0;
        private var _successFrame:int = -1;
        private var _msecsUntilPrompt:int = -1;
        private var _promptFrame:int = -1;
        private var _msecsUntilNextPromptFrame:int;
        private var _remainingPromptSequenceRepeats:int;
        private var _promptWithNudge:Boolean;
        private var _getNextQuestWhenCompletionAnimationFinishes:Boolean;
        private var _forcedCloseRequested:Boolean = false;

        public function QuestTracker(k:HabboQuestEngine)
        {
            this._questEngine = k;
        }

        public function dispose():void
        {
            if (this._questEngine)
            {
                this._questEngine.toolbar.extensionView.detachExtension(QUEST_TRACKER);
            }
            this._questEngine = null;
            this._questInTracker = null;
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
            if (this._startQuestTimer)
            {
                this._startQuestTimer.stop();
                this._startQuestTimer = null;
            }
            if (this._progressBar)
            {
                this._progressBar.dispose();
                this._progressBar = null;
            }
        }

        public function get disposed():Boolean
        {
            return this._questEngine == null;
        }

        public function _Str_5657(k:_Str_2455, _arg_2:Boolean):void
        {
            if (this._window)
            {
                this._Str_19847();
                this._questInTracker = k;
                this._nudgeIndex = 0;
                this._Str_19788();
                this._successFrame = 0;
                this._trackerAnimationStatus = _Str_12853;
                this._getNextQuestWhenCompletionAnimationFinishes = (!(_arg_2));
            }
        }

        public function _Str_5242():void
        {
            this._questInTracker = null;
            if (this._window)
            {
                this._Str_19847();
                this._progressBar.refresh(0, 100, -1, 0);
                this._trackerAnimationStatus = _Str_10202;
            }
        }

        public function onCreditBalance():void
        {
            var _local_3:int;
            var k:* = (this._questEngine.getInteger("new.identity", 0) > 0);
            if (!k)
            {
                return;
            }
            var _local_2:String = this._Str_20331();
            if ((((this._startQuestTimer == null) && (k)) && (!(_local_2 == ""))))
            {
                _local_3 = this._questEngine.getInteger("questing.startQuestDelayInSeconds", 30);
                this._startQuestTimer = new Timer((_local_3 * 1000), 1);
                this._startQuestTimer.addEventListener(TimerEvent.TIMER, this._Str_23378);
                this._startQuestTimer.start();
                Logger.log(("Initialized start quest timer with period: " + _local_3));
            }
        }

        public function _Str_2960():void
        {
            if (((!(this._window == null)) && (this._window.visible)))
            {
                this._window.findChildByName("more_info_txt").visible = false;
                this._window.findChildByName("more_info_region").visible = false;
            }
        }

        public function _Str_4750(k:_Str_2455):void
        {
            if (this._startQuestTimer != null)
            {
                this._startQuestTimer.stop();
            }
            var _local_2:Boolean = ((this._window) && (this._window.visible));
            if (k._Str_3935 > 0)
            {
                if (_local_2)
                {
                    this._Str_11225(false);
                }
                return;
            }
            this._questInTracker = k;
            this._Str_25660();
            this._Str_19788();
            this._Str_23346();
            this._Str_11225(true);
            this._Str_18279();
            if (_local_2)
            {
                if (this._trackerAnimationStatus == _Str_10202)
                {
                    this._trackerAnimationStatus = _Str_26462;
                }
                this._Str_11768(this._msecsUntilPrompt, _Str_16162, false);
            }
            else
            {
                this._window.x = this._Str_20107();
                this._trackerAnimationStatus = _Str_26462;
                this._Str_11768(_Str_17632, _Str_11367, false);
            }
        }

        private function _Str_23346():void
        {
            if (!this._questEngine._Str_17760(this._questInTracker))
            {
                return;
            }
            var k:int;
            while (k < _Str_6593.length)
            {
                this._questEngine._Str_22546(this._window, this._questInTracker, _Str_6593[k]);
                k++;
            }
        }

        private function _Str_25660():void
        {
            if (this._window != null)
            {
                return;
            }
            this._window = IWindowContainer(this._questEngine.getXmlWindow("QuestTracker"));
            this._window.findChildByName("more_info_region").procedure = this._Str_16870;
            this._Str_18279();
            this._progressBar = new ProgressBar(this._questEngine, IWindowContainer(this._window.findChildByName("content_cont")), _Str_17513, "quests.tracker.progress", false, _Str_16086);
        }

        private function _Str_18279():void
        {
            var k:int = 1;
            while (k <= _Str_16918)
            {
                this._Str_21947(k).visible = false;
                k++;
            }
        }

        private function _Str_22074():void
        {
            var k:int;
            while (k < _Str_6593.length)
            {
                this._Str_21535(_Str_6593[k]).visible = false;
                k++;
            }
        }

        private function _Str_21947(k:int):IWindow
        {
            return this._window.findChildByName(("success_pic_" + k));
        }

        private function _Str_21535(k:String):IWindow
        {
            return this._window.findChildByName(("prompt_pic_" + k));
        }

        private function _Str_19788():void
        {
            this._questEngine.localization.registerParameter("quests.tracker.caption", "quest_name", this._questEngine._Str_10470(this._questInTracker));
            this._window.findChildByName("desc_txt").caption = this._questEngine._Str_20120(this._questInTracker);
            this._window.findChildByName("more_info_txt").visible = this._questEngine._Str_6927;
            this._window.findChildByName("more_info_region").visible = this._questEngine._Str_6927;
            var k:int = Math.ceil(((100 * this._questInTracker._Str_22915) / this._questInTracker._Str_22975));
            this._progressBar.refresh(k, 100, this._questInTracker.id, 0);
            this._questEngine._Str_19955(this._window, this._questInTracker);
        }

        private function _Str_16870(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._questEngine._Str_3398._Str_11417._Str_5386(this._questInTracker);
            }
        }

        public function _Str_24904():void
        {
            if (this._trackerAnimationStatus == _Str_5976)
            {
                this._Str_11225(false);
                this._forcedCloseRequested = false;
            }
            else
            {
                this._forcedCloseRequested = true;
            }
        }

        public function update(k:uint):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:int;
            if (this._window == null)
            {
                return;
            }
            this._progressBar._Str_2491();
            switch (this._trackerAnimationStatus)
            {
                case _Str_26462:
                    _local_2 = this._Str_14043();
                    _local_3 = (this._window.x - _local_2);
                    if (_local_3 > 0)
                    {
                        _local_4 = Math.max(1, Math.round(((_local_3 * k) * _Str_18252)));
                        this._window.x = (this._window.x - _local_4);
                    }
                    else
                    {
                        this._trackerAnimationStatus = _Str_5976;
                        this._window.x = _local_2;
                    }
                    return;
                case _Str_10202:
                    _local_2 = this._Str_20107();
                    _local_3 = (this._window.width - this._window.x);
                    if (_local_3 > 0)
                    {
                        _local_4 = Math.max(1, Math.round(((k * _Str_16329) / _local_3)));
                        this._window.x = (this._window.x + _local_4);
                    }
                    else
                    {
                        this._trackerAnimationStatus = _Str_5976;
                        this._window.x = _local_2;
                        this._Str_11225(false);
                    }
                    return;
                case _Str_12853:
                    this._Str_18279();
                    this._Str_21947(_Str_13085[this._successFrame]).visible = true;
                    this._successFrame++;
                    if (this._successFrame >= _Str_13085.length)
                    {
                        this._trackerAnimationStatus = _Str_14692;
                        this._remainingWait = _Str_16069;
                    }
                    return;
                case _Str_12665:
                    this._Str_17891(false);
                    this._Str_22074();
                    this._msecsUntilNextPromptFrame = (this._msecsUntilNextPromptFrame - k);
                    this._Str_21535(_Str_6593[this._promptFrame]).visible = true;
                    if (this._msecsUntilNextPromptFrame < 0)
                    {
                        this._msecsUntilNextPromptFrame = _Str_14887;
                        this._promptFrame++;
                        if (this._promptFrame >= _Str_6593.length)
                        {
                            this._promptFrame = 0;
                            this._remainingPromptSequenceRepeats--;
                            if (this._remainingPromptSequenceRepeats < 1)
                            {
                                this._Str_11768(_Str_15461, _Str_11367, true);
                                this._trackerAnimationStatus = _Str_5976;
                            }
                        }
                    }
                    return;
                case _Str_12878:
                    if (this._nudgeIndex >= (_Str_14164.length - 1))
                    {
                        this._window.x = this._Str_14043();
                        this._trackerAnimationStatus = _Str_5976;
                        this._Str_11768(_Str_15461, _Str_11367, false);
                    }
                    else
                    {
                        this._window.x = (this._Str_14043() + _Str_14164[this._nudgeIndex]);
                        this._nudgeIndex++;
                    }
                    return;
                case _Str_14692:
                    this._remainingWait = (this._remainingWait - k);
                    if (this._remainingWait < 0)
                    {
                        this._trackerAnimationStatus = _Str_5976;
                        if (((this._getNextQuestWhenCompletionAnimationFinishes) && (!(this._forcedCloseRequested))))
                        {
                            this._questEngine.send(new _Str_7551());
                        }
                        else
                        {
                            this._Str_11225(false);
                            this._forcedCloseRequested = false;
                        }
                    }
                    return;
                case _Str_5976:
                    if (this._msecsUntilPrompt != _Str_11814)
                    {
                        this._msecsUntilPrompt = (this._msecsUntilPrompt - k);
                        if (this._msecsUntilPrompt < 0)
                        {
                            this._msecsUntilPrompt = _Str_11814;
                            if (((!(this._questInTracker == null)) && (this._questEngine._Str_17760(this._questInTracker))))
                            {
                                if (this._promptWithNudge)
                                {
                                    this._Str_25843();
                                }
                                else
                                {
                                    this._trackerAnimationStatus = _Str_12665;
                                    this._promptFrame = 0;
                                    this._msecsUntilNextPromptFrame = _Str_14887;
                                }
                            }
                        }
                    }
                    return;
            }
        }

        private function _Str_14043():int
        {
            return 0;
        }

        private function _Str_20107():int
        {
            return this._window.width + _Str_16708;
        }

        public function isVisible():Boolean
        {
            return (this._window) && (this._window.visible);
        }

        private function _Str_23378(k:TimerEvent):void
        {
            if (this._Str_25445())
            {
                Logger.log("Quest start blocked. Waiting some more");
                this._startQuestTimer.reset();
                this._startQuestTimer.start();
            }
            else
            {
                this._questEngine._Str_3398._Str_11417._Str_19749 = this._questEngine.getBoolean("questing.showDetailsForNextQuest");
                this._questEngine.send(new _Str_7568(this._Str_20331()));
            }
        }

        private function _Str_20331():String
        {
            var k:String = this._questEngine.getProperty("questing.defaultCampaign");
            return (k == null) ? "" : k;
        }

        private function _Str_25445():Boolean
        {
            var _local_2:IDesktopWindow;
            var k:int;
            while (k <= 2)
            {
                _local_2 = this._questEngine.windowManager.getDesktop(k);
                if (((!(_local_2 == null)) && (this._Str_24799(_local_2))))
                {
                    return true;
                }
                k++;
            }
            return false;
        }

        private function _Str_24799(k:IWindowContainer):Boolean
        {
            var _local_2:int;
            var _local_3:IWindow;
            while (_local_2 < k.numChildren)
            {
                _local_3 = k.getChildAt(_local_2);
                if (((!(_local_3 == null)) && (_local_3.visible)))
                {
                    if ((_local_3 as IFrameWindow) != null)
                    {
                        if (((!(_local_3.name == "mod_start_panel")) && (!(_local_3.name == "_frame"))))
                        {
                            return true;
                        }
                    }
                    else
                    {
                        if (_local_3.name == "welcome_screen")
                        {
                            return true;
                        }
                    }
                }
                _local_2++;
            }
            return false;
        }

        private function _Str_17891(k:Boolean):void
        {
            this._window.findChildByName("quest_pic_bitmap").visible = k;
        }

        private function _Str_19847():void
        {
            this._Str_11768(_Str_11814, 0, false);
        }

        private function _Str_11768(k:int, _arg_2:int, _arg_3:Boolean):void
        {
            this._Str_17891(true);
            this._Str_22074();
            this._msecsUntilPrompt = k;
            this._remainingPromptSequenceRepeats = _arg_2;
            this._promptWithNudge = _arg_3;
        }

        private function _Str_25843():void
        {
            this._nudgeIndex = 0;
            this._trackerAnimationStatus = _Str_12878;
        }

        private function _Str_11225(k:Boolean):void
        {
            this._window.visible = k;
            if (!k)
            {
                this._questEngine.toolbar.extensionView.detachExtension(QUEST_TRACKER);
            }
            else
            {
                this._questEngine.toolbar.extensionView.attachExtension(QUEST_TRACKER, this._window);
            }
        }
    }
}
