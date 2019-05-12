package com.sulake.habbo.ui.widget.wordquiz
{
    import com.sulake.habbo.ui.widget.ConversionTrackingWidget;
    import flash.utils.Timer;
    import flash.utils.Dictionary;
    import __AS3__.vec.Vector;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.ui.widget.events._Str_3149;
    import flash.events.IEventDispatcher;
    import com.sulake.habbo.session.events.RoomSessionWordQuizEvent;
    import com.sulake.habbo.ui.handler.WordQuizWidgetHandler;
    import flash.geom.Rectangle;
    import flash.events.TimerEvent;
    import com.sulake.core.window.components.IBorderWindow;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.habbo.session.RoomUserData;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetPollMessage;
    import __AS3__.vec.*;

    public class WordQuizWidget extends ConversionTrackingWidget 
    {
        private static const WORDQUIZ_LIKE_XML:String = "wordquiz_like_xml";
        private static const WORDQUIZ_UNLIKE_XML:String = "wordquiz_unlike_xml";
        private static const _Str_14254:int = 750;
        private static const _Str_7039:int = 750;
        private static const _Str_7307:int = 40;
        public static const _Str_13786:String = "0";
        public static const _Str_9438:String = "1";

        private var _view:WordQuizView;
        private var _countdownUpTimer:Timer;
        private var _countdownDownTimer:Timer;
        private var _moveTimer:Timer;
        private var _textIndex:int = 0;
        private var _showResultTime:int;
        private var _countdown:int = 0;
        private var _pollId:int;
        private var _question:Dictionary;
        private var _currentQuestionId:int;
        private var _showSignCounters:Dictionary;
        private var _answerWindows:Vector.<IWindowContainer>;
        private var _yesWindowPool:Vector.<IWindowContainer>;
        private var _noWindowPool:Vector.<IWindowContainer>;
        private var _answerSent:Boolean;

        public function WordQuizWidget(k:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary, _arg_4:IHabboLocalizationManager)
        {
            this._showSignCounters = new Dictionary();
            this._answerWindows = new Vector.<IWindowContainer>(0);
            this._yesWindowPool = new Vector.<IWindowContainer>(0);
            this._noWindowPool = new Vector.<IWindowContainer>(0);
            super(this.handler, _arg_2, _arg_3, _arg_4);
            _Str_2470 = k;
            this._view = new WordQuizView(this);
            this._showResultTime = (this.handler.container.config.getInteger("poll.word.quiz.answer.bubble.seconds", 3) * 1000);
        }

        override public function get mainWindow():IWindow
        {
            return (this._view) ? this._view.mainWindow : null;
        }

        override public function registerUpdateEvents(k:IEventDispatcher):void
        {
            if (k == null)
            {
                return;
            }
            k.addEventListener(_Str_3149.RWPUW_NEW_QUESTION, this._Str_20603);
            k.addEventListener(_Str_3149.RWPUW_QUESTION_ANSWERED, this._Str_21808);
            k.addEventListener(_Str_3149.RWPUW_QUESION_FINSIHED, this._Str_21218);
            super.registerUpdateEvents(k);
        }

        override public function unregisterUpdateEvents(k:IEventDispatcher):void
        {
            if (k == null)
            {
                return;
            }
            k.removeEventListener(RoomSessionWordQuizEvent.RWPUW_NEW_QUESTION, this._Str_20603);
            k.removeEventListener(RoomSessionWordQuizEvent.RWPUW_QUESTION_ANSWERED, this._Str_21808);
            k.removeEventListener(RoomSessionWordQuizEvent.RWPUW_QUESION_FINSIHED, this._Str_21218);
            super.unregisterUpdateEvents(k);
        }

        public function get handler():WordQuizWidgetHandler
        {
            return _Str_2470 as WordQuizWidgetHandler;
        }

        override public function dispose():void
        {
            var k:IWindowContainer;
            var _local_2:int;
            if (disposed)
            {
                return;
            }
            if (this._view)
            {
                this._view.dispose();
                this._view = null;
            }
            if (this._countdownUpTimer)
            {
                this._countdownUpTimer.reset();
                this._countdownUpTimer = null;
            }
            if (this._countdownDownTimer)
            {
                this._countdownDownTimer.reset();
                this._countdownDownTimer = null;
            }
            if (this._moveTimer)
            {
                this._moveTimer.reset();
                this._moveTimer = null;
            }
            if (windowManager)
            {
                if (this._answerWindows)
                {
                    _local_2 = 0;
                    while (_local_2 < this._answerWindows.length)
                    {
                        k = (this._answerWindows[_local_2] as IWindowContainer);
                        if (k)
                        {
                            windowManager.removeWindow(k.name);
                        }
                        _local_2++;
                    }
                }
                for each (k in this._yesWindowPool)
                {
                    k.destroy();
                }
                this._yesWindowPool.length = 0;
                for each (k in this._noWindowPool)
                {
                    k.destroy();
                }
                this._noWindowPool.length = 0;
            }
            super.dispose();
        }

        private function _Str_20603(k:_Str_3149):void
        {
            this._pollId = k.id;
            this._question = k.question;
            this._answerSent = false;
            this._showSignCounters = new Dictionary();
            this._Str_23919(this._question, k.duration);
        }

        private function _Str_21218(k:_Str_3149):void
        {
            this._Str_19108();
            if ((((this._view) && (this._question)) && (this._question.id == k._Str_3218)))
            {
                this._view._Str_21186(k._Str_4036);
            }
            var _local_2:int;
            while (_local_2 < this._answerWindows.length)
            {
                this._Str_17059(this._answerWindows[_local_2].name);
                _local_2++;
            }
            this._answerWindows.length = 0;
        }

        private function _Str_17059(k:String):void
        {
            if (windowManager == null)
            {
                return;
            }
            windowManager.removeWindow(k);
        }

        private function _Str_21808(k:_Str_3149):void
        {
            var _local_7:IWindowContainer;
            if (this._view)
            {
                this._view._Str_19343(k._Str_4036);
            }
            var _local_2:int = k.userId;
            var _local_3:String = k.value;
            var _local_4:Vector.<IWindowContainer> = ((_local_3 == _Str_9438) ? this._yesWindowPool : this._noWindowPool);
            var _local_5:String = ((_local_3 == _Str_9438) ? WORDQUIZ_LIKE_XML : WORDQUIZ_UNLIKE_XML);
            var _local_6:String = ((((this._pollId + "_") + _local_2) + "_") + _local_5);
            if (_local_4.length)
            {
                _local_7 = _local_4.pop();
            }
            else
            {
                _local_7 = (windowManager.buildFromXML((assets.getAssetByName(_local_5).content as XML)) as IWindowContainer);
            }
            _local_7.name = _local_6;
            this._answerWindows.push(_local_7);
            this._showSignCounters[_local_6] = ((this._showResultTime + _Str_14254) + _Str_7039);
            var _local_8:Rectangle = this._Str_19158(_local_2);
            if (_local_8)
            {
                _local_7.x = (_local_8.left + 20);
                _local_7.y = (_local_8.top - 20);
            }
            if (!this._moveTimer)
            {
                this._moveTimer = new Timer(_Str_7307);
                this._moveTimer.addEventListener(TimerEvent.TIMER, this._Str_19365);
                this._moveTimer.start();
            }
            var _local_9:IBorderWindow = (_local_7.getChildByName("colored") as IBorderWindow);
            if (_local_9)
            {
                _local_9.blend = 0;
            }
        }

        private function _Str_19365(k:TimerEvent):void
        {
            var _local_3:IWindowContainer;
            var _local_4:Array;
            var _local_5:int;
            var _local_6:Rectangle;
            var _local_2:int;
            while (_local_2 < this._answerWindows.length)
            {
                _local_3 = this._answerWindows[_local_2];
                if (_local_3)
                {
                    _local_4 = String(this._answerWindows[_local_2].name).split("_");
                    if (_local_4.length > 1)
                    {
                        _local_5 = int(_local_4[1]);
                        _local_6 = this._Str_19158(_local_5);
                        if (_local_6)
                        {
                            _local_3.x = (_local_6.left + 29);
                            _local_3.y = (_local_6.top - 11);
                        }
                        else
                        {
                            this._Str_17059(this._answerWindows[_local_2].name);
                            return;
                        }
                        this._Str_24189(_local_3);
                    }
                }
                _local_2++;
            }
        }

        private function _Str_24189(k:IWindowContainer):void
        {
            var _local_4:Number;
            var _local_5:int;
            var _local_2:IBorderWindow = (k.getChildByName("colored") as IBorderWindow);
            var _local_3:IRegionWindow = (k.getChildByName("button_like") as IRegionWindow);
            if ((((this._showSignCounters.hasOwnProperty(k.name)) && (_local_2)) && (_local_3)))
            {
                _local_5 = this._showSignCounters[k.name];
                _local_5 = (_local_5 - _Str_7307);
                this._showSignCounters[k.name] = _local_5;
                if (_local_5 > (this._showResultTime + _Str_7039))
                {
                    _local_4 = ((_Str_14254 / _Str_7307) * 0.01);
                    _local_2.blend = (_local_2.blend + _local_4);
                    _local_3.blend = _local_2.blend;
                }
                else
                {
                    if (_local_5 > _Str_7039)
                    {
                        _local_2.blend = 1;
                        _local_3.blend = 1;
                    }
                    else
                    {
                        if (((_local_5 < _Str_7039) && (_local_5 > 0)))
                        {
                            _local_4 = (_Str_7039 / _Str_7307);
                            k.blend = (k.blend - (_local_4 * 0.01));
                            k.y = (k.y - (20 + (70 - (k.blend * 120))));
                        }
                        else
                        {
                            if (_local_5 < 0)
                            {
                                k.y = (k.y - (20 + (70 - (k.blend * 120))));
                                this._Str_17059(k.name);
                            }
                        }
                    }
                }
            }
        }

        private function _Str_19158(k:int):Rectangle
        {
            if (((((!(this.handler)) || (!(this.handler.container))) || (!(this.handler.container.roomSession))) || (!(this.handler.container.roomEngine))))
            {
                return null;
            }
            var _local_2:int = this.handler.container.roomSession.roomId;
            var _local_3:RoomUserData = this.handler.container.roomSessionManager.getSession(_local_2).userDataManager.getUserData(k);
            if (_local_3)
            {
                return this.handler.container.roomEngine.getRoomObjectBoundingRectangle(_local_2, _local_3._Str_2713, RoomObjectCategoryEnum.CONST_100, this.handler.container.getFirstCanvasId());
            }
            return null;
        }

        private function _Str_22603(k:TimerEvent):void
        {
            if (this._countdownDownTimer == null)
            {
                return;
            }
            this._countdown--;
            this._view._Str_6423(String(this._countdown));
            if (this._countdown == 0)
            {
                this._Str_19108();
                this._view.removeWindow();
            }
        }

        private function _Str_23919(k:Dictionary, _arg_2:int):void
        {
            if (!k)
            {
                return;
            }
            this._view.createWindow(WordQuizView._Str_10936, k.content);
            this._textIndex++;
            this._countdown = 4;
            this._currentQuestionId = k.id;
            if (_arg_2 > 0)
            {
                this._countdownDownTimer = new Timer(1000);
                this._countdown = (_arg_2 / 1000);
                this._countdownDownTimer.addEventListener(TimerEvent.TIMER, this._Str_22603);
                this._countdownDownTimer.start();
                this._moveTimer = new Timer(_Str_7307);
                this._moveTimer.addEventListener(TimerEvent.TIMER, this._Str_19365);
                this._moveTimer.start();
                this._view._Str_6423(String(this._countdown));
            }
        }

        private function _Str_19108():void
        {
            if (this._countdownDownTimer)
            {
                this._countdownDownTimer.reset();
                this._countdownDownTimer = null;
            }
            if (this._moveTimer)
            {
                this._moveTimer.reset();
                this._moveTimer = null;
            }
        }

        public function _Str_20809(k:int):void
        {
            this._view.removeWindow();
            if (this._answerSent)
            {
                return;
            }
            var _local_2:RoomWidgetPollMessage = new RoomWidgetPollMessage(RoomWidgetPollMessage.RWPM_ANSWER, this._pollId);
            _local_2._Str_3218 = (this._question["id"] as int);
            var _local_3:Array = [];
            _local_3.push(("" + k));
            _local_2.answers = _local_3;
            messageListener.processWidgetMessage(_local_2);
            this._answerSent = true;
            this._view.createWindow(WordQuizView._Str_14885);
        }
    }
}
