package com.sulake.habbo.ui.widget.infobuspolls 
{
	import com.sulake.core.window.IWindowContainer;
	import com.sulake.core.assets.IAssetLibrary;
	import com.sulake.core.assets.XmlAsset;
	import com.sulake.core.runtime.IHabboConfigurationManager;
	import com.sulake.core.window.components.IBitmapWrapperWindow;
	import com.sulake.core.window.components.IBorderWindow;
	import com.sulake.core.window.components.IButtonWindow;
	import com.sulake.core.window.components.IDesktopWindow;
	import com.sulake.core.window.components.IFrameWindow;
	import com.sulake.core.window.components.IItemListWindow;
	import com.sulake.core.window.components.ITextWindow;
	import com.sulake.core.window.events.WindowEvent;
	import com.sulake.core.window.events.WindowMouseEvent;
	import com.sulake.habbo.localization.IHabboLocalizationManager;
	import com.sulake.habbo.ui.widget.ConversionTrackingWidget;
	import com.sulake.habbo.window.IHabboWindowManager;
	import flash.display.BitmapData;
	import flash.events.IEventDispatcher;
	import flash.geom.Rectangle;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import com.sulake.habbo.ui.widget.events.RoomWidgetPollUpdateEvent;
	import com.sulake.habbo.ui.IRoomWidgetHandler;
	import com.sulake.core.window.IWindow;
	import flash.geom.Point;
    import flash.utils.getTimer;
	public class VotePollWidget extends ConversionTrackingWidget 
    {
        private var _window:IFrameWindow;
        private var _SafeStr_4823:IItemListWindow;
        private var _SafeStr_8112:int = -1;
        private var _timeLimit:int = 30000;
        private var _SafeStr_6010:int;
        private var _timer:Timer;

        public function VotePollWidget(_arg_1:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary, _arg_4:IHabboLocalizationManager)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4);
        }

        override public function dispose():void
        {
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
            }
            if (this._timer)
            {
                this._timer.reset();
                this._timer.removeEventListener(TimerEvent.TIMER, this.onTimerEvent);
                this._timer = null;
            }
            super.dispose();
        }

        override public function registerUpdateEvents(eventDispatcher:IEventDispatcher):void
        {
            if (eventDispatcher == null)
            {
                return;
            }
            eventDispatcher.addEventListener(RoomWidgetPollUpdateEvent.VOTE_QUESTION, this.voteQuestionHandler);
            eventDispatcher.addEventListener(RoomWidgetPollUpdateEvent.VOTE_RESULT, this.voteResultHandler);
            super.registerUpdateEvents(eventDispatcher);
        }

        override public function unregisterUpdateEvents(eventDispatcher:IEventDispatcher):void
        {
            if (eventDispatcher == null)
            {
                return;
            }
            eventDispatcher.removeEventListener(RoomWidgetPollUpdateEvent.VOTE_QUESTION, this.voteQuestionHandler);
            eventDispatcher.removeEventListener(RoomWidgetPollUpdateEvent.VOTE_RESULT, this.voteResultHandler);
        }

        private function voteQuestionHandler(updateEvent:RoomWidgetPollUpdateEvent):void
        {
            var _local_6:IWindow;
            var _local_12:Point;
            if (updateEvent == null)
            {
                return;
            }
            if (!this.createWindow())
            {
                return;
            }
            var question:ITextWindow = (this._window.findChildByName("question") as ITextWindow);
            if (question == null)
            {
                return;
            }
            var list_container:IWindowContainer = (this._window.findChildByName("list_container") as IWindowContainer);
            if (list_container == null)
            {
                return;
            }
            question.text = updateEvent.question;
            var _local_4:int = Math.max(((question.textHeight + 10) - question.height), 0);
            question.scale(0, _local_4);
            list_container.offset(0, _local_4);
            var choices:Array = updateEvent.choices;
            var _local_7:int;
            while (_local_7 < choices.length)
            {
                _local_6 = this._SafeStr_13955(_local_7, choices[_local_7]);
                if (_local_6 == null)
                {
                    return;
                }
                this._SafeStr_4823.addListItem(_local_6);
                _local_7++;
            }
            var _local_8:int = Math.max((this._SafeStr_4823.visibleRegion.height - this._SafeStr_4823.height), 0);
            list_container.scale(0, _local_8);
            this._window.scale(0, (_local_4 + _local_8));
            var waiting_text:IWindow = this._window.findChildByName("waiting_text");
            if (waiting_text != null)
            {
                waiting_text.visible = false;
            }
            var _local_10:IDesktopWindow = this._window.desktop;
            if (_local_10 != null)
            {
                _local_12 = new Point((_local_10.width - this._window.width), (_local_10.height - this._window.height));
                _local_12.offset(-10, -10);
                this._window.setGlobalPosition(_local_12);
            }
            this._window.visible = true;
            this._SafeStr_8112 = -1;
            if (this._timer == null)
            {
                this._timer = new Timer(1000);
                this._timer.addEventListener(TimerEvent.TIMER, this.onTimerEvent);
            }
            this._SafeStr_6010 = getTimer();
            this._timer.reset();
            this._timer.start();
            var timer:IWindow = this._window.findChildByName("timer");
            if (timer != null)
            {
                timer.visible = true;
            }
        }

        private function createWindow():Boolean
        {
            if (this._window != null)
            {
                this._window.dispose();
            }
            var _local_1:XmlAsset = (assets.getAssetByName("vote_question") as XmlAsset);
            this._window = (windowManager.buildFromXML((_local_1.content as XML)) as IFrameWindow);
            if (this._window == null)
            {
                return false;
            }
            this._SafeStr_4823 = (this._window.findChildByName("choices") as IItemListWindow);
            if (this._SafeStr_4823 == null)
            {
                return false;
            }
            this._window.visible = false;
            var _local_2:IWindow = this._window.findChildByTag("close");
            if (_local_2 != null)
            {
                _local_2.addEventListener(WindowMouseEvent.CLICK, this.close);
            }
            var _local_3:IWindow = this._window.findChildByName("timer");
            if (_local_3 != null)
            {
                _local_3.visible = false;
            }
            return true;
        }

        private function _SafeStr_13955(_arg_1:int, _arg_2:String):IWindow
        {
            var _local_3:XmlAsset = (assets.getAssetByName("vote_choice") as XmlAsset);
            if (_local_3 == null)
            {
                return null;
            }
            var _local_4:IWindowContainer = (windowManager.buildFromXML((_local_3.content as XML)) as IWindowContainer);
            if (_local_4 == null)
            {
                return null;
            }
            var _local_5:ITextWindow = (_local_4.findChildByName("text") as ITextWindow);
            if (_local_5 == null)
            {
                return null;
            }
            var _local_6:IButtonWindow = (_local_4.findChildByName("button") as IButtonWindow);
            if (_local_6 == null)
            {
                return null;
            }
            _local_6.id = _arg_1;
            _local_6.caption = String.fromCharCode((97 + _arg_1));
            _local_6.addEventListener(WindowMouseEvent.CLICK, this._SafeStr_13956);
            _local_5.text = _arg_2;
            var _local_7:IWindowContainer = (_local_4.findChildByName("bg") as IWindowContainer);
            if (_local_7 != null)
            {
                _local_7.visible = false;
            }
            return _local_4;
        }

        private function _SafeStr_13956(_arg_1:WindowMouseEvent):void
        {
            if (((_arg_1 == null) || (_arg_1.window == null)))
            {
                return;
            }
            this._SafeStr_5326(_arg_1.window.id);
        }

        private function _SafeStr_5326(_arg_1:int=-1):void
        {
            var _local_2:IBorderWindow;
            var _local_3:IButtonWindow;
            this._SafeStr_8112 = _arg_1;
            if (_arg_1 >= 0)
            {
                if (messageListener == null)
                {
                    return;
                }
                messageListener.processWidgetMessage(new RoomWidgetVoteMessage((_arg_1 + 1)));
            }
            if (((this._window == null) || (this._SafeStr_4823 == null)))
            {
                return;
            }
            var _local_4:int;
            while (_local_4 < this._SafeStr_4823.numListItems)
            {
                _local_2 = (this._SafeStr_4823.getListItemAt(_local_4) as IBorderWindow);
                if (_local_2 == null)
                {
                    return;
                }
                if (_local_4 != this._SafeStr_8112)
                {
                    _local_2.blend = 0.5;
                }
                _local_3 = (_local_2.findChildByName("button") as IButtonWindow);
                if (_local_3 == null)
                {
                    return;
                }
                _local_3.disable();
                _local_4++;
            }
            var _local_5:IWindow = this._window.findChildByName("timer");
            if (_local_5 != null)
            {
                _local_5.visible = false;
            }
            var _local_6:IWindow = this._window.findChildByName("waiting_text");
            if (_local_6 != null)
            {
                _local_6.visible = true;
            }
            this._timer.reset();
        }

        private function close(_arg_1:WindowEvent=null):void
        {
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
            }
        }

        private function _SafeStr_13957():void
        {
            var _local_4:Number;
            var _local_5:BitmapData;
            var _local_6:int;
            if (this._window == null)
            {
                return;
            }
            var _local_1:int = (getTimer() - this._SafeStr_6010);
            var _local_2:IBitmapWrapperWindow = (this._window.findChildByName("timer_bar") as IBitmapWrapperWindow);
            if (_local_2 != null)
            {
                _local_4 = (Number(_local_1) / this._timeLimit);
                _local_5 = new BitmapData(_local_2.width, _local_2.height, true, 0xFF339900);
                if (_local_4 > 0)
                {
                    _local_5.fillRect(new Rectangle(0, 0, _local_5.width, int((_local_5.height * _local_4))), 4292006610);
                }
                _local_2.bitmap = _local_5;
            }
            var _local_3:ITextWindow = (this._window.findChildByName("timer_text") as ITextWindow);
            if (_local_3 != null)
            {
                _local_6 = Math.max(((this._timeLimit - _local_1) / 1000), 0);
                _local_3.text = (_local_6 + " s");
            }
        }

        private function onTimerEvent(_arg_1:TimerEvent):void
        {
            var _local_2:int = (getTimer() - this._SafeStr_6010);
            if (_local_2 > this._timeLimit)
            {
                this._SafeStr_5326();
                return;
            }
            this._SafeStr_13957();
        }

        private function voteResultHandler(_arg_1:RoomWidgetPollUpdateEvent):void
        {
            var _local_2:IWindow;
            var _local_4:IWindowContainer;
            var _local_5:IBitmapWrapperWindow;
            var _local_6:IWindowContainer;
            var _local_7:ITextWindow;
            var _local_8:IButtonWindow;
            var _local_9:BitmapData;
            var _local_10:int;
            if (((this._window == null) || (this._SafeStr_4823 == null)))
            {
                return;
            }
            _local_2 = this._window.findChildByName("timer");
            if (_local_2 != null)
            {
                _local_2.visible = false;
            }
            _local_2 = this._window.findChildByName("waiting_text");
            if (_local_2 != null)
            {
                _local_2.visible = false;
            }
            if (this._SafeStr_4823.numListItems != _arg_1._SafeStr_4173.length)
            {
                return;
            }
            var _local_3:int;
            while (_local_3 < this._SafeStr_4823.numListItems)
            {
                _local_4 = (this._SafeStr_4823.getListItemAt(_local_3) as IWindowContainer);
                if (_local_4 != null)
                {
                    _local_5 = (_local_4.findChildByName("vote_bar") as IBitmapWrapperWindow);
                    if (_local_5 != null)
                    {
                        _local_9 = new BitmapData(_local_5.width, _local_5.height, true, 0);
                        _local_10 = int(((Number(_arg_1._SafeStr_4173[_local_3]) / _arg_1._SafeStr_4174) * _local_9.width));
                        if (_local_10 > 0)
                        {
                            _local_9.fillRect(new Rectangle(0, 0, _local_10, _local_9.height), 0xFF339900);
                            _local_5.bitmap = _local_9;
                        }
                    }
                    _local_6 = (_local_4.findChildByName("bg") as IWindowContainer);
                    if (_local_6 != null)
                    {
                        _local_6.visible = true;
                    }
                    _local_7 = (_local_4.findChildByName("text") as ITextWindow);
                    if (_local_7 != null)
                    {
                        _local_7.text = (((((_local_7.text + " ( ") + _arg_1._SafeStr_4173[_local_3]) + "/") + _arg_1._SafeStr_4174) + " )");
                    }
                    _local_8 = (_local_4.findChildByName("button") as IButtonWindow);
                    if (_local_8 != null)
                    {
                        _local_8.disable();
                    }
                }
                _local_3++;
            }
        }


    }

}
