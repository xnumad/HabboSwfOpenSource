package com.sulake.habbo.help
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.window.utils._Str_2784;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.ISelectorListWindow;
    import com.sulake.core.window.components.ISelectableWindow;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.communication.messages.incoming.help._Str_9419;
    import com.sulake.habbo.communication.messages.incoming.help._Str_8785;
    import com.sulake.habbo.communication.messages.outgoing.help._Str_8147;
    import com.sulake.habbo.communication.messages.parser.help._Str_8043;
    import com.sulake.habbo.communication.messages.parser.help._Str_7308;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.communication.messages.outgoing.help.PostQuizAnswersComposer;

    public class HabboWayQuizController implements IDisposable 
    {
        private static const _Str_10976:String = "HabboWay1";
        private static const _Str_14005:String = "SafetyQuiz1";
        private static const _Str_8904:int = 1;
        private static const _Str_8615:int = 2;
        private static const _Str_9704:int = 3;
        private static const _Str_8334:int = 4;

        private var _disposed:Boolean;
        private var _habboHelp:HabboHelp;
        private var _dialog:_Str_2784;
        private var _window:IWindowContainer;
        private var _questionPane:IWindowContainer;
        private var _answerList:ISelectorListWindow;
        private var _answerTemplate:ISelectableWindow;
        private var _analysisPane:IItemListWindow;
        private var _explanationTemplate:IWindow;
        private var _quizCode:String;
        private var _questionIds:Array;
        private var _answerIds:Array;
        private var _answerOrders:Array;
        private var _questionIdsForWrongAnswers:Array;
        private var _currentQuestion:int;

        public function HabboWayQuizController(k:HabboHelp)
        {
            this._habboHelp = k;
            this._habboHelp.communicationManager.addHabboConnectionMessageEvent(new _Str_9419(this._Str_23120));
            this._habboHelp.communicationManager.addHabboConnectionMessageEvent(new _Str_8785(this._Str_24077));
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                this._questionPane = null;
                this._answerList = null;
                if (this._answerTemplate != null)
                {
                    this._answerTemplate.dispose();
                    this._answerTemplate = null;
                }
                this._analysisPane = null;
                if (this._explanationTemplate != null)
                {
                    this._explanationTemplate.dispose();
                    this._explanationTemplate = null;
                }
                this.closeWindow();
                this._disposed = true;
            }
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function _Str_16933():void
        {
            this._habboHelp._Str_2488(new _Str_8147(_Str_10976));
        }

        public function _Str_14041():void
        {
            this._habboHelp._Str_2488(new _Str_8147(_Str_14005));
        }

        private function _Str_23120(k:_Str_9419):void
        {
            var _local_2:_Str_8043 = k.getParser();
            this._habboHelp._Str_24844();
            this._habboHelp._Str_21195();
            this._Str_3360(_local_2._Str_21852, _local_2._Str_25814);
        }

        private function _Str_24077(k:_Str_8785):void
        {
            var _local_2:_Str_7308 = k.getParser();
            this._questionIdsForWrongAnswers = _local_2._Str_23947;
            if (this._questionIdsForWrongAnswers.length == 0)
            {
                this._Str_13401(_Str_8615);
            }
            else
            {
                this._Str_13401(_Str_9704);
            }
        }

        private function _Str_3360(k:String, _arg_2:Array):void
        {
            this.closeWindow();
            this._dialog = this._habboHelp._Str_4804("habbo_way_quiz");
            this._window = IWindowContainer(this._dialog._Str_2429);
            this._window.procedure = this._Str_3061;
            this._questionPane = IWindowContainer(this._window.findChildByName("question_pane"));
            this._answerList = ISelectorListWindow(this._questionPane.findChildByName("answer_list"));
            this._answerTemplate = this._answerList.getSelectableAt(0);
            this._answerList.removeSelectable(this._answerTemplate);
            this._analysisPane = IItemListWindow(this._window.findChildByName("analysis_pane"));
            this._explanationTemplate = this._analysisPane.getListItemAt(0);
            this._analysisPane.removeListItems();
            this._analysisPane.spacing = 4;
            this._quizCode = k;
            this._questionIds = _arg_2;
            this._answerIds = new Array(this._Str_8127);
            this._answerOrders = new Array(this._Str_8127);
            this._Str_18391(0);
            var _local_3:IWindowContainer = IWindowContainer(IItemListWindow(this._explanationTemplate).getListItemByName("explanation_container"));
            switch (this._quizCode)
            {
                case _Str_10976:
                    IStaticBitmapWrapperWindow(this._window.findChildByName("question_illustration")).assetUri = "${image.library.url}habboway/quiz_question.png";
                    IStaticBitmapWrapperWindow(this._window.findChildByName("indicator_image")).assetUri = "help_habboway_dove_on";
                    IStaticBitmapWrapperWindow(this._window.findChildByName("success_illustration")).assetUri = "${image.library.url}habboway/quiz_success.png";
                    IStaticBitmapWrapperWindow(_local_3.findChildByName("explanation_illustration")).assetUri = "help_habboway_dove_quizz";
                    break;
                case _Str_14005:
                    IStaticBitmapWrapperWindow(this._window.findChildByName("question_illustration")).assetUri = "${image.library.url}safetyquiz/question_illustration.png";
                    IStaticBitmapWrapperWindow(this._window.findChildByName("indicator_image")).assetUri = "${image.library.url}safetyquiz/safety_on.png";
                    IStaticBitmapWrapperWindow(this._window.findChildByName("failure_illustration")).assetUri = "${image.library.url}safetyquiz/result_failure.png";
                    IStaticBitmapWrapperWindow(this._window.findChildByName("success_illustration")).assetUri = "${image.library.url}safetyquiz/result_success.png";
                    IStaticBitmapWrapperWindow(_local_3.findChildByName("explanation_illustration")).assetUri = "${image.library.url}safetyquiz/safety_on.png";
                    break;
            }
            this._Str_13401(_Str_8904);
        }

        private function closeWindow():void
        {
            this._window = null;
            if (this._dialog != null)
            {
                this._dialog.dispose();
                this._dialog = null;
            }
        }

        private function _Str_13401(k:int):void
        {
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            var _local_7:IItemListWindow;
            var _local_8:String;
            var _local_9:String;
            this._window.findChildByName("question_pane").visible = (k == _Str_8904);
            this._window.findChildByName("success_pane").visible = (k == _Str_8615);
            this._window.findChildByName("failure_pane").visible = (k == _Str_9704);
            this._analysisPane.visible = (k == _Str_8334);
            this._window.findChildByName("prev_next_buttons").visible = (k == _Str_8904);
            this._window.findChildByName("failure_buttons").visible = (k == _Str_9704);
            this._window.findChildByName("exit_button_container").visible = ((k == _Str_8615) || (k == _Str_8334));
            var _local_2:IWindow = this._window.findChildByName("top_indicator");
            var _local_3:IWindow = this._window.findChildByName("indicator_image");
            switch (k)
            {
                case _Str_8904:
                    this._window.caption = this._Str_6820("question.title");
                    _local_3.visible = true;
                    _local_2.visible = true;
                    _local_2.caption = this._habboHelp.localization.getLocalizationWithParams(this._Str_11458("question.page"), "", "current_page", 1, "page_count", this._Str_8127.toString());
                    _local_2.caption = this._Str_6820("question.page");
                    return;
                case _Str_8615:
                    this._window.caption = this._Str_6820("success.title");
                    this._window.findChildByName("failure_advice").caption = this._Str_6820("failure.advice");
                    this._window.findChildByName("success_results").caption = this._habboHelp.localization.getLocalizationWithParams(this._Str_11458("success.results"), "", "question_count", this._Str_8127.toString());
                    _local_3.visible = false;
                    _local_2.visible = false;
                    _local_2.caption = "";
                    return;
                case _Str_9704:
                    _local_4 = (this._questionIds.length - this._questionIdsForWrongAnswers.length);
                    this._window.caption = this._Str_6820("failure.title");
                    this._window.findChildByName("failure_advice").caption = this._Str_6820("failure.advice");
                    this._window.findChildByName("failure_results").caption = this._habboHelp.localization.getLocalizationWithParams(this._Str_11458("failure.results"), "", "correct_count", _local_4.toString(), "total_count", this._Str_8127.toString());
                    _local_3.visible = false;
                    _local_2.visible = false;
                    _local_2.caption = "";
                    return;
                case _Str_8334:
                    this._window.caption = this._Str_6820("analysis.title");
                    _local_3.visible = true;
                    _local_2.visible = true;
                    _local_2.caption = this._Str_6820("analysis.top");
                    for each (_local_5 in this._questionIdsForWrongAnswers)
                    {
                        _local_6 = this._answerIds[this._questionIds.indexOf(_local_5)];
                        _local_7 = IItemListWindow(this._explanationTemplate.clone());
                        _local_8 = (("${quiz." + this._quizCode) + ".");
                        _local_9 = (((("." + _local_5) + ".") + _local_6) + "}");
                        _local_7.getListItemByName("question").caption = (((_local_8 + "question.") + _local_5) + "}");
                        IWindowContainer(_local_7.getListItemByName("answer_container")).findChildByName("answer").caption = ((_local_8 + "answer") + _local_9);
                        IWindowContainer(_local_7.getListItemByName("explanation_container")).findChildByName("explanation").caption = ((_local_8 + "explanation") + _local_9);
                        this._analysisPane.addListItem(_local_7);
                    }
                    IItemListWindow(this._analysisPane.getListItemAt((this._analysisPane.numListItems - 1))).getListItemByName("separator").dispose();
                    return;
            }
        }

        private function _Str_3061(k:WindowEvent, _arg_2:IWindow):void
        {
            if ((((this._disposed) || (this._window == null)) || (!(k.type == WindowMouseEvent.CLICK))))
            {
                return;
            }
            if ((_arg_2 is ISelectableWindow))
            {
                this._answerIds[this._currentQuestion] = int(_arg_2.name);
                this._window.findChildByName("next_dimmer").visible = false;
            }
            else
            {
                switch (_arg_2.name)
                {
                    case "header_button_close":
                    case "exit_button":
                        this.closeWindow();
                        return;
                    case "prev_button":
                        this._Str_18391((this._currentQuestion - 1));
                        return;
                    case "next_button":
                        this._Str_18391((this._currentQuestion + 1));
                        return;
                    case "review_button":
                        this._Str_13401(_Str_8334);
                        return;
                }
            }
        }

        private function _Str_18391(k:int):void
        {
            var _local_2:int;
            var _local_3:Array;
            var _local_4:int;
            var _local_5:ISelectableWindow;
            var _local_6:String;
            var _local_7:ISelectableWindow;
            var _local_8:int;
            var _local_9:ISelectableWindow;
            var _local_10:int;
            if (k >= this._Str_8127)
            {
                this._habboHelp._Str_2488(new PostQuizAnswersComposer(this._quizCode, this._answerIds));
            }
            else
            {
                if (k >= 0)
                {
                    this._currentQuestion = k;
                    this._window.findChildByName("prev_dimmer").visible = (k <= 0);
                    this._window.findChildByName("next_dimmer").visible = (this._answerIds[this._currentQuestion] == null);
                    this._window.findChildByName("top_indicator").caption = this._habboHelp.localization.getLocalizationWithParams(this._Str_11458("question.page"), "", "current_page", String((k + 1)), "page_count", this._Str_8127.toString());
                    while (this._answerList.numSelectables > 0)
                    {
                        this._answerList.removeSelectable(this._answerList.getSelectableAt(0)).dispose();
                    }
                    _local_2 = this._questionIds[this._currentQuestion];
                    _local_3 = [];
                    this._questionPane.findChildByName("question").caption = (((("${quiz." + this._quizCode) + ".question.") + _local_2) + "}");
                    _local_4 = 0;
                    while (true)
                    {
                        _local_6 = this._habboHelp.localization.getLocalization(((((("quiz." + this._quizCode) + ".answer.") + _local_2) + ".") + _local_4), "");
                        if (_local_6.length > 0)
                        {
                            _local_7 = ISelectableWindow(this._answerTemplate.clone());
                            _local_7.caption = _local_6;
                            _local_7.name = _local_4.toString();
                            _local_3.push(_local_7);
                        }
                        else
                        {
                            break;
                        }
                        _local_4++;
                    }
                    if (this._answerOrders[this._currentQuestion] == null)
                    {
                        this._answerOrders[this._currentQuestion] = [];
                        _local_8 = 0;
                        while (_local_8 < _local_4)
                        {
                            _local_9 = _local_3.splice(int((Math.random() * _local_3.length)), 1)[0];
                            this._answerList.addSelectable(_local_9);
                            this._answerOrders[this._currentQuestion].push(int(_local_9.name));
                            _local_8++;
                        }
                    }
                    else
                    {
                        for each (_local_10 in this._answerOrders[this._currentQuestion])
                        {
                            this._answerList.addSelectable(_local_3[_local_10]);
                        }
                    }
                    _local_5 = this._answerList.getSelectableByName(String(this._answerIds[this._currentQuestion]));
                    if (_local_5 != null)
                    {
                        _local_5.select();
                    }
                }
            }
        }

        private function get _Str_8127():int
        {
            return (this._questionIds != null) ? this._questionIds.length : 0;
        }

        private function _Str_6820(k:String):String
        {
            return ("${" + this._Str_11458(k)) + "}";
        }

        private function _Str_11458(k:String):String
        {
            switch (this._quizCode)
            {
                case _Str_10976:
                    return "habbo.way.quiz." + k;
                default:
                    return (("quiz." + this._quizCode) + ".") + k;
            }
        }
    }
}
