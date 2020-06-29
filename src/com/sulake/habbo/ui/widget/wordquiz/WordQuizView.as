package com.sulake.habbo.ui.widget.wordquiz
{
    import com.sulake.core.window.IWindowContainer;
    import flash.utils.Timer;
    import com.sulake.core.window.enum.WindowType;
    import com.sulake.habbo.window.enum.HabboWindowStyle;
    import com.sulake.core.window.enum.WindowParam;
    import flash.geom.Rectangle;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.ILabelWindow;
    import com.sulake.core.utils.Map;
    import flash.events.TimerEvent;

    public class WordQuizView 
    {
        public static const STATE_QUESTION:int = 0;
        public static const STATE_RESULT:int = 1;
        private static const CONTAINER_IN_BOTTOM:Boolean = false;
        private static var _displayResultDuration:int;

        private var _widget:WordQuizWidget;
        private var _mainWindow:IWindowContainer;
        private var _waitTimer:Timer;
        private var _quizTopic:String;

        public function WordQuizView(k:WordQuizWidget)
        {
            this._widget = k;
            _displayResultDuration = (this._widget.handler.container.config.getInteger("poll.word.quiz.result.view.seconds", 4) * 1000);
            if (CONTAINER_IN_BOTTOM)
            {
                this._mainWindow = (this._widget.windowManager.createWindow("wordquiz_container", "", WindowType.WINDOW_TYPE_CONTAINER, HabboWindowStyle.DEFAULT, (WindowParam.WINDOW_PARAM_RESIZE_TO_ACCOMMODATE_CHILDREN | WindowParam.WINDOW_PARAM_EXPAND_TO_ACCOMMODATE_CHILDREN), new Rectangle(0, 0, 2, 2), null, 0, 2) as IWindowContainer);
                this._mainWindow.width = this._mainWindow.desktop.width;
                this._mainWindow.height = this._mainWindow.desktop.height;
            }
        }

        public function dispose():void
        {
            this._widget = null;
            this.removeWindow();
            if (this._mainWindow)
            {
                if (this._mainWindow.desktop)
                {
                    this._mainWindow.desktop.removeEventListener(WindowEvent.WINDOW_EVENT_RESIZED, this.onDesktopResized);
                }
                this._mainWindow.dispose();
                this._mainWindow = null;
            }
        }

        private function getCorrectTextWidth(k:int, _arg_2:String=null):int
        {
            var _local_3:String;
            var _local_4:IWindowContainer;
            if (k == STATE_QUESTION)
            {
                _local_3 = "wordquiz_question_xml";
            }
            else
            {
                _local_3 = "wordquiz_result_xml";
            }
            _local_4 = (this._widget.windowManager.buildFromXML((this._widget.assets.getAssetByName(_local_3).content as XML)) as IWindowContainer);
            if (_local_4 == null)
            {
                throw (new Error("Failed to construct window from XML!"));
            }
            _local_4.findChildByName("quiz_topic").caption = _arg_2;
            _local_4.findChildByName("quiz_topic").width = 660;
            var _local_5:* = ITextWindow(_local_4.findChildByName("quiz_topic")).textWidth;
            _local_4.dispose();
            return _local_5;
        }

        public function createWindow(k:int, _arg_2:String=null):void
        {
            var _local_3:String;
            this.removeWindow();
            if (k == STATE_QUESTION)
            {
                _local_3 = "wordquiz_question_xml";
            }
            else
            {
                _local_3 = "wordquiz_result_xml";
            }
            if (CONTAINER_IN_BOTTOM)
            {
                this._mainWindow.buildFromXML((this._widget.assets.getAssetByName(_local_3).content as XML));
            }
            else
            {
                this._mainWindow = (this._widget.windowManager.buildFromXML((this._widget.assets.getAssetByName(_local_3).content as XML)) as IWindowContainer);
            }
            if (this._mainWindow == null)
            {
                throw (new Error("Failed to construct window from XML!"));
            }
            var _local_4:IWindow = this._mainWindow.findChildByName("button_like");
            if (_local_4)
            {
                _local_4.addEventListener(WindowMouseEvent.CLICK, this.onLike);
            }
            _local_4 = this._mainWindow.findChildByName("button_dislike");
            if (_local_4)
            {
                _local_4.addEventListener(WindowMouseEvent.CLICK, this.onDislike);
            }
            if (_arg_2 != null)
            {
                this._quizTopic = _arg_2;
            }
            this._mainWindow.findChildByName("quiz_topic").caption = this._quizTopic;
            this._mainWindow.findChildByName("quiz_topic").width = Math.min(660, (this.getCorrectTextWidth(k, this._quizTopic) + 6));
            this._mainWindow.findChildByName("quiz_topic").y = 3;
            this.positionWindow();
            this._mainWindow.desktop.addEventListener(WindowEvent.WINDOW_EVENT_RESIZED, this.onDesktopResized);
        }

        public function removeWindow():void
        {
            if (((!(this._mainWindow)) || (this._mainWindow.numChildren == 0)))
            {
                return;
            }
            if (CONTAINER_IN_BOTTOM)
            {
                this._mainWindow.removeChildAt(0).dispose();
            }
            else
            {
                this._mainWindow.desktop.addEventListener(WindowEvent.WINDOW_EVENT_RESIZED, this.onDesktopResized);
                this._mainWindow.dispose();
                this._mainWindow = null;
            }
            if (this._waitTimer)
            {
                this._waitTimer.reset();
                this._waitTimer = null;
            }
        }

        public function get mainWindow():IWindow
        {
            return this._mainWindow;
        }

        public function updateCounter(k:String):void
        {
            if (((!(this._mainWindow)) || (!(this._mainWindow.findChildByName("countdown")))))
            {
                return;
            }
            if (k == "0")
            {
                k = "";
            }
            this._mainWindow.findChildByName("countdown").caption = k;
        }

        public function updateResults(k:Map):void
        {
            if (((!(this._mainWindow)) || (!(k))))
            {
                return;
            }
            var _local_2:int = ((k[WordQuizWidget.VALUE_KEY_DISLIKE] != null) ? k.getValue(WordQuizWidget.VALUE_KEY_DISLIKE) : 0);
            var _local_3:ILabelWindow = (this._mainWindow.findChildByName("lbl_dislike_count") as ILabelWindow);
            if (_local_3)
            {
                _local_3.text = _local_2.toString();
            }
            _local_2 = ((k[WordQuizWidget.VALUE_KEY_LIKE] != null) ? k.getValue(WordQuizWidget.VALUE_KEY_LIKE) : 0);
            _local_3 = (this._mainWindow.findChildByName("lbl_like_count") as ILabelWindow);
            if (_local_3)
            {
                _local_3.text = _local_2.toString();
            }
        }

        public function displayResults(k:Map):void
        {
            this.createWindow(WordQuizView.STATE_RESULT);
            this.updateResults(k);
            this._waitTimer = new Timer(_displayResultDuration);
            this._waitTimer.addEventListener(TimerEvent.TIMER, this.onWaitTimer);
            this._waitTimer.start();
        }

        private function onWaitTimer(k:TimerEvent):void
        {
            this.removeWindow();
        }

        private function onLike(k:WindowMouseEvent):void
        {
            this._widget.sendAnswer(1);
        }

        private function onDislike(k:WindowMouseEvent):void
        {
            this._widget.sendAnswer(0);
        }

        private function onDesktopResized(k:WindowEvent):void
        {
            this.positionWindow();
        }

        private function positionWindow():void
        {
            if (((!(this._mainWindow)) || (this._mainWindow.numChildren == 0)))
            {
                return;
            }
            var k:IWindow = this._mainWindow.getChildAt(0);
            this._mainWindow.x = ((this._mainWindow.desktop.width / 2) - (k.width / 2));
            this._mainWindow.y = 6;
        }
    }
}
