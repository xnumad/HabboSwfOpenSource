package com.sulake.habbo.help
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.window.utils.IModalDialog;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.ISelectorListWindow;
    import com.sulake.core.window.components.ISelectableWindow;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.communication.messages.incoming.help.QuizDataMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.help.QuizResultsMessageEvent;
    import com.sulake.habbo.communication.messages.outgoing.help.GetQuizQuestionsComposer;
    import com.sulake.habbo.communication.messages.parser.help.QuizDataMessageParser;
    import com.sulake.habbo.communication.messages.parser.help.QuizResultsMessageParser;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.communication.messages.outgoing.help.PostQuizAnswersComposer;

    public class HabboWayQuizController implements IDisposable 
    {
        private static const HABBO_WAY_QUIZ_CODE:String = "HabboWay1";
        private static const SAFETY_QUIZ_CODE:String = "SafetyQuiz1";
        private static const PAGE_QUESTION:int = 1;
        private static const PAGE_SUCCESS:int = 2;
        private static const PAGE_FAILURE:int = 3;
        private static const PAGE_ANALYSIS:int = 4;

        private var _disposed:Boolean;
        private var _habboHelp:HabboHelp;
        private var _dialog:IModalDialog;
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
            this._habboHelp.communicationManager.addHabboConnectionMessageEvent(new QuizDataMessageEvent(this.onQuizData));
            this._habboHelp.communicationManager.addHabboConnectionMessageEvent(new QuizResultsMessageEvent(this.onQuizResults));
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

        public function showHabboWayQuiz():void
        {
            this._habboHelp.sendMessage(new GetQuizQuestionsComposer(HABBO_WAY_QUIZ_CODE));
        }

        public function showSafetyQuiz():void
        {
            this._habboHelp.sendMessage(new GetQuizQuestionsComposer(SAFETY_QUIZ_CODE));
        }

        private function onQuizData(k:QuizDataMessageEvent):void
        {
            var _local_2:QuizDataMessageParser = k.getParser();
            this._habboHelp._Str_24844();
            this._habboHelp._Str_21195();
            this.showWindow(_local_2._Str_21852, _local_2._Str_25814);
        }

        private function onQuizResults(k:QuizResultsMessageEvent):void
        {
            var _local_2:QuizResultsMessageParser = k.getParser();
            this._questionIdsForWrongAnswers = _local_2._Str_23947;
            if (this._questionIdsForWrongAnswers.length == 0)
            {
                this.showPage(PAGE_SUCCESS);
            }
            else
            {
                this.showPage(PAGE_FAILURE);
            }
        }

        private function showWindow(k:String, _arg_2:Array):void
        {
            this.closeWindow();
            this._dialog = this._habboHelp.getModalXmlWindow("habbo_way_quiz");
            this._window = IWindowContainer(this._dialog.rootWindow);
            this._window.procedure = this.onWindowEvent;
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
            this._answerIds = new Array(this.questionCount);
            this._answerOrders = new Array(this.questionCount);
            this.setCurrentQuestion(0);
            var _local_3:IWindowContainer = IWindowContainer(IItemListWindow(this._explanationTemplate).getListItemByName("explanation_container"));
            switch (this._quizCode)
            {
                case HABBO_WAY_QUIZ_CODE:
                    IStaticBitmapWrapperWindow(this._window.findChildByName("question_illustration")).assetUri = "${image.library.url}habboway/quiz_question.png";
                    IStaticBitmapWrapperWindow(this._window.findChildByName("indicator_image")).assetUri = "help_habboway_dove_on";
                    IStaticBitmapWrapperWindow(this._window.findChildByName("success_illustration")).assetUri = "${image.library.url}habboway/quiz_success.png";
                    IStaticBitmapWrapperWindow(_local_3.findChildByName("explanation_illustration")).assetUri = "help_habboway_dove_quizz";
                    break;
                case SAFETY_QUIZ_CODE:
                    IStaticBitmapWrapperWindow(this._window.findChildByName("question_illustration")).assetUri = "${image.library.url}safetyquiz/question_illustration.png";
                    IStaticBitmapWrapperWindow(this._window.findChildByName("indicator_image")).assetUri = "${image.library.url}safetyquiz/safety_on.png";
                    IStaticBitmapWrapperWindow(this._window.findChildByName("failure_illustration")).assetUri = "${image.library.url}safetyquiz/result_failure.png";
                    IStaticBitmapWrapperWindow(this._window.findChildByName("success_illustration")).assetUri = "${image.library.url}safetyquiz/result_success.png";
                    IStaticBitmapWrapperWindow(_local_3.findChildByName("explanation_illustration")).assetUri = "${image.library.url}safetyquiz/safety_on.png";
                    break;
            }
            this.showPage(PAGE_QUESTION);
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

        private function showPage(k:int):void
        {
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            var _local_7:IItemListWindow;
            var _local_8:String;
            var _local_9:String;
            this._window.findChildByName("question_pane").visible = (k == PAGE_QUESTION);
            this._window.findChildByName("success_pane").visible = (k == PAGE_SUCCESS);
            this._window.findChildByName("failure_pane").visible = (k == PAGE_FAILURE);
            this._analysisPane.visible = (k == PAGE_ANALYSIS);
            this._window.findChildByName("prev_next_buttons").visible = (k == PAGE_QUESTION);
            this._window.findChildByName("failure_buttons").visible = (k == PAGE_FAILURE);
            this._window.findChildByName("exit_button_container").visible = ((k == PAGE_SUCCESS) || (k == PAGE_ANALYSIS));
            var _local_2:IWindow = this._window.findChildByName("top_indicator");
            var _local_3:IWindow = this._window.findChildByName("indicator_image");
            switch (k)
            {
                case PAGE_QUESTION:
                    this._window.caption = this.getFullLocalizationKey("question.title");
                    _local_3.visible = true;
                    _local_2.visible = true;
                    _local_2.caption = this._habboHelp.localization.getLocalizationWithParams(this.getRawLocalizationKey("question.page"), "", "current_page", 1, "page_count", this.questionCount.toString());
                    _local_2.caption = this.getFullLocalizationKey("question.page");
                    return;
                case PAGE_SUCCESS:
                    this._window.caption = this.getFullLocalizationKey("success.title");
                    this._window.findChildByName("failure_advice").caption = this.getFullLocalizationKey("failure.advice");
                    this._window.findChildByName("success_results").caption = this._habboHelp.localization.getLocalizationWithParams(this.getRawLocalizationKey("success.results"), "", "question_count", this.questionCount.toString());
                    _local_3.visible = false;
                    _local_2.visible = false;
                    _local_2.caption = "";
                    return;
                case PAGE_FAILURE:
                    _local_4 = (this._questionIds.length - this._questionIdsForWrongAnswers.length);
                    this._window.caption = this.getFullLocalizationKey("failure.title");
                    this._window.findChildByName("failure_advice").caption = this.getFullLocalizationKey("failure.advice");
                    this._window.findChildByName("failure_results").caption = this._habboHelp.localization.getLocalizationWithParams(this.getRawLocalizationKey("failure.results"), "", "correct_count", _local_4.toString(), "total_count", this.questionCount.toString());
                    _local_3.visible = false;
                    _local_2.visible = false;
                    _local_2.caption = "";
                    return;
                case PAGE_ANALYSIS:
                    this._window.caption = this.getFullLocalizationKey("analysis.title");
                    _local_3.visible = true;
                    _local_2.visible = true;
                    _local_2.caption = this.getFullLocalizationKey("analysis.top");
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

        private function onWindowEvent(k:WindowEvent, _arg_2:IWindow):void
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
                        this.setCurrentQuestion((this._currentQuestion - 1));
                        return;
                    case "next_button":
                        this.setCurrentQuestion((this._currentQuestion + 1));
                        return;
                    case "review_button":
                        this.showPage(PAGE_ANALYSIS);
                        return;
                }
            }
        }

        private function setCurrentQuestion(k:int):void
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
            if (k >= this.questionCount)
            {
                this._habboHelp.sendMessage(new PostQuizAnswersComposer(this._quizCode, this._answerIds));
            }
            else
            {
                if (k >= 0)
                {
                    this._currentQuestion = k;
                    this._window.findChildByName("prev_dimmer").visible = (k <= 0);
                    this._window.findChildByName("next_dimmer").visible = (this._answerIds[this._currentQuestion] == null);
                    this._window.findChildByName("top_indicator").caption = this._habboHelp.localization.getLocalizationWithParams(this.getRawLocalizationKey("question.page"), "", "current_page", String((k + 1)), "page_count", this.questionCount.toString());
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

        private function get questionCount():int
        {
            return (this._questionIds != null) ? this._questionIds.length : 0;
        }

        private function getFullLocalizationKey(k:String):String
        {
            return ("${" + this.getRawLocalizationKey(k)) + "}";
        }

        private function getRawLocalizationKey(k:String):String
        {
            switch (this._quizCode)
            {
                case HABBO_WAY_QUIZ_CODE:
                    return "habbo.way.quiz." + k;
                default:
                    return (("quiz." + this._quizCode) + ".") + k;
            }
        }
    }
}
