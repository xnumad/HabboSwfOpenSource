package com.sulake.habbo.ui.widget.wordquiz
{
    import com.sulake.core.window.IWindowContainer;
    import flash.utils.Timer;
    import com.sulake.core.window.enum.WindowType;
    import com.sulake.habbo.window.enum._Str_3108;
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
        public static const _Str_10936:int = 0;
        public static const _Str_14885:int = 1;
        private static const _Str_12004:Boolean = false;
        private static var _Str_18458:int;

        private var _Str_2268:WordQuizWidget;
        private var _mainWindow:IWindowContainer;
        private var _Str_3891:Timer;
        private var _Str_17234:String;

        public function WordQuizView(k:WordQuizWidget)
        {
            this._Str_2268 = k;
            _Str_18458 = (this._Str_2268.handler.container.config.getInteger("poll.word.quiz.result.view.seconds", 4) * 1000);
            if (_Str_12004)
            {
                this._mainWindow = (this._Str_2268.windowManager.createWindow("wordquiz_container", "", WindowType.WINDOW_TYPE_CONTAINER, _Str_3108.DEFAULT, (WindowParam.WINDOW_PARAM_RESIZE_TO_ACCOMMODATE_CHILDREN | WindowParam.WINDOW_PARAM_EXPAND_TO_ACCOMMODATE_CHILDREN), new Rectangle(0, 0, 2, 2), null, 0, 2) as IWindowContainer);
                this._mainWindow.width = this._mainWindow.desktop.width;
                this._mainWindow.height = this._mainWindow.desktop.height;
            }
        }

        public function dispose():void
        {
            this._Str_2268 = null;
            this.removeWindow();
            if (this._mainWindow)
            {
                if (this._mainWindow.desktop)
                {
                    this._mainWindow.desktop.removeEventListener(WindowEvent.WINDOW_EVENT_RESIZED, this._Str_3630);
                }
                this._mainWindow.dispose();
                this._mainWindow = null;
            }
        }

        private function _Str_23335(k:int, _arg_2:String=null):int
        {
            var _local_3:String;
            var _local_4:IWindowContainer;
            if (k == _Str_10936)
            {
                _local_3 = "wordquiz_question_xml";
            }
            else
            {
                _local_3 = "wordquiz_result_xml";
            }
            _local_4 = (this._Str_2268.windowManager.buildFromXML((this._Str_2268.assets.getAssetByName(_local_3).content as XML)) as IWindowContainer);
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
            if (k == _Str_10936)
            {
                _local_3 = "wordquiz_question_xml";
            }
            else
            {
                _local_3 = "wordquiz_result_xml";
            }
            if (_Str_12004)
            {
                this._mainWindow.buildFromXML((this._Str_2268.assets.getAssetByName(_local_3).content as XML));
            }
            else
            {
                this._mainWindow = (this._Str_2268.windowManager.buildFromXML((this._Str_2268.assets.getAssetByName(_local_3).content as XML)) as IWindowContainer);
            }
            if (this._mainWindow == null)
            {
                throw (new Error("Failed to construct window from XML!"));
            }
            var _local_4:IWindow = this._mainWindow.findChildByName("button_like");
            if (_local_4)
            {
                _local_4.addEventListener(WindowMouseEvent.CLICK, this._Str_23518);
            }
            _local_4 = this._mainWindow.findChildByName("button_dislike");
            if (_local_4)
            {
                _local_4.addEventListener(WindowMouseEvent.CLICK, this._Str_24275);
            }
            if (_arg_2 != null)
            {
                this._Str_17234 = _arg_2;
            }
            this._mainWindow.findChildByName("quiz_topic").caption = this._Str_17234;
            this._mainWindow.findChildByName("quiz_topic").width = Math.min(660, (this._Str_23335(k, this._Str_17234) + 6));
            this._mainWindow.findChildByName("quiz_topic").y = 3;
            this._Str_15735();
            this._mainWindow.desktop.addEventListener(WindowEvent.WINDOW_EVENT_RESIZED, this._Str_3630);
        }

        public function removeWindow():void
        {
            if (((!(this._mainWindow)) || (this._mainWindow.numChildren == 0)))
            {
                return;
            }
            if (_Str_12004)
            {
                this._mainWindow.removeChildAt(0).dispose();
            }
            else
            {
                this._mainWindow.desktop.addEventListener(WindowEvent.WINDOW_EVENT_RESIZED, this._Str_3630);
                this._mainWindow.dispose();
                this._mainWindow = null;
            }
            if (this._Str_3891)
            {
                this._Str_3891.reset();
                this._Str_3891 = null;
            }
        }

        public function get mainWindow():IWindow
        {
            return this._mainWindow;
        }

        public function _Str_6423(k:String):void
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

        public function _Str_19343(k:Map):void
        {
            if (((!(this._mainWindow)) || (!(k))))
            {
                return;
            }
            var _local_2:int = ((k[WordQuizWidget._Str_13786] != null) ? k.getValue(WordQuizWidget._Str_13786) : 0);
            var _local_3:ILabelWindow = (this._mainWindow.findChildByName("lbl_dislike_count") as ILabelWindow);
            if (_local_3)
            {
                _local_3.text = _local_2.toString();
            }
            _local_2 = ((k[WordQuizWidget._Str_9438] != null) ? k.getValue(WordQuizWidget._Str_9438) : 0);
            _local_3 = (this._mainWindow.findChildByName("lbl_like_count") as ILabelWindow);
            if (_local_3)
            {
                _local_3.text = _local_2.toString();
            }
        }

        public function _Str_21186(k:Map):void
        {
            this.createWindow(WordQuizView._Str_14885);
            this._Str_19343(k);
            this._Str_3891 = new Timer(_Str_18458);
            this._Str_3891.addEventListener(TimerEvent.TIMER, this._Str_12609);
            this._Str_3891.start();
        }

        private function _Str_12609(k:TimerEvent):void
        {
            this.removeWindow();
        }

        private function _Str_23518(k:WindowMouseEvent):void
        {
            this._Str_2268._Str_20809(1);
        }

        private function _Str_24275(k:WindowMouseEvent):void
        {
            this._Str_2268._Str_20809(0);
        }

        private function _Str_3630(k:WindowEvent):void
        {
            this._Str_15735();
        }

        private function _Str_15735():void
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
