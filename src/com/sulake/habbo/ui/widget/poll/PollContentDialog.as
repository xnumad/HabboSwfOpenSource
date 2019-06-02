package com.sulake.habbo.ui.widget.poll
{
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.habbo.communication.messages.parser.poll.PollQuestion;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.communication.enum.poll.QuestionType;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.parser.poll._Str_4224;
    import com.sulake.core.window.components.ISelectorWindow;
    import com.sulake.core.window.components.ISelectableWindow;
    import com.sulake.core.window.components.ICheckBoxWindow;
    import com.sulake.core.window.enum.WindowState;
    import com.sulake.habbo.window.utils._Str_2418;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetPollMessage;

    public class PollContentDialog implements _Str_7707 
    {
        private var _id:int = -1;
        private var _disposed:Boolean = false;
        private var _window:IFrameWindow;
        private var _widget:RoomPollWidget;
        private var _cancelWindow:IFrameWindow;
        private var _started:Boolean = false;
        private var _questions:Array;
        private var _question:int = -1;
        private var _answerableQuestions:int = 0;
        private var _parentQuestionId:int = -1;
        private var _npsPoll:Boolean = false;
        private var _nextQuestionType:int = 0;
        private var _currentQuestion:PollQuestion = null;

        public function PollContentDialog(k:int, _arg_2:String, _arg_3:Array, _arg_4:RoomPollWidget, _arg_5:Boolean)
        {
            var _local_7:ITextWindow;
            var _local_8:IWindow;
            var _local_9:IWindow;
            var _local_10:IWindow;
            super();
            this._id = k;
            this._questions = _arg_3;
            this._widget = _arg_4;
            this._npsPoll = _arg_5;
            this._Str_22698();
            var _local_6:XmlAsset = (this._widget.assets.getAssetByName("poll_question") as XmlAsset);
            if (_local_6 != null)
            {
                this._window = (this._widget.windowManager.buildFromXML((_local_6.content as XML)) as IFrameWindow);
                _local_7 = (this._window.findChildByName("poll_question_headline") as ITextWindow);
                if (_local_7)
                {
                    _local_7.text = _arg_2;
                }
                this._window.center();
                _local_8 = this._window.findChildByName("header_button_close");
                if (_local_8 != null)
                {
                    _local_8.addEventListener(WindowMouseEvent.CLICK, this.onCloseHandler);
                }
                _local_9 = this._window.findChildByName("poll_question_button_ok");
                if (_local_9 != null)
                {
                    _local_9.addEventListener(WindowMouseEvent.CLICK, this._Str_6167);
                }
                _local_10 = this._window.findChildByName("poll_question_cancel");
                if (_local_10 != null)
                {
                    _local_10.addEventListener(WindowMouseEvent.CLICK, this._Str_26455);
                }
            }
        }

        public function start():void
        {
            if (!this._started)
            {
                this._started = true;
                this._Str_15945();
            }
        }

        private function onCloseHandler(k:WindowEvent):void
        {
            this._Str_19369();
        }

        private function _Str_6167(k:WindowEvent):void
        {
            this._Str_25169();
        }

        private function _Str_26455(k:WindowEvent):void
        {
            this._Str_19369();
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            this._disposed = true;
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
            if (this._cancelWindow)
            {
                this._cancelWindow.dispose();
                this._cancelWindow = null;
            }
            this._widget = null;
            this._questions = null;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        private function _Str_15945():void
        {
            var k:ITextWindow;
            var _local_2:IWindowContainer;
            var _local_3:IItemListWindow;
            var _local_4:String;
            var _local_5:int;
            this._currentQuestion = this._Str_23856();
            if (this._currentQuestion)
            {
                if (this._window != null)
                {
                    k = (this._window.findChildByName("poll_question_text") as ITextWindow);
                    if (k != null)
                    {
                        k.text = this._currentQuestion._Str_18860;
                    }
                    k = (this._window.findChildByName("poll_question_number") as ITextWindow);
                    if (k != null)
                    {
                        k.text = "${poll_question_number}";
                        _local_4 = k.text;
                        _local_4 = _local_4.replace("%number%", (this._question + 1));
                        _local_4 = _local_4.replace("%count%", this._answerableQuestions);
                        k.text = _local_4;
                    }
                    _local_2 = (this._window.findChildByName("poll_question_answer_container") as IWindowContainer);
                    if (_local_2 != null)
                    {
                        while (_local_2.numChildren > 0)
                        {
                            _local_2.getChildAt(0).dispose();
                        }
                        _local_2.invalidate();
                    }
                    switch (this._currentQuestion._Str_7200)
                    {
                        case QuestionType._Str_7537:
                            this._Str_24518(_local_2, this._currentQuestion._Str_6909);
                            break;
                        case QuestionType._Str_7059:
                            this._parser6(_local_2, this._currentQuestion._Str_6909);
                            break;
                        case QuestionType._Str_13062:
                            this._Str_22247(_local_2);
                            break;
                        case QuestionType._Str_15228:
                            this._Str_23290(_local_2);
                            break;
                        default:
                            this._Str_15945();
                    }
                    _local_3 = (this._window.findChildByName("poll_content_wrapper") as IItemListWindow);
                    if (_local_3 != null)
                    {
                        _local_5 = (_local_3.visibleRegion.height - _local_3._Str_3707.height);
                        this._window.height = (this._window.height + _local_5);
                        this._window.center();
                    }
                }
            }
            else
            {
                this._widget._Str_24255(this._id);
            }
        }

        private function _Str_23856():PollQuestion
        {
            var k:PollQuestion;
            var _local_2:int;
            var _local_3:PollQuestion;
            if ((((this._npsPoll) && (this._parentQuestionId >= 0)) && (!(this._nextQuestionType == PollQuestion._Str_12458))))
            {
                k = this._questions[this._parentQuestionId];
                _local_2 = 0;
                while (_local_2 < k.children.length)
                {
                    _local_3 = k.children[_local_2];
                    if (((_local_3) && (_local_3._Str_18099 == this._nextQuestionType)))
                    {
                        this._parentQuestionId = -1;
                        return _local_3;
                    }
                    _local_2++;
                }
            }
            this._question++;
            if (this._question < this._questions.length)
            {
                this._parentQuestionId = this._question;
                return this._questions[this._question];
            }
            return null;
        }

        private function _Str_24518(k:IWindowContainer, _arg_2:Vector.<_Str_4224>):void
        {
            var _local_3:XmlAsset = (this._widget.assets.getAssetByName("poll_answer_radiobutton_input") as XmlAsset);
            if (!_local_3)
            {
                throw (new Error('Asset for poll widget hot found: "poll_answer_radiobutton_input"!'));
            }
            var _local_4:IWindowContainer = (this._widget.windowManager.buildFromXML((_local_3.content as XML)) as IWindowContainer);
            if (_local_4 != null)
            {
                this._Str_21700(_arg_2, _local_4);
                k.addChild(_local_4);
            }
        }

        private function _Str_23831(k:PollQuestion):Array
        {
            var _local_3:ISelectorWindow;
            var _local_4:ISelectableWindow;
            var _local_5:_Str_4224;
            var _local_2:Array = new Array();
            if (this._window != null)
            {
                _local_3 = (this._window.findChildByName("poll_answer_selector") as ISelectorWindow);
                if (_local_3)
                {
                    _local_4 = _local_3.getSelected();
                    if (_local_4)
                    {
                        _local_5 = k._Str_6909[_local_4.id];
                        if (this._npsPoll)
                        {
                            this._nextQuestionType = _local_5._Str_19972;
                        }
                        else
                        {
                            this._nextQuestionType = PollQuestion._Str_12458;
                        }
                        _local_2.push(_local_5.value);
                    }
                }
            }
            return _local_2;
        }

        private function _parser6(k:IWindowContainer, _arg_2:Vector.<_Str_4224>):void
        {
            var _local_3:XmlAsset = (this._widget.assets.getAssetByName("poll_answer_checkbox_input") as XmlAsset);
            if (!_local_3)
            {
                throw (new Error('Asset for poll widget hot found: "poll_answer_checkbox_input"!'));
            }
            var _local_4:IWindowContainer = (this._widget.windowManager.buildFromXML((_local_3.content as XML)) as IWindowContainer);
            if (_local_4 != null)
            {
                this._Str_21700(_arg_2, _local_4);
                k.addChild(_local_4);
            }
        }

        private function _Str_22504(k:PollQuestion):Array
        {
            var _local_3:IItemListWindow;
            var _local_4:int;
            var _local_5:IWindowContainer;
            var _local_6:ICheckBoxWindow;
            var _local_2:Array = new Array();
            if (this._window != null)
            {
                _local_3 = (this._window.findChildByName("poll_answer_itemlist") as IItemListWindow);
                if (_local_3 != null)
                {
                    _local_4 = 0;
                    while (_local_4 < _local_3.numListItems)
                    {
                        _local_5 = (_local_3.getListItemAt(_local_4) as IWindowContainer);
                        if (_local_5 != null)
                        {
                            _local_6 = (_local_5.findChildByName("poll_answer_checkbox") as ICheckBoxWindow);
                            if (_local_6 != null)
                            {
                                if (_local_6.testStateFlag(WindowState.SELECTED))
                                {
                                    _local_2.push(k._Str_6909[_local_4].value);
                                }
                            }
                        }
                        _local_4++;
                    }
                }
            }
            return _local_2;
        }

        private function _Str_21700(k:Vector.<_Str_4224>, _arg_2:IWindowContainer):void
        {
            var _local_4:IWindowContainer;
            var _local_5:int;
            var _local_6:ITextWindow;
            var _local_7:IWindow;
            var _local_3:IItemListWindow = (_arg_2.findChildByName("poll_answer_itemlist") as IItemListWindow);
            if (_local_3 != null)
            {
                _local_4 = (_arg_2.findChildByName("poll_answer_entity") as IWindowContainer);
                if (_local_4 != null)
                {
                    _local_5 = 0;
                    while (_local_5 < (k.length - 1))
                    {
                        _local_5++;
                        _local_3.addListItem(_local_4.clone());
                    }
                    _local_5 = 0;
                    while (_local_5 < k.length)
                    {
                        _local_4 = (_local_3.getListItemAt(_local_5) as IWindowContainer);
                        _local_6 = (_local_4.findChildByName("poll_answer_entity_text") as ITextWindow);
                        if (_local_6)
                        {
                            _local_6.text = k[_local_5].choiceText;
                        }
                        _local_7 = _local_4.findChildByTag("POLL_SELECTABLE_ITEM");
                        if (_local_7)
                        {
                            _local_7.id = _local_5;
                        }
                        _local_5++;
                    }
                }
            }
        }

        private function _Str_22247(k:IWindowContainer):void
        {
            var _local_2:XmlAsset = (this._widget.assets.getAssetByName("poll_answer_text_input") as XmlAsset);
            if (!_local_2)
            {
                throw (new Error('Asset for poll widget hot found: "poll_answer_text_input"!'));
            }
            k.addChild(this._widget.windowManager.buildFromXML((_local_2.content as XML)));
        }

        private function _Str_21937():Array
        {
            var _local_2:ITextWindow;
            var k:Array = new Array();
            if (this._window != null)
            {
                _local_2 = (this._window.findChildByName("poll_answer_input") as ITextWindow);
                if (_local_2 != null)
                {
                    k.push(_local_2.text);
                }
            }
            else
            {
                throw (new Error("Invalid or disposed poll dialog!"));
            }
            return k;
        }

        private function _Str_23290(k:IWindowContainer):void
        {
            this._Str_22247(k);
        }

        private function _Str_23417():Array
        {
            return this._Str_21937();
        }

        private function _Str_25263():void
        {
            this._widget._Str_12823(this._id);
        }

        private function _Str_25169():void
        {
            var answerArray:Array;
            var answerValue:int;
            var question:PollQuestion;
            if (((this._npsPoll) && (this._currentQuestion)))
            {
                question = this._currentQuestion;
            }
            else
            {
                question = this._questions[this._question];
            }
            this._nextQuestionType = PollQuestion._Str_12458;
            switch (question._Str_7200)
            {
                case QuestionType._Str_7537:
                    answerArray = this._Str_23831(question);
                    break;
                case QuestionType._Str_7059:
                    answerArray = this._Str_22504(question);
                    if (answerArray.length < 0)
                    {
                        this._widget.windowManager.alert("${win_error}", "${poll_alert_answer_missing}", 0, function (k:_Str_2418, _arg_2:WindowEvent):void
                        {
                            k.dispose();
                        });
                        return;
                    }
                    if (answerArray.length > question._Str_6909.length)
                    {
                        this._widget.windowManager.alert("${win_error}", "${poll_alert_invalid_selection}", 0, function (k:_Str_2418, _arg_2:WindowEvent):void
                        {
                            k.dispose();
                        });
                        return;
                    }
                    break;
                case QuestionType._Str_13062:
                    answerArray = this._Str_21937();
                    break;
                case QuestionType._Str_15228:
                    answerArray = this._Str_23417();
                    break;
                default:
                    throw (new Error((("Unknown poll question type: " + question._Str_7200) + "!")));
            }
            var answers:Array = new Array();
            var message:RoomWidgetPollMessage = new RoomWidgetPollMessage(RoomWidgetPollMessage.RWPM_ANSWER, this._id);
            message._Str_3218 = question._Str_3218;
            if (question._Str_6909.length > 0)
            {
                for each (answerValue in answerArray)
                {
                    answers.push(answerValue);
                }
            }
            else
            {
                answers.push(answerArray);
            }
            message.answers = answers;
            this._widget.messageListener.processWidgetMessage(message);
            this._Str_15945();
        }

        private function _Str_19369():void
        {
            var k:XmlAsset;
            var _local_2:IWindow;
            var _local_3:IWindow;
            var _local_4:IWindow;
            if (!this._cancelWindow)
            {
                k = (this._widget.assets.getAssetByName("poll_cancel_confirm") as XmlAsset);
                this._cancelWindow = (this._widget.windowManager.buildFromXML((k.content as XML), 2) as IFrameWindow);
                this._cancelWindow.center();
                _local_2 = this._cancelWindow.findChildByName("header_button_close");
                if (_local_2 != null)
                {
                    _local_2.addEventListener(WindowMouseEvent.CLICK, this._Str_24544);
                }
                _local_3 = this._cancelWindow.findChildByName("poll_cancel_confirm_button_ok");
                if (_local_3 != null)
                {
                    _local_3.addEventListener(WindowMouseEvent.CLICK, this._Str_22892);
                }
                _local_4 = this._cancelWindow.findChildByName("poll_cancel_confirm_button_cancel");
                if (_local_4 != null)
                {
                    _local_4.addEventListener(WindowMouseEvent.CLICK, this._Str_24800);
                }
            }
        }

        private function _Str_16903():void
        {
            if (this._cancelWindow != null)
            {
                this._cancelWindow.dispose();
                this._cancelWindow = null;
            }
        }

        private function _Str_24544(k:WindowEvent):void
        {
            this._Str_16903();
        }

        private function _Str_22892(k:WindowEvent):void
        {
            this._Str_16903();
            this._Str_25263();
        }

        private function _Str_24800(k:WindowEvent):void
        {
            this._Str_16903();
        }

        private function _Str_22698():void
        {
            var k:PollQuestion;
            this._answerableQuestions = this._questions.length;
            for each (k in this._questions)
            {
                if (k.children.length > 0)
                {
                    this._answerableQuestions++;
                }
            }
        }
    }
}
